// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<UsersRecord>> procurarUser(
  List<UsersRecord>? userPreFiltred,
  String? input,
) async {
  // Caso não haja input de busca e uma lista pré-filtrada esteja disponível, retorna ela
  if (input == null || input.isEmpty) {
    if (userPreFiltred != null) {
      // Retorna a lista pré-filtrada se nenhum input de busca for fornecido
      return userPreFiltred;
    } else {
      // Busca todos os usuários se não houver lista pré-filtrada
      var allUsersSnapshot =
          await FirebaseFirestore.instance.collection('users').get();
      return allUsersSnapshot.docs
          .map((doc) => UsersRecord.fromSnapshot(doc))
          .toList();
    }
  }

  // Se houver um input de busca e a lista pré-filtrada não for nula, filtra localmente
  if (userPreFiltred != null) {
    return userPreFiltred.where((users) {
      return users.displayName.toLowerCase().contains(input.toLowerCase()) ||
          users.email.toLowerCase().contains(input.toLowerCase()) ||
          //users.userID.toString().contains(input) ||
          users.userID == int.tryParse(input);
    }).toList();
  }

  List<QueryDocumentSnapshot> results = [];

  // Busca no Firestore pelos três aspectos
  var displayNameSnapshot = await FirebaseFirestore.instance
      .collection('users')
      .where('display_name', isEqualTo: input)
      .get();
  results.addAll(displayNameSnapshot.docs);

  var emailSnapshot = await FirebaseFirestore.instance
      .collection('users')
      .where('email', isEqualTo: input)
      .get();
  results.addAll(emailSnapshot.docs);

  var userIDSnapshot = await FirebaseFirestore.instance
      .collection('users')
      .where('userID', isEqualTo: input)
      .get();
  results.addAll(userIDSnapshot.docs);

  // Remove duplicatas e cria lista de UsersRecord
  return results
      .map((doc) => UsersRecord.fromSnapshot(doc))
      .toSet() // Usar toSet para remover possíveis duplicatas
      .toList();
}
