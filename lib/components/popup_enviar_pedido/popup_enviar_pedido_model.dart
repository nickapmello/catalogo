import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'popup_enviar_pedido_widget.dart' show PopupEnviarPedidoWidget;
import 'package:flutter/material.dart';

class PopupEnviarPedidoModel extends FlutterFlowModel<PopupEnviarPedidoWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ProdutoCarrinhoRecord>? listaProdutosCarrinho;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ClienteRecord? verificarCliente;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PedidoRecord? novoPedidoEnviar;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ClienteRecord? novoCliente;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
