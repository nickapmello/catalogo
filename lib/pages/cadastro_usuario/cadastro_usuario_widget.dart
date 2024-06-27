import '/components/cadastro_usuarios/cadastro_usuarios_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'cadastro_usuario_model.dart';
export 'cadastro_usuario_model.dart';

class CadastroUsuarioWidget extends StatefulWidget {
  const CadastroUsuarioWidget({super.key});

  @override
  State<CadastroUsuarioWidget> createState() => _CadastroUsuarioWidgetState();
}

class _CadastroUsuarioWidgetState extends State<CadastroUsuarioWidget> {
  late CadastroUsuarioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CadastroUsuarioModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'cadastroUsuario',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                alignment: const AlignmentDirectional(0.0, 1.0),
                children: [
                  Align(
                    alignment: const AlignmentDirectional(1.13, 0.78),
                    child: Container(
                      width: 500.0,
                      height: 500.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).tertiary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  if (responsiveVisibility(
                    context: context,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    Align(
                      alignment: const AlignmentDirectional(-2.0, -1.5),
                      child: Container(
                        width: 350.0,
                        height: 350.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                  ))
                    Align(
                      alignment: const AlignmentDirectional(-1.25, -1.5),
                      child: Container(
                        width: 600.0,
                        height: 600.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                  ))
                    Align(
                      alignment: const AlignmentDirectional(1.0, -0.95),
                      child: Container(
                        width: 700.0,
                        height: 700.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  if (responsiveVisibility(
                    context: context,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    Align(
                      alignment: const AlignmentDirectional(2.5, -1.2),
                      child: Container(
                        width: 300.0,
                        height: 300.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 40.0,
                          sigmaY: 40.0,
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: wrapWithModel(
                            model: _model.cadastroUsuariosModel,
                            updateCallback: () => setState(() {}),
                            child: const CadastroUsuariosWidget(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
