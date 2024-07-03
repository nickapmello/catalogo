import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

double? somaValorTotal(List<double>? lista) {
  if (lista == null || lista.isEmpty) {
    return null;
  }
  double total = 0;
  for (double valor in lista) {
    total += valor;
  }
  return total;
}

String saldo(double valor) {
  // formate o valor para a moeda do brasil exemplo "1.000,00
  final formatador = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  return formatador.format(valor);
}
