import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'detalhes_cliente_widget.dart' show DetalhesClienteWidget;
import 'package:flutter/material.dart';

class DetalhesClienteModel extends FlutterFlowModel<DetalhesClienteWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for webNav component.
  late WebNavModel webNavModel;
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for observacaoCliente widget.
  FocusNode? observacaoClienteFocusNode;
  TextEditingController? observacaoClienteTextController;
  String? Function(BuildContext, String?)?
      observacaoClienteTextControllerValidator;

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    webNavModel.dispose();
    observacaoClienteFocusNode?.dispose();
    observacaoClienteTextController?.dispose();
  }
}
