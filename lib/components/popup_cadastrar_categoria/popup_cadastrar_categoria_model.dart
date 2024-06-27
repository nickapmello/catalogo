import '/flutter_flow/flutter_flow_util.dart';
import 'popup_cadastrar_categoria_widget.dart'
    show PopupCadastrarCategoriaWidget;
import 'package:flutter/material.dart';

class PopupCadastrarCategoriaModel
    extends FlutterFlowModel<PopupCadastrarCategoriaWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for nomeCategoria widget.
  FocusNode? nomeCategoriaFocusNode;
  TextEditingController? nomeCategoriaTextController;
  String? Function(BuildContext, String?)? nomeCategoriaTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomeCategoriaFocusNode?.dispose();
    nomeCategoriaTextController?.dispose();
  }
}
