import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'trocar_senha_widget.dart' show TrocarSenhaWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TrocarSenhaModel extends FlutterFlowModel<TrocarSenhaWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for inserirEmail widget.
  FocusNode? inserirEmailFocusNode;
  TextEditingController? inserirEmailTextController;
  String? Function(BuildContext, String?)? inserirEmailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inserirEmailFocusNode?.dispose();
    inserirEmailTextController?.dispose();
  }
}
