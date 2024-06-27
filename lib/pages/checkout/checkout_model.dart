import '/components/header_catalogo_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'checkout_widget.dart' show CheckoutWidget;
import 'package:flutter/material.dart';

class CheckoutModel extends FlutterFlowModel<CheckoutWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for headerCatalogo component.
  late HeaderCatalogoModel headerCatalogoModel;

  @override
  void initState(BuildContext context) {
    headerCatalogoModel = createModel(context, () => HeaderCatalogoModel());
  }

  @override
  void dispose() {
    headerCatalogoModel.dispose();
  }
}
