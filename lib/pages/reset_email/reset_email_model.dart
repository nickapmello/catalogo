import '/flutter_flow/flutter_flow_util.dart';
import 'reset_email_widget.dart' show ResetEmailWidget;
import 'package:flutter/material.dart';

class ResetEmailModel extends FlutterFlowModel<ResetEmailWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
