import '/flutter_flow/flutter_flow_util.dart';
import 'popup_editar_categoria_widget.dart' show PopupEditarCategoriaWidget;
import 'package:flutter/material.dart';

class PopupEditarCategoriaModel
    extends FlutterFlowModel<PopupEditarCategoriaWidget> {
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
