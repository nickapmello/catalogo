import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'reset_senha_widget.dart' show ResetSenhaWidget;
import 'package:flutter/material.dart';

class ResetSenhaModel extends FlutterFlowModel<ResetSenhaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for senha widget.
  FocusNode? senhaFocusNode;
  TextEditingController? senhaTextController;
  String? Function(BuildContext, String?)? senhaTextControllerValidator;
  // State field(s) for confirmarSenha widget.
  FocusNode? confirmarSenhaFocusNode;
  TextEditingController? confirmarSenhaTextController;
  String? Function(BuildContext, String?)?
      confirmarSenhaTextControllerValidator;
  // Stores action output result for [Backend Call - API (resetarSenha)] action in Button widget.
  ApiCallResponse? apiResetSenha;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    senhaFocusNode?.dispose();
    senhaTextController?.dispose();

    confirmarSenhaFocusNode?.dispose();
    confirmarSenhaTextController?.dispose();
  }
}
