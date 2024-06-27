import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/popup_cadastrar_categoria/popup_cadastrar_categoria_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'cadastrar_produto_widget.dart' show CadastrarProdutoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

  // State field(s) for precoVenda widget.
  FocusNode? precoVendaFocusNode;
  TextEditingController? precoVendaTextController;
  String? Function(BuildContext, String?)? precoVendaTextControllerValidator;
  String? _precoVendaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '5zhybprq' /* Campo Obrigatório */,
      );
    }

    return null;
  }

  // State field(s) for precoPromocional widget.
  FocusNode? precoPromocionalFocusNode;
  TextEditingController? precoPromocionalTextController;
  String? Function(BuildContext, String?)?
      precoPromocionalTextControllerValidator;
  // State field(s) for DropDownCategoria widget.
  String? dropDownCategoriaValue;
  FormFieldController<String>? dropDownCategoriaValueController;
  // State field(s) for precoCusto widget.
  FocusNode? precoCustoFocusNode;
  TextEditingController? precoCustoTextController;
  String? Function(BuildContext, String?)? precoCustoTextControllerValidator;
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
    precoVendaTextControllerValidator = _precoVendaTextControllerValidator;
  }

  @override
  void dispose() {
    nomeProdutoFocusNode?.dispose();
    nomeProdutoTextController?.dispose();

    precoVendaFocusNode?.dispose();
    precoVendaTextController?.dispose();

    precoPromocionalFocusNode?.dispose();
    precoPromocionalTextController?.dispose();

    precoCustoFocusNode?.dispose();
    precoCustoTextController?.dispose();

    codProdutoFocusNode?.dispose();
    codProdutoTextController?.dispose();

    descricaoProdutoFocusNode?.dispose();
    descricaoProdutoTextController?.dispose();
  }
}
