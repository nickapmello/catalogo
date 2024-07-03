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

bool isCPFValido(String cpf) {
  // Remova caracteres não numéricos
  cpf = cpf.replaceAll(RegExp(r'\D'), '');

  // Verifica se o CPF tem 11 dígitos
  if (cpf.length != 11) {
    return false;
  }

  // Verifica se todos os dígitos são iguais
  if (RegExp(r'^(\d)\1+$').hasMatch(cpf)) {
    return false;
  }

  // Calcula o primeiro dígito verificador
  int soma = 0;
  for (int i = 0; i < 9; i++) {
    soma += int.parse(cpf[i]) * (10 - i);
  }
  int digito1 = 11 - (soma % 11);

  // Verifica se o primeiro dígito verificador está correto
  if (digito1 == 10 || digito1 == 11) {
    digito1 = 0;
  }
  if (int.parse(cpf[9]) != digito1) {
    return false;
  }

  // Calcula o segundo dígito verificador
  soma = 0;
  for (int i = 0; i < 10; i++) {
    soma += int.parse(cpf[i]) * (11 - i);
  }
  int digito2 = 11 - (soma % 11);

  // Verifica se o segundo dígito verificador está correto
  if (digito2 == 10 || digito2 == 11) {
    digito2 = 0;
  }
  if (int.parse(cpf[10]) != digito2) {
    return false;
  }

  // Se passou por todas as verificações, o CPF é válido
  return true;
}

Future<String> updateUserCliente(
    BuildContext context,
    String uid, // UID do usuário para atualização
    String emailAddress,
    String displayName,
    String phoneNumber,
    String cpf) async {
  String returnmsg = 'Success';
  DateTime updatedTime = DateTime.now();

  // Verificar se o CPF é válido
  if (!isCPFValido(cpf)) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Erro: CPF inválido'),
        backgroundColor: Colors.red,
      ),
    );
    return 'Erro: CPF inválido';
  }

  try {
    // Verificar se já existe um usuário com o mesmo CPF e se está ativo
    QuerySnapshot cpfSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('cpf', isEqualTo: cpf)
        .limit(1)
        .get();

    if (cpfSnapshot.docs.isNotEmpty && cpfSnapshot.docs.first.id != uid) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro: Outro usuário com o mesmo CPF já existe'),
          backgroundColor: Colors.red,
        ),
      );
      return 'Erro: Outro usuário com o mesmo CPF já existe';
    }

    DocumentReference<Map<String, dynamic>> userRef = FirebaseFirestore.instance
        .collection('users')
        .doc(uid); //uid = documento direto

    // Atualiza o documento existente
    userRef.update({
      'email': emailAddress,
      'display_name': displayName,
      'phone_number': phoneNumber,
      'cpf': cpf,
      'updated_time': updatedTime
    });

    return returnmsg;
  } on FirebaseAuthException catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Erro ao atualizar conta: ${e.message}'),
        backgroundColor: Colors.red,
      ),
    );
    return 'Erro ao atualizar conta: ${e.code}';
  }
}
