import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/numero_do_pedido/numero_do_pedido_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'popup_enviar_pedido_widget.dart' show PopupEnviarPedidoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PopupEnviarPedidoModel extends FlutterFlowModel<PopupEnviarPedidoWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ProdutoCarrinhoRecord>? listaProdutosCarrinho;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ClienteRecord? verificarCliente;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PedidoRecord? novoPedidoEnviar;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ClienteRecord? novoCliente;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
