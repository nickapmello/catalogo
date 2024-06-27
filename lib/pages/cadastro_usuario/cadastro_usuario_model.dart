import '/components/cadastro_usuarios/cadastro_usuarios_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cadastro_usuario_widget.dart' show CadastroUsuarioWidget;
import 'package:flutter/material.dart';

class CadastroUsuarioModel extends FlutterFlowModel<CadastroUsuarioWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for cadastroUsuarios component.
  late CadastroUsuariosModel cadastroUsuariosModel;

  @override
  void initState(BuildContext context) {
    cadastroUsuariosModel = createModel(context, () => CadastroUsuariosModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    cadastroUsuariosModel.dispose();
  }
}
