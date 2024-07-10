import '/flutter_flow/flutter_flow_util.dart';
import 'editar_perfil_cliente_widget.dart' show EditarPerfilClienteWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EditarPerfilClienteModel
    extends FlutterFlowModel<EditarPerfilClienteWidget> {
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
  final cpfMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? cpfTextControllerValidator;
  // State field(s) for Telefone widget.
  FocusNode? telefoneFocusNode;
  TextEditingController? telefoneTextController;
  final telefoneMask = MaskTextInputFormatter(mask: '(##) #####-####');
  String? Function(BuildContext, String?)? telefoneTextControllerValidator;
  // State field(s) for ruaCliente widget.
  FocusNode? ruaClienteFocusNode;
  TextEditingController? ruaClienteTextController;
  String? Function(BuildContext, String?)? ruaClienteTextControllerValidator;
  // State field(s) for numEndCliente widget.
  FocusNode? numEndClienteFocusNode;
  TextEditingController? numEndClienteTextController;
  String? Function(BuildContext, String?)? numEndClienteTextControllerValidator;
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
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomeCompletoFocusNode?.dispose();
    nomeCompletoTextController?.dispose();

    cpfFocusNode?.dispose();
    cpfTextController?.dispose();

    telefoneFocusNode?.dispose();
    telefoneTextController?.dispose();

    ruaClienteFocusNode?.dispose();
    ruaClienteTextController?.dispose();

    numEndClienteFocusNode?.dispose();
    numEndClienteTextController?.dispose();

    bairroEndClienteFocusNode?.dispose();
    bairroEndClienteTextController?.dispose();

    cidadeEndClienteFocusNode?.dispose();
    cidadeEndClienteTextController?.dispose();

    estadoEndClienteFocusNode?.dispose();
    estadoEndClienteTextController?.dispose();
  }
}
