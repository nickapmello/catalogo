import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'cadastrar_produto_widget.dart' show CadastrarProdutoWidget;
import 'package:flutter/material.dart';

class CadastrarProdutoModel extends FlutterFlowModel<CadastrarProdutoWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for nomeProduto widget.
  FocusNode? nomeProdutoFocusNode;
  TextEditingController? nomeProdutoTextController;
  String? Function(BuildContext, String?)? nomeProdutoTextControllerValidator;
  String? _nomeProdutoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3c1lze8b' /* Campo Obrigatório */,
      );
    }

    if (val.length < 3) {
      return FFLocalizations.of(context).getText(
        'buodrjbn' /* Mínimo de 3 dígitos */,
      );
    }

    return null;
  }

  // State field(s) for DropDownCategoria widget.
  String? dropDownCategoriaValue;
  FormFieldController<String>? dropDownCategoriaValueController;
  // State field(s) for codProduto widget.
  FocusNode? codProdutoFocusNode;
  TextEditingController? codProdutoTextController;
  String? Function(BuildContext, String?)? codProdutoTextControllerValidator;
  // State field(s) for descricaoProduto widget.
  FocusNode? descricaoProdutoFocusNode;
  TextEditingController? descricaoProdutoTextController;
  String? Function(BuildContext, String?)?
      descricaoProdutoTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CategoriaRecord? categoriaRefVariavel;

  @override
  void initState(BuildContext context) {
    nomeProdutoTextControllerValidator = _nomeProdutoTextControllerValidator;
  }

  @override
  void dispose() {
    nomeProdutoFocusNode?.dispose();
    nomeProdutoTextController?.dispose();

    codProdutoFocusNode?.dispose();
    codProdutoTextController?.dispose();

    descricaoProdutoFocusNode?.dispose();
    descricaoProdutoTextController?.dispose();
  }
}
