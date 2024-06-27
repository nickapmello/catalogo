import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'clientes_widget.dart' show ClientesWidget;
import 'package:flutter/material.dart';

class ClientesModel extends FlutterFlowModel<ClientesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for webNav component.
  late WebNavModel webNavModel1;
  // State field(s) for DropDown widget.
  bool? dropDownValue;
  FormFieldController<bool>? dropDownValueController;
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
