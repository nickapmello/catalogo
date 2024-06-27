import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/header_catalogo_widget.dart';
import '/components/login_componente/login_componente_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'detalhes_produto_catalogo_widget.dart'
    show DetalhesProdutoCatalogoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetalhesProdutoCatalogoModel
    extends FlutterFlowModel<DetalhesProdutoCatalogoWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for headerCatalogo component.
  late HeaderCatalogoModel headerCatalogoModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CarrinhoRecord? pesquisaCarrinho;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ProdutoCarrinhoRecord? produtoExiste;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ProdutoCarrinhoRecord? produtoCarrinhoExiste;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CarrinhoRecord? novoCarrinho;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ProdutoCarrinhoRecord? produtoCarrinhoAdd;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CarrinhoRecord? pesquisaCarrinhoCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ProdutoCarrinhoRecord? produtoExisteCopy;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ProdutoCarrinhoRecord? produtoCarrinhoExisteCopy;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CarrinhoRecord? novoCarrinhoCopy;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ProdutoCarrinhoRecord? produtoCarrinhoAddCopy;

  @override
  void initState(BuildContext context) {
    headerCatalogoModel = createModel(context, () => HeaderCatalogoModel());
  }

  @override
  void dispose() {
    headerCatalogoModel.dispose();
  }
}
