import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/login_componente/login_componente_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'cadastro_usuarios_widget.dart' show CadastroUsuariosWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CadastroUsuariosModel extends FlutterFlowModel<CadastroUsuariosWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for emailCadastro widget.
  FocusNode? emailCadastroFocusNode;
  TextEditingController? emailCadastroTextController;
  String? Function(BuildContext, String?)? emailCadastroTextControllerValidator;
  // State field(s) for nomeCadastro widget.
  FocusNode? nomeCadastroFocusNode;
  TextEditingController? nomeCadastroTextController;
  String? Function(BuildContext, String?)? nomeCadastroTextControllerValidator;
  // State field(s) for nomeLojaCadastro widget.
  FocusNode? nomeLojaCadastroFocusNode;
  TextEditingController? nomeLojaCadastroTextController;
  String? Function(BuildContext, String?)?
      nomeLojaCadastroTextControllerValidator;
  // State field(s) for senhaCadastro widget.
  FocusNode? senhaCadastroFocusNode;
  TextEditingController? senhaCadastroTextController;
  late bool senhaCadastroVisibility;
  String? Function(BuildContext, String?)? senhaCadastroTextControllerValidator;
  // State field(s) for senhaCadastroConfirmar widget.
  FocusNode? senhaCadastroConfirmarFocusNode;
  TextEditingController? senhaCadastroConfirmarTextController;
  late bool senhaCadastroConfirmarVisibility;
  String? Function(BuildContext, String?)?
      senhaCadastroConfirmarTextControllerValidator;

  @override
  void initState(BuildContext context) {
    senhaCadastroVisibility = false;
    senhaCadastroConfirmarVisibility = false;
  }

  @override
  void dispose() {
    emailCadastroFocusNode?.dispose();
    emailCadastroTextController?.dispose();

    nomeCadastroFocusNode?.dispose();
    nomeCadastroTextController?.dispose();

    nomeLojaCadastroFocusNode?.dispose();
    nomeLojaCadastroTextController?.dispose();

    senhaCadastroFocusNode?.dispose();
    senhaCadastroTextController?.dispose();

    senhaCadastroConfirmarFocusNode?.dispose();
    senhaCadastroConfirmarTextController?.dispose();
  }
}
