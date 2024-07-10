// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<ClienteRecord>> procurarCliente(
  List<ClienteRecord>? clientePreFiltred,
  String? input,
) async {
  // Caso não haja input de busca e uma lista pré-filtrada esteja disponível, retorna ela
  if (input == null || input.isEmpty) {
    if (clientePreFiltred != null) {
      // Retorna a lista pré-filtrada se nenhum input de busca for fornecido
      return clientePreFiltred;
    } else {
      // Busca todos os usuários se não houver lista pré-filtrada
      var allClientesSnapshot =
          await FirebaseFirestore.instance.collection('cliente').get();
      return allClientesSnapshot.docs
          .map((doc) => ClienteRecord.fromSnapshot(doc))
          .toList();
    }
  }

  // Se houver um input de busca e a lista pré-filtrada não for nula, filtra localmente
  if (clientePreFiltred != null) {
    return clientePreFiltred.where((cliente) {
      return cliente.nomeCliente.toLowerCase().contains(input.toLowerCase()) ||
          cliente.emailCliente.toLowerCase().contains(input.toLowerCase());
      //users.userID.toString().contains(input) ||
      //users.userID == int.tryParse(input);
    }).toList();
  }

  List<QueryDocumentSnapshot> results = [];

  // Busca no Firestore pelos três aspectos
  var nomeClienteSnapshot = await FirebaseFirestore.instance
      .collection('cliente')
      .where('nomeCliente', isEqualTo: input)
      .get();
  results.addAll(nomeClienteSnapshot.docs);

  var emailClienteSnapshot = await FirebaseFirestore.instance
      .collection('cliente')
      .where('emailCliente', isEqualTo: input)
      .get();
  results.addAll(emailClienteSnapshot.docs);

  //var userIDSnapshot = await FirebaseFirestore.instance
  //  .collection('cliente')
  //.where('userID', isEqualTo: input)
  //.get();
  //results.addAll(userIDSnapshot.docs);

  // Remove duplicatas e cria lista de ClienteRecord
  return results
      .map((doc) => ClienteRecord.fromSnapshot(doc))
      .toSet() // Usar toSet para remover possíveis duplicatas
      .toList();
}
