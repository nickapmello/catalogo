import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cadastrar_cliente_widget.dart' show CadastrarClienteWidget;
import 'package:flutter/material.dart';

class CadastrarClienteModel extends FlutterFlowModel<CadastrarClienteWidget> {
  ///  Local state fields for this component.

  MinhaLojaRecord? loja;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for nomeCliente widget.
  FocusNode? nomeClienteFocusNode;
  TextEditingController? nomeClienteTextController;
  String? Function(BuildContext, String?)? nomeClienteTextControllerValidator;
  String? _nomeClienteTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'g588my2p' /* Campo obrigatório */,
      );
    }

    return null;
  }

  // State field(s) for cpfcnpjCliente widget.
  FocusNode? cpfcnpjClienteFocusNode;
  TextEditingController? cpfcnpjClienteTextController;
  String? Function(BuildContext, String?)?
      cpfcnpjClienteTextControllerValidator;
  String? _cpfcnpjClienteTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'f0so39g9' /* Campo obrigatório */,
      );
    }

    return null;
  }

  // State field(s) for observacoesCliente widget.
  FocusNode? observacoesClienteFocusNode;
  TextEditingController? observacoesClienteTextController;
  String? Function(BuildContext, String?)?
      observacoesClienteTextControllerValidator;
  // State field(s) for telefoneCliente widget.
  FocusNode? telefoneClienteFocusNode;
  TextEditingController? telefoneClienteTextController;
  String? Function(BuildContext, String?)?
      telefoneClienteTextControllerValidator;
  String? _telefoneClienteTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '1iazv5ua' /* Campo obrigatório */,
      );
    }

    return null;
  }

  // State field(s) for emailCliente widget.
  FocusNode? emailClienteFocusNode;
  TextEditingController? emailClienteTextController;
  String? Function(BuildContext, String?)? emailClienteTextControllerValidator;
  String? _emailClienteTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0zuebkc0' /* Campo obrigatório */,
      );
    }

    return null;
  }

  // State field(s) for ruaEndCliente widget.
  FocusNode? ruaEndClienteFocusNode;
  TextEditingController? ruaEndClienteTextController;
  String? Function(BuildContext, String?)? ruaEndClienteTextControllerValidator;
  // State field(s) for numeroEndCliente widget.
  FocusNode? numeroEndClienteFocusNode;
  TextEditingController? numeroEndClienteTextController;
  String? Function(BuildContext, String?)?
      numeroEndClienteTextControllerValidator;
  // State field(s) for bairroEndCliente widget.
  FocusNode? bairroEndClienteFocusNode;
  TextEditingController? bairroEndClienteTextController;
  String? Function(BuildContext, String?)?
      bairroEndClienteTextControllerValidator;
  // State field(s) for cidadeEndCliente widget.
  FocusNode? cidadeEndClienteFocusNode;
  TextEditingController? cidadeEndClienteTextController;
  String? Function(BuildContext, String?)?
      cidadeEndClienteTextControllerValidator;
  // State field(s) for estadoEndCliente widget.
  FocusNode? estadoEndClienteFocusNode;
  TextEditingController? estadoEndClienteTextController;
  String? Function(BuildContext, String?)?
      estadoEndClienteTextControllerValidator;

  @override
  void initState(BuildContext context) {
    nomeClienteTextControllerValidator = _nomeClienteTextControllerValidator;
    cpfcnpjClienteTextControllerValidator =
        _cpfcnpjClienteTextControllerValidator;
    telefoneClienteTextControllerValidator =
        _telefoneClienteTextControllerValidator;
    emailClienteTextControllerValidator = _emailClienteTextControllerValidator;
  }

  @override
  void dispose() {
    nomeClienteFocusNode?.dispose();
    nomeClienteTextController?.dispose();

    cpfcnpjClienteFocusNode?.dispose();
    cpfcnpjClienteTextController?.dispose();

    observacoesClienteFocusNode?.dispose();
    observacoesClienteTextController?.dispose();

    telefoneClienteFocusNode?.dispose();
    telefoneClienteTextController?.dispose();

    emailClienteFocusNode?.dispose();
    emailClienteTextController?.dispose();

    ruaEndClienteFocusNode?.dispose();
    ruaEndClienteTextController?.dispose();

    numeroEndClienteFocusNode?.dispose();
    numeroEndClienteTextController?.dispose();

    bairroEndClienteFocusNode?.dispose();
    bairroEndClienteTextController?.dispose();

    cidadeEndClienteFocusNode?.dispose();
    cidadeEndClienteTextController?.dispose();

    estadoEndClienteFocusNode?.dispose();
    estadoEndClienteTextController?.dispose();
  }
}
