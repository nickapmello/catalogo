// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<ProdutoRecord>> procurarProduto(
  List<ProdutoRecord>? produtoPreFiltred,
  String? input,
) async {
  // Caso não haja input de busca e uma lista pré-filtrada esteja disponível, retorna ela
  if (input == null || input.isEmpty) {
    if (produtoPreFiltred != null) {
      // Retorna a lista pré-filtrada se nenhum input de busca for fornecido
      return produtoPreFiltred;
    } else {
      // Busca todas os produtos se não houver lista pré-filtrada
      var allProdutosSnapshot =
          await FirebaseFirestore.instance.collection('produto').get();
      return allProdutosSnapshot.docs
          .map((doc) => ProdutoRecord.fromSnapshot(doc))
          .toList();
    }
  }

  // Se houver um input de busca e a lista pré-filtrada não for nula, filtra localmente
  if (produtoPreFiltred != null) {
    return produtoPreFiltred.where((produto) {
      return produto.nomeProduto.toLowerCase().contains(input.toLowerCase());
    }).toList();
  }

  List<QueryDocumentSnapshot> results = [];

  // Caso contrário, busca no Firestore
  var ProdutoSnapshot = await FirebaseFirestore.instance
      .collection('produto')
      .where('nomeProduto', isEqualTo: input)
      .get();
  results.addAll(ProdutoSnapshot.docs);
  // Remove duplicatas e cria lista de ProdutoRecord
  return results
      .map((doc) => ProdutoRecord.fromSnapshot(doc))
      .toSet() // Usar toSet para remover possíveis duplicatas
      .toList();
}
