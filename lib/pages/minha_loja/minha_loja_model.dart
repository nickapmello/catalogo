import '/backend/backend.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'minha_loja_widget.dart' show MinhaLojaWidget;
import 'package:flutter/material.dart';

class MinhaLojaModel extends FlutterFlowModel<MinhaLojaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey3 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in MinhaLoja widget.
  MinhaLojaRecord? defineCorQuery;
  // Model for webNav component.
  late WebNavModel webNavModel1;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for urlLoja widget.
  FocusNode? urlLojaFocusNode;
  TextEditingController? urlLojaTextController;
  String? Function(BuildContext, String?)? urlLojaTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MinhaLojaRecord? pesquisaUrl;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for cnpjLoja widget.
  FocusNode? cnpjLojaFocusNode;
  TextEditingController? cnpjLojaTextController;
  String? Function(BuildContext, String?)? cnpjLojaTextControllerValidator;
  String? _cnpjLojaTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'enjqvxqe' /* Campo obrigatório */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        'lwbxlmcb' /* Preencha o campo corretamente */,
      );
    }

    return null;
  }

  // State field(s) for nomeLoja widget.
  FocusNode? nomeLojaFocusNode;
  TextEditingController? nomeLojaTextController;
  String? Function(BuildContext, String?)? nomeLojaTextControllerValidator;
  String? _nomeLojaTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '2dwi6hld' /* Campo obrigatório */,
      );
    }

    return null;
  }

  // State field(s) for descricaoLoja widget.
  FocusNode? descricaoLojaFocusNode;
  TextEditingController? descricaoLojaTextController;
  String? Function(BuildContext, String?)? descricaoLojaTextControllerValidator;
  // State field(s) for ruaEndLoja widget.
  FocusNode? ruaEndLojaFocusNode;
  TextEditingController? ruaEndLojaTextController;
  String? Function(BuildContext, String?)? ruaEndLojaTextControllerValidator;
  // State field(s) for numeroEndLoja widget.
  FocusNode? numeroEndLojaFocusNode;
  TextEditingController? numeroEndLojaTextController;
  String? Function(BuildContext, String?)? numeroEndLojaTextControllerValidator;
  // State field(s) for bairroEndLoja widget.
  FocusNode? bairroEndLojaFocusNode;
  TextEditingController? bairroEndLojaTextController;
  String? Function(BuildContext, String?)? bairroEndLojaTextControllerValidator;
  // State field(s) for cidadeEndLoja widget.
  FocusNode? cidadeEndLojaFocusNode;
  TextEditingController? cidadeEndLojaTextController;
  String? Function(BuildContext, String?)? cidadeEndLojaTextControllerValidator;
  // State field(s) for estadoEndLoja widget.
  FocusNode? estadoEndLojaFocusNode;
  TextEditingController? estadoEndLojaTextController;
  String? Function(BuildContext, String?)? estadoEndLojaTextControllerValidator;
  // State field(s) for telefoneLoja widget.
  FocusNode? telefoneLojaFocusNode;
  TextEditingController? telefoneLojaTextController;
  String? Function(BuildContext, String?)? telefoneLojaTextControllerValidator;
  String? _telefoneLojaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'kmxys3h1' /* Campo obrigatório */,
      );
    }

    return null;
  }

  // State field(s) for instagramLoja widget.
  FocusNode? instagramLojaFocusNode;
  TextEditingController? instagramLojaTextController;
  String? Function(BuildContext, String?)? instagramLojaTextControllerValidator;
  // State field(s) for emailLoja widget.
  FocusNode? emailLojaFocusNode;
  TextEditingController? emailLojaTextController;
  String? Function(BuildContext, String?)? emailLojaTextControllerValidator;
  String? _emailLojaTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'i1kshy7p' /* Campo obrigatório */,
      );
    }

    return null;
  }

  // State field(s) for responsavelNomeCompletoLoja widget.
  FocusNode? responsavelNomeCompletoLojaFocusNode;
  TextEditingController? responsavelNomeCompletoLojaTextController;
  String? Function(BuildContext, String?)?
      responsavelNomeCompletoLojaTextControllerValidator;
  String? _responsavelNomeCompletoLojaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '6kexfje8' /* Campo obrigatório */,
      );
    }

    return null;
  }

  // State field(s) for responsavelCpfLoja widget.
  FocusNode? responsavelCpfLojaFocusNode;
  TextEditingController? responsavelCpfLojaTextController;
  String? Function(BuildContext, String?)?
      responsavelCpfLojaTextControllerValidator;
  String? _responsavelCpfLojaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '2ljqettc' /* Campo obrigatório */,
      );
    }

    return null;
  }

  // Model for webNav component.
  late WebNavModel webNavModel2;

  @override
  void initState(BuildContext context) {
    webNavModel1 = createModel(context, () => WebNavModel());
    cnpjLojaTextControllerValidator = _cnpjLojaTextControllerValidator;
    nomeLojaTextControllerValidator = _nomeLojaTextControllerValidator;
    telefoneLojaTextControllerValidator = _telefoneLojaTextControllerValidator;
    emailLojaTextControllerValidator = _emailLojaTextControllerValidator;
    responsavelNomeCompletoLojaTextControllerValidator =
        _responsavelNomeCompletoLojaTextControllerValidator;
    responsavelCpfLojaTextControllerValidator =
        _responsavelCpfLojaTextControllerValidator;
    webNavModel2 = createModel(context, () => WebNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    webNavModel1.dispose();
    tabBarController?.dispose();
    urlLojaFocusNode?.dispose();
    urlLojaTextController?.dispose();

    cnpjLojaFocusNode?.dispose();
    cnpjLojaTextController?.dispose();

    nomeLojaFocusNode?.dispose();
    nomeLojaTextController?.dispose();

    descricaoLojaFocusNode?.dispose();
    descricaoLojaTextController?.dispose();

    ruaEndLojaFocusNode?.dispose();
    ruaEndLojaTextController?.dispose();

    numeroEndLojaFocusNode?.dispose();
    numeroEndLojaTextController?.dispose();

    bairroEndLojaFocusNode?.dispose();
    bairroEndLojaTextController?.dispose();

    cidadeEndLojaFocusNode?.dispose();
    cidadeEndLojaTextController?.dispose();

    estadoEndLojaFocusNode?.dispose();
    estadoEndLojaTextController?.dispose();

    telefoneLojaFocusNode?.dispose();
    telefoneLojaTextController?.dispose();

    instagramLojaFocusNode?.dispose();
    instagramLojaTextController?.dispose();

    emailLojaFocusNode?.dispose();
    emailLojaTextController?.dispose();

    responsavelNomeCompletoLojaFocusNode?.dispose();
    responsavelNomeCompletoLojaTextController?.dispose();

    responsavelCpfLojaFocusNode?.dispose();
    responsavelCpfLojaTextController?.dispose();

    webNavModel2.dispose();
  }
}
