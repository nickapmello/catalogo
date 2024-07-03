import '/flutter_flow/flutter_flow_util.dart';
import 'cadastrar_user_widget.dart' show CadastrarUserWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CadastrarUserModel extends FlutterFlowModel<CadastrarUserWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nomeUser widget.
  FocusNode? nomeUserFocusNode;
  TextEditingController? nomeUserTextController;
  String? Function(BuildContext, String?)? nomeUserTextControllerValidator;
  String? _nomeUserTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'g588my2p' /* Campo obrigatório */,
      );
    }

    return null;
  }

  // State field(s) for cpfcnpjUser widget.
  FocusNode? cpfcnpjUserFocusNode;
  TextEditingController? cpfcnpjUserTextController;
  final cpfcnpjUserMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? cpfcnpjUserTextControllerValidator;
  String? _cpfcnpjUserTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'f0so39g9' /* Campo obrigatório */,
      );
    }

    return null;
  }

  // State field(s) for senha widget.
  FocusNode? senhaFocusNode;
  TextEditingController? senhaTextController;
  late bool senhaVisibility;
  String? Function(BuildContext, String?)? senhaTextControllerValidator;
  // State field(s) for confirmarSenha widget.
  FocusNode? confirmarSenhaFocusNode;
  TextEditingController? confirmarSenhaTextController;
  late bool confirmarSenhaVisibility;
  String? Function(BuildContext, String?)?
      confirmarSenhaTextControllerValidator;
  // State field(s) for telefoneUser widget.
  FocusNode? telefoneUserFocusNode;
  TextEditingController? telefoneUserTextController;
  final telefoneUserMask = MaskTextInputFormatter(mask: '(##) #####-####');
  String? Function(BuildContext, String?)? telefoneUserTextControllerValidator;
  String? _telefoneUserTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '1iazv5ua' /* Campo obrigatório */,
      );
    }

    return null;
  }

  // State field(s) for emailUser widget.
  FocusNode? emailUserFocusNode;
  TextEditingController? emailUserTextController;
  String? Function(BuildContext, String?)? emailUserTextControllerValidator;
  String? _emailUserTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0zuebkc0' /* Campo obrigatório */,
      );
    }

    return null;
  }

  // Stores action output result for [Custom Action - createUser] action in Button widget.
  String? criarUsuario;

  @override
  void initState(BuildContext context) {
    nomeUserTextControllerValidator = _nomeUserTextControllerValidator;
    cpfcnpjUserTextControllerValidator = _cpfcnpjUserTextControllerValidator;
    senhaVisibility = false;
    confirmarSenhaVisibility = false;
    telefoneUserTextControllerValidator = _telefoneUserTextControllerValidator;
    emailUserTextControllerValidator = _emailUserTextControllerValidator;
  }

  @override
  void dispose() {
    nomeUserFocusNode?.dispose();
    nomeUserTextController?.dispose();

    cpfcnpjUserFocusNode?.dispose();
    cpfcnpjUserTextController?.dispose();

    senhaFocusNode?.dispose();
    senhaTextController?.dispose();

    confirmarSenhaFocusNode?.dispose();
    confirmarSenhaTextController?.dispose();

    telefoneUserFocusNode?.dispose();
    telefoneUserTextController?.dispose();

    emailUserFocusNode?.dispose();
    emailUserTextController?.dispose();
  }
}
