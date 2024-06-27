import '/flutter_flow/flutter_flow_util.dart';
import 'trocar_senha_widget.dart' show TrocarSenhaWidget;
import 'package:flutter/material.dart';

class TrocarSenhaModel extends FlutterFlowModel<TrocarSenhaWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for inserirEmail widget.
  FocusNode? inserirEmailFocusNode;
  TextEditingController? inserirEmailTextController;
  String? Function(BuildContext, String?)? inserirEmailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inserirEmailFocusNode?.dispose();
    inserirEmailTextController?.dispose();
  }
}
