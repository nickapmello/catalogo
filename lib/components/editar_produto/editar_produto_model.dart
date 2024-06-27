import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'editar_produto_widget.dart' show EditarProdutoWidget;
import 'package:flutter/material.dart';

class EditarProdutoModel extends FlutterFlowModel<EditarProdutoWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for nomeProduto widget.
  FocusNode? nomeProdutoFocusNode;
  TextEditingController? nomeProdutoTextController;
  String? Function(BuildContext, String?)? nomeProdutoTextControllerValidator;
  // State field(s) for precoVenda widget.
  FocusNode? precoVendaFocusNode;
  TextEditingController? precoVendaTextController;
  String? Function(BuildContext, String?)? precoVendaTextControllerValidator;
  // State field(s) for precoPromocional widget.
  FocusNode? precoPromocionalFocusNode;
  TextEditingController? precoPromocionalTextController;
  String? Function(BuildContext, String?)?
      precoPromocionalTextControllerValidator;
  // State field(s) for DropDownCategoria widget.
  String? dropDownCategoriaValue;
  FormFieldController<String>? dropDownCategoriaValueController;
  // State field(s) for codProduto widget.
  FocusNode? codProdutoFocusNode;
  TextEditingController? codProdutoTextController;
  String? Function(BuildContext, String?)? codProdutoTextControllerValidator;
  // State field(s) for precoCusto widget.
  FocusNode? precoCustoFocusNode;
  TextEditingController? precoCustoTextController;
  String? Function(BuildContext, String?)? precoCustoTextControllerValidator;
  // State field(s) for descricaoProduto widget.
  FocusNode? descricaoProdutoFocusNode;
  TextEditingController? descricaoProdutoTextController;
  String? Function(BuildContext, String?)?
      descricaoProdutoTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CategoriaRecord? categoriaRefVariavelDocument2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomeProdutoFocusNode?.dispose();
    nomeProdutoTextController?.dispose();

    precoVendaFocusNode?.dispose();
    precoVendaTextController?.dispose();

    precoPromocionalFocusNode?.dispose();
    precoPromocionalTextController?.dispose();

    codProdutoFocusNode?.dispose();
    codProdutoTextController?.dispose();

    precoCustoFocusNode?.dispose();
    precoCustoTextController?.dispose();

    descricaoProdutoFocusNode?.dispose();
    descricaoProdutoTextController?.dispose();
  }
}
