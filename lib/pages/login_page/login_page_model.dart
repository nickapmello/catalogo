import '/components/login_componente/login_componente_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_page_widget.dart' show LoginPageWidget;
import 'package:flutter/material.dart';

class LoginPageModel extends FlutterFlowModel<LoginPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for loginComponente component.
  late LoginComponenteModel loginComponenteModel;

  @override
  void initState(BuildContext context) {
    loginComponenteModel = createModel(context, () => LoginComponenteModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    loginComponenteModel.dispose();
  }
}
