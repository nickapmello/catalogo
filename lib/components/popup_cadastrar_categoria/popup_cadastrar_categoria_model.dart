import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'popup_cadastrar_categoria_widget.dart'
    show PopupCadastrarCategoriaWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PopupCadastrarCategoriaModel
    extends FlutterFlowModel<PopupCadastrarCategoriaWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for nomeCategoria widget.
  FocusNode? nomeCategoriaFocusNode;
  TextEditingController? nomeCategoriaTextController;
  String? Function(BuildContext, String?)? nomeCategoriaTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomeCategoriaFocusNode?.dispose();
    nomeCategoriaTextController?.dispose();
  }
}
