import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/header_catalogo_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'catalogo_virtual_widget.dart' show CatalogoVirtualWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
