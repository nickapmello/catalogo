import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'perfil_widget.dart' show PerfilWidget;
import 'package:flutter/material.dart';

class PerfilModel extends FlutterFlowModel<PerfilWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for webNav component.
  late WebNavModel webNavModel1;
  // Model for webNav component.
  late WebNavModel webNavModel2;

  @override
  void initState(BuildContext context) {
    webNavModel1 = createModel(context, () => WebNavModel());
    webNavModel2 = createModel(context, () => WebNavModel());
  }

  @override
  void dispose() {
    webNavModel1.dispose();
    webNavModel2.dispose();
  }
}
