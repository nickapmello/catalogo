import '/backend/backend.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'usuarios_widget.dart' show UsuariosWidget;
import 'package:flutter/material.dart';

class UsuariosModel extends FlutterFlowModel<UsuariosWidget> {
  ///  Local state fields for this page.

  bool listaCliente = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for webNav component.
  late WebNavModel webNavModel1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - procurarUser] action in Icon widget.
  List<UsersRecord>? searchUser;
  // Model for webNav component.
  late WebNavModel webNavModel2;

  @override
  void initState(BuildContext context) {
    webNavModel1 = createModel(context, () => WebNavModel());
    webNavModel2 = createModel(context, () => WebNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    webNavModel1.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    webNavModel2.dispose();
  }
}
