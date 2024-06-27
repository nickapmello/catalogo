import '/flutter_flow/flutter_flow_util.dart';
import 'editar_perfil_lojista_widget.dart' show EditarPerfilLojistaWidget;
import 'package:flutter/material.dart';

class EditarPerfilLojistaModel
    extends FlutterFlowModel<EditarPerfilLojistaWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for nomeCompleto widget.
  FocusNode? nomeCompletoFocusNode;
  TextEditingController? nomeCompletoTextController;
  String? Function(BuildContext, String?)? nomeCompletoTextControllerValidator;
  // State field(s) for cpf widget.
  FocusNode? cpfFocusNode;
  TextEditingController? cpfTextController;
  String? Function(BuildContext, String?)? cpfTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomeCompletoFocusNode?.dispose();
    nomeCompletoTextController?.dispose();

    cpfFocusNode?.dispose();
    cpfTextController?.dispose();
  }
}
