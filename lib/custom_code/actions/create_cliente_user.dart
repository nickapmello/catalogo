// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';

Future<String> createClienteUser(
    // Parâmetros
    BuildContext context, // Adiciona o contexto para exibir a Snackbar
    String emailAddress,
    String nome,
    String? phoneNumber,
    String cpf,
    String password,
    String confirmPassword,
    String randomDocGen) async {
  String returnmsg = 'Success';
  DateTime createdTime = DateTime.now();

  if (password != confirmPassword) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Erro: A confirmação da senha não corresponde à senha.'),
        backgroundColor: Colors.red,
      ),
    );
    return 'Error: Password and confirmation password do not match.';
  }

  Future<int> getNextUserID() async {
    final QuerySnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .orderBy('userID')
        .get();

    if (userSnapshot.docs.isEmpty) {
      return 1;
    } else {
      int newId = 1;
      final List<int> usedIds =
          userSnapshot.docs.map((doc) => doc['userID'] as int).toList();
      while (usedIds.contains(newId)) {
        newId++;
      }
      return newId;
    }
  }

  try {
    // Verificar se já existe um usuário com o mesmo CPF e se está ativo
    QuerySnapshot cpfSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('cpf', isEqualTo: cpf)
        .limit(1)
        .get();

    cpfSnapshot.docs.forEach((doc) {
      print('Documento ID: ${doc.id}');
      print('Dados: ${doc.data()}');
    });

    if (cpfSnapshot.docs.isNotEmpty) {
      // Não há usuário com o mesmo CPF ou o usuário associado ao CPF não está inativo
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Erro: Usuário com um mesmo CPF encontrado ou o usuário associado não está inativo'),
          backgroundColor: Colors.red,
        ),
      );
      return 'Erro: Usuário com um mesmo CPF encontrado ou o usuário associado não está inativo';
    }
    // CPF encontrado e usuário associado está inativo, então permitir criar novo usuário

    FirebaseApp secondaryApp = await Firebase.initializeApp(
      name: 'Secundario',
      options: Firebase.app().options,
    );
    UserCredential userCredential =
        await FirebaseAuth.instanceFor(app: secondaryApp)
            .createUserWithEmailAndPassword(
                email: emailAddress, password: password);

    debugPrint(userCredential.toString());

    String? uid = userCredential.user?.uid;

    if (uid != null) {
      int newUserId = await getNextUserID();

      CollectionReference<Map<String, dynamic>> usersRef =
          FirebaseFirestore.instance.collection('users');

      usersRef.doc(uid).set({
        'email': emailAddress.toUpperCase().trim(),
        'display_name': nome,
        'uid': uid,
        'created_time': createdTime,
        'phone_number': phoneNumber,
        'cpf': cpf,
        'lojista': false,
        'userID': newUserId
      });

      print('secondapp deleted');
      await secondaryApp.delete();
      return returnmsg;
    } else {
      return "Error while creating the UID";
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'email-already-in-use') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Usuário com um mesmo email já existe.'),
          backgroundColor: Colors.red,
        ),
      );
      return e.code;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao criar conta: ${e.message}'),
          backgroundColor: Colors.red,
        ),
      );
      return e.code;
    }
  }
}
