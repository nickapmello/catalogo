import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'popup_excluir_produto_widget.dart' show PopupExcluirProdutoWidget;
import 'package:flutter/material.dart';

class PopupExcluirProdutoModel
    extends FlutterFlowModel<PopupExcluirProdutoWidget> {
  ///  State fields for stateful widgets in this component.

  InstantTimer? instantTimer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
