import '/components/header_catalogo_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'meus_pedidos_widget.dart' show MeusPedidosWidget;
import 'package:flutter/material.dart';

class MeusPedidosModel extends FlutterFlowModel<MeusPedidosWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for headerCatalogo component.
  late HeaderCatalogoModel headerCatalogoModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {
    headerCatalogoModel = createModel(context, () => HeaderCatalogoModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headerCatalogoModel.dispose();
    tabBarController?.dispose();
  }
}
