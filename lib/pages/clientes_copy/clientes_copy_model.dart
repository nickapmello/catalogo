import '/backend/backend.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'clientes_copy_widget.dart' show ClientesCopyWidget;
import 'package:flutter/material.dart';

class ClientesCopyModel extends FlutterFlowModel<ClientesCopyWidget> {
  ///  Local state fields for this page.

  bool listaCliente = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for webNav component.
  late WebNavModel webNavModel1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - procurarCliente] action in Icon widget.
  List<ClienteRecord>? searchCliente;
  // State field(s) for DropDown widget.
  bool? dropDownValue;
  FormFieldController<bool>? dropDownValueController;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<ClienteRecord>();
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
    textFieldFocusNode?.dispose();
    textController?.dispose();

    webNavModel2.dispose();
  }
}
