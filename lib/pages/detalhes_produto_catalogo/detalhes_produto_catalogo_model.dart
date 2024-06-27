import '/backend/backend.dart';
import '/components/header_catalogo_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'detalhes_produto_catalogo_widget.dart'
    show DetalhesProdutoCatalogoWidget;
import 'package:flutter/material.dart';

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
