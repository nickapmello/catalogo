import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/popup_cadastrar_categoria/popup_cadastrar_categoria_widget.dart';
import '/components/popup_editar_categoria/popup_editar_categoria_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'categorias_model.dart';
export 'categorias_model.dart';

class CategoriasWidget extends StatefulWidget {
  const CategoriasWidget({super.key});

  @override
  State<CategoriasWidget> createState() => _CategoriasWidgetState();
}

class _CategoriasWidgetState extends State<CategoriasWidget>
    with TickerProviderStateMixin {
  late CategoriasModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoriasModel());

    animationsMap.addAll({
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 20.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 10.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<MinhaLojaRecord>>(
      stream: queryMinhaLojaRecord(
        queryBuilder: (minhaLojaRecord) => minhaLojaRecord.where(
          'user',
          isEqualTo: currentUserReference,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<MinhaLojaRecord> categoriasMinhaLojaRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final categoriasMinhaLojaRecord =
            categoriasMinhaLojaRecordList.isNotEmpty
                ? categoriasMinhaLojaRecordList.first
                : null;
        return Title(
            title: 'Categorias',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                drawer: Drawer(
                  elevation: 16.0,
                  child: wrapWithModel(
                    model: _model.webNavModel2,
                    updateCallback: () => setState(() {}),
                    child: WebNavWidget(
                      colorBgDashboard: Colors.transparent,
                      colorBgProdutos: const Color(0x2B7367F0),
                      colorBgClientes: Colors.transparent,
                      colorBgPedidos: Colors.transparent,
                      colorBgMinhaLoja: Colors.transparent,
                      colorBgPerfil: Colors.transparent,
                      iconDashboard: Icon(
                        Icons.dashboard_outlined,
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                      iconProdutos: Icon(
                        Icons.shopping_bag_outlined,
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                      iconClientes: Icon(
                        Icons.group_outlined,
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                      iconPedidos: Icon(
                        Icons.shopping_cart_outlined,
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                      iconMinhaLoja: Icon(
                        Icons.home_work_outlined,
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                      iconPerfil: FaIcon(
                        FontAwesomeIcons.userCircle,
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                      txtColorDashboard:
                          FlutterFlowTheme.of(context).secondaryText,
                      txtColorProdutos: FlutterFlowTheme.of(context).primary,
                      txtColorClientes:
                          FlutterFlowTheme.of(context).secondaryText,
                      txtColorPedidos:
                          FlutterFlowTheme.of(context).secondaryText,
                      txtColorMinhaLoja:
                          FlutterFlowTheme.of(context).secondaryText,
                      txtColorPerfil:
                          FlutterFlowTheme.of(context).secondaryText,
                      bgCategoria: Colors.transparent,
                      iconCategoria: Icon(
                        Icons.shop_2,
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                      txtCategoria: FlutterFlowTheme.of(context).secondaryText,
                    ),
                  ),
                ),
                appBar: !isWeb
                    ? AppBar(
                        backgroundColor: FlutterFlowTheme.of(context).primary,
                        automaticallyImplyLeading: false,
                        title: Text(
                          FFLocalizations.of(context).getText(
                            'wfay6gpx' /* Dashboard */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .displaySmallFamily,
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .displaySmallFamily),
                              ),
                        ).animateOnPageLoad(
                            animationsMap['textOnPageLoadAnimation2']!),
                        actions: const [],
                        centerTitle: false,
                        elevation: 0.0,
                      )
                    : null,
                body: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 24.0, 24.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                scaffoldKey.currentState!.openDrawer();
                              },
                              child: Icon(
                                Icons.menu_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 32.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                          ))
                            wrapWithModel(
                              model: _model.webNavModel1,
                              updateCallback: () => setState(() {}),
                              child: WebNavWidget(
                                colorBgPerfil: const Color(0x00000001),
                                iconDashboard: Icon(
                                  Icons.dashboard_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                                iconProdutos: Icon(
                                  Icons.shopping_bag_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                                iconClientes: Icon(
                                  Icons.group_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                                iconPedidos: Icon(
                                  Icons.shopping_cart_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                                iconMinhaLoja: Icon(
                                  Icons.home_work_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                                iconPerfil: FaIcon(
                                  FontAwesomeIcons.userCircle,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                                txtColorDashboard:
                                    FlutterFlowTheme.of(context).secondaryText,
                                txtColorProdutos:
                                    FlutterFlowTheme.of(context).secondaryText,
                                txtColorClientes:
                                    FlutterFlowTheme.of(context).secondaryText,
                                txtColorPedidos:
                                    FlutterFlowTheme.of(context).secondaryText,
                                txtColorMinhaLoja:
                                    FlutterFlowTheme.of(context).secondaryText,
                                txtColorPerfil:
                                    FlutterFlowTheme.of(context).secondaryText,
                                bgCategoria: const Color(0x3237C6DA),
                                iconCategoria: Icon(
                                  Icons.shop_2,
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                                txtCategoria:
                                    FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          Expanded(
                            flex: 10,
                            child: SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 1.0, 0.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            flex: 7,
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 16.0, 0.0, 16.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '6o6ephbm' /* Categorias */,
                                                ),
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .displaySmallFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .displaySmallFamily),
                                                        ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'textOnPageLoadAnimation1']!),
                                            ),
                                          ),
                                          if (responsiveVisibility(
                                            context: context,
                                            tabletLandscape: false,
                                            desktop: false,
                                          ))
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 24.0, 0.0),
                                              child: FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30.0,
                                                borderWidth: 1.0,
                                                buttonSize: 60.0,
                                                icon: Icon(
                                                  Icons.search_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 30.0,
                                                ),
                                                onPressed: () {
                                                  print(
                                                      'IconButton pressed ...');
                                                },
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                    child: Builder(
                                      builder: (context) => Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 16.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      const AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: GestureDetector(
                                                    onTap: () => _model
                                                            .unfocusNode
                                                            .canRequestFocus
                                                        ? FocusScope.of(context)
                                                            .requestFocus(_model
                                                                .unfocusNode)
                                                        : FocusScope.of(context)
                                                            .unfocus(),
                                                    child: SizedBox(
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.8,
                                                      child:
                                                          PopupCadastrarCategoriaWidget(
                                                        lojaCategoria:
                                                            categoriasMinhaLojaRecord!,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'keotih9g' /* Categoria */,
                                          ),
                                          icon: const Icon(
                                            Icons.add,
                                            size: 15.0,
                                          ),
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily,
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily),
                                                    ),
                                            elevation: 3.0,
                                            borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            hoverColor:
                                                FlutterFlowTheme.of(context)
                                                    .tertiary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 16.0, 16.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x1F000000),
                                            offset: Offset(
                                              0.0,
                                              2.0,
                                            ),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 12.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 12.0, 16.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'u0mr5beo' /* Categoria */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily),
                                                              ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                30.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'plf53wb4' /* Ativo */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily),
                                                              ),
                                                    ),
                                                  ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                    tablet: false,
                                                    tabletLandscape: false,
                                                  ))
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'e0unji0f' /* Alterar */,
                                                      ),
                                                      textAlign: TextAlign.end,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily),
                                                              ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 0.0),
                                              child: StreamBuilder<
                                                  List<CategoriaRecord>>(
                                                stream: queryCategoriaRecord(
                                                  parent:
                                                      categoriasMinhaLojaRecord
                                                          ?.reference,
                                                  queryBuilder:
                                                      (categoriaRecord) =>
                                                          categoriaRecord
                                                              .orderBy('nome'),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<CategoriaRecord>
                                                      listViewCategoriaRecordList =
                                                      snapshot.data!;
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewCategoriaRecordList
                                                            .length,
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewCategoriaRecord =
                                                          listViewCategoriaRecordList[
                                                              listViewIndex];
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    2.0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 0.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .lineColor,
                                                                offset: const Offset(
                                                                  0.0,
                                                                  1.0,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    16.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  flex: 2,
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                              child: AutoSizeText(
                                                                                listViewCategoriaRecord.nome.maybeHandleOverflow(
                                                                                  maxChars: 32,
                                                                                  replacement: '…',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                if (responsiveVisibility(
                                                                  context:
                                                                      context,
                                                                  phone: false,
                                                                  tablet: false,
                                                                  tabletLandscape:
                                                                      false,
                                                                ))
                                                                  Expanded(
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children:
                                                                          [
                                                                        Theme(
                                                                          data:
                                                                              ThemeData(
                                                                            checkboxTheme:
                                                                                const CheckboxThemeData(
                                                                              visualDensity: VisualDensity.standard,
                                                                              materialTapTargetSize: MaterialTapTargetSize.padded,
                                                                              shape: CircleBorder(),
                                                                            ),
                                                                            unselectedWidgetColor:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                          ),
                                                                          child:
                                                                              Checkbox(
                                                                            value: _model.checkboxValueMap[listViewCategoriaRecord] ??=
                                                                                listViewCategoriaRecord.ativo,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              setState(() => _model.checkboxValueMap[listViewCategoriaRecord] = newValue!);
                                                                              if (newValue!) {
                                                                                await listViewCategoriaRecord.reference.update(createCategoriaRecordData(
                                                                                  ativo: true,
                                                                                ));
                                                                              } else {
                                                                                await listViewCategoriaRecord.reference.update(createCategoriaRecordData(
                                                                                  ativo: false,
                                                                                ));
                                                                              }
                                                                            },
                                                                            side:
                                                                                BorderSide(
                                                                              width: 2,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                            ),
                                                                            activeColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            checkColor:
                                                                                FlutterFlowTheme.of(context).info,
                                                                          ),
                                                                        ),
                                                                        Builder(
                                                                          builder: (context) =>
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                16.0,
                                                                                0.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (dialogContext) {
                                                                                    return Dialog(
                                                                                      elevation: 0,
                                                                                      insetPadding: EdgeInsets.zero,
                                                                                      backgroundColor: Colors.transparent,
                                                                                      alignment: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                      child: GestureDetector(
                                                                                        onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                        child: PopupEditarCategoriaWidget(
                                                                                          lojaCategoria: categoriasMinhaLojaRecord!,
                                                                                          categoria: listViewCategoriaRecord,
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => setState(() {}));
                                                                              },
                                                                              child: Icon(
                                                                                Icons.mode_edit,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ].divide(const SizedBox(
                                                                              width: 24.0)),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
