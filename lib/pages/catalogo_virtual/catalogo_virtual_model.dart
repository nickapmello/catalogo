import '/backend/backend.dart';
import '/components/header_catalogo_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'catalogo_virtual_widget.dart' show CatalogoVirtualWidget;
import 'package:flutter/material.dart';

class CatalogoVirtualModel extends FlutterFlowModel<CatalogoVirtualWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in catalogoVirtual widget.
  MinhaLojaRecord? encontrarLoja;
  // Model for headerCatalogo component.
  late HeaderCatalogoModel headerCatalogoModel;
  // State field(s) for scrollTop widget.
  ScrollController? scrollTop;
  // State field(s) for ListView widget.
  ScrollController? listViewController;

  @override
  void initState(BuildContext context) {
    headerCatalogoModel = createModel(context, () => HeaderCatalogoModel());
    scrollTop = ScrollController();
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headerCatalogoModel.dispose();
    scrollTop?.dispose();
    listViewController?.dispose();
  }
}
