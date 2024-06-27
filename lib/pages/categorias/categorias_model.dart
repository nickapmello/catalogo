import '/backend/backend.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'categorias_widget.dart' show CategoriasWidget;
import 'package:flutter/material.dart';

class CategoriasModel extends FlutterFlowModel<CategoriasWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for webNav component.
  late WebNavModel webNavModel1;
  // State field(s) for Checkbox widget.
  Map<CategoriaRecord, bool> checkboxValueMap = {};
  List<CategoriaRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // Model for webNav component.
  late WebNavModel webNavModel2;

  @override
  void initState(BuildContext context) {
    webNavModel1 = createModel(context, () => WebNavModel());
    webNavModel2 = createModel(context, () => WebNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    webNavModel1.dispose();
    webNavModel2.dispose();
  }
}
