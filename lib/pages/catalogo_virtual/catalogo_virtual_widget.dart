import '/backend/backend.dart';
import '/components/header_catalogo_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'catalogo_virtual_model.dart';
export 'catalogo_virtual_model.dart';

class CatalogoVirtualWidget extends StatefulWidget {
  const CatalogoVirtualWidget({
    super.key,
    this.urlLoja,
  });

  final String? urlLoja;

  @override
  State<CatalogoVirtualWidget> createState() => _CatalogoVirtualWidgetState();
}

class _CatalogoVirtualWidgetState extends State<CatalogoVirtualWidget> {
  late CatalogoVirtualModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CatalogoVirtualModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.encontrarLoja = await queryMinhaLojaRecordOnce(
        queryBuilder: (minhaLojaRecord) => minhaLojaRecord.where(
          'urlLoja',
          isEqualTo: widget.urlLoja,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (!(_model.encontrarLoja != null)) {
        context.pushNamed('pagina_nao_encontrada');
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<MinhaLojaRecord>>(
      stream: queryMinhaLojaRecord(
        queryBuilder: (minhaLojaRecord) => minhaLojaRecord.where(
          'urlLoja',
          isEqualTo: widget.urlLoja,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
        List<MinhaLojaRecord> catalogoVirtualMinhaLojaRecordList =
            snapshot.data!;

        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final catalogoVirtualMinhaLojaRecord =
            catalogoVirtualMinhaLojaRecordList.isNotEmpty
                ? catalogoVirtualMinhaLojaRecordList.first
                : null;
        return Title(
            title: 'catalogoVirtual',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                floatingActionButton: FloatingActionButton(
                  onPressed: () async {
                    await _model.scrollTop?.animateTo(
                      0,
                      duration: const Duration(milliseconds: 50),
                      curve: Curves.ease,
                    );
                  },
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                  elevation: 8.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: valueOrDefault<Color>(
                              catalogoVirtualMinhaLojaRecord?.cor,
                              FlutterFlowTheme.of(context).primary,
                            ),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(100.0),
                              bottomRight: Radius.circular(100.0),
                              topLeft: Radius.circular(100.0),
                              topRight: Radius.circular(100.0),
                            ),
                          ),
                          child: const Icon(
                            Icons.arrow_upward_rounded,
                            size: 32.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                body: StreamBuilder<List<CategoriaRecord>>(
                  stream: queryCategoriaRecord(
                    parent: catalogoVirtualMinhaLojaRecord?.reference,
                    singleRecord: true,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<CategoriaRecord> containerCategoriaRecordList =
                        snapshot.data!;

                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final containerCategoriaRecord =
                        containerCategoriaRecordList.isNotEmpty
                            ? containerCategoriaRecordList.first
                            : null;
                    return Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          wrapWithModel(
                            model: _model.headerCatalogoModel,
                            updateCallback: () => setState(() {}),
                            child: HeaderCatalogoWidget(
                              parameter1:
                                  catalogoVirtualMinhaLojaRecord?.logoLoja,
                              parameter2:
                                  catalogoVirtualMinhaLojaRecord?.nomeLoja,
                              parameter4: catalogoVirtualMinhaLojaRecord!.cor!,
                              parameter3: catalogoVirtualMinhaLojaRecord,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 300.0,
                                decoration: const BoxDecoration(),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 24.0),
                              child: Container(
                                constraints: const BoxConstraints(
                                  maxWidth: 1080.0,
                                ),
                                decoration: const BoxDecoration(),
                                child: SingleChildScrollView(
                                  primary: false,
                                  controller: _model.scrollTop,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 24.0, 0.0, 24.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'pm55zfap' /* Categorias */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmallFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(FlutterFlowTheme
                                                            .of(context)
                                                        .headlineSmallFamily),
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: ListView(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          controller: _model.listViewController,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 12.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      FFAppState()
                                                              .categoriaSelecionada =
                                                          null;
                                                      setState(() {});
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: FFAppState()
                                                                    .categoriaSelecionada ==
                                                                null
                                                            ? catalogoVirtualMinhaLojaRecord
                                                                .cor
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .accent1,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(
                                                            12.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'scjmwe5j' /* Todos */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                StreamBuilder<
                                                    List<CategoriaRecord>>(
                                                  stream: queryCategoriaRecord(
                                                    parent:
                                                        catalogoVirtualMinhaLojaRecord
                                                            .reference,
                                                    queryBuilder:
                                                        (categoriaRecord) =>
                                                            categoriaRecord
                                                                .where(
                                                      'ativo',
                                                      isEqualTo: true,
                                                    ),
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
                                                        rowCategoriaRecordList =
                                                        snapshot.data!;

                                                    return Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          rowCategoriaRecordList
                                                              .length,
                                                          (rowIndex) {
                                                        final rowCategoriaRecord =
                                                            rowCategoriaRecordList[
                                                                rowIndex];
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              FFAppState()
                                                                      .categoriaSelecionada =
                                                                  rowCategoriaRecord
                                                                      .reference;
                                                              setState(() {});
                                                            },
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FFAppState()
                                                                            .categoriaSelecionada ==
                                                                        rowCategoriaRecord
                                                                            .reference
                                                                    ? catalogoVirtualMinhaLojaRecord
                                                                        .cor
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent1,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                            12.0),
                                                                child: Text(
                                                                  rowCategoriaRecord
                                                                      .nome,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 16.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            ToggleIcon(
                                              onPressed: () async {
                                                setState(() => FFAppState()
                                                        .ordemCrescente =
                                                    !FFAppState()
                                                        .ordemCrescente);
                                              },
                                              value:
                                                  FFAppState().ordemCrescente,
                                              onIcon: Icon(
                                                Icons.sort_by_alpha_outlined,
                                                color:
                                                    catalogoVirtualMinhaLojaRecord
                                                        .cor,
                                                size: 25.0,
                                              ),
                                              offIcon: Icon(
                                                Icons.sort_by_alpha_outlined,
                                                color:
                                                    catalogoVirtualMinhaLojaRecord
                                                        .cor,
                                                size: 25.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (FFAppState().categoriaSelecionada ==
                                          null)
                                        Builder(
                                          builder: (context) {
                                            if ((FFAppState()
                                                        .categoriaSelecionada ==
                                                    null) &&
                                                (FFAppState().ordemCrescente ==
                                                    false)) {
                                              return StreamBuilder<
                                                  List<ProdutoRecord>>(
                                                stream: queryProdutoRecord(
                                                  parent:
                                                      catalogoVirtualMinhaLojaRecord
                                                          .reference,
                                                  queryBuilder:
                                                      (produtoRecord) =>
                                                          produtoRecord
                                                              .where(
                                                                'ativo',
                                                                isEqualTo: true,
                                                              )
                                                              .orderBy(
                                                                  'nomeProduto'),
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
                                                  List<ProdutoRecord>
                                                      wrapCrescProdutoRecordList =
                                                      snapshot.data!;

                                                  return Wrap(
                                                    spacing: 16.0,
                                                    runSpacing: 16.0,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    crossAxisAlignment:
                                                        WrapCrossAlignment
                                                            .start,
                                                    direction: Axis.horizontal,
                                                    runAlignment:
                                                        WrapAlignment.start,
                                                    verticalDirection:
                                                        VerticalDirection.down,
                                                    clipBehavior: Clip.none,
                                                    children: List.generate(
                                                        wrapCrescProdutoRecordList
                                                            .length,
                                                        (wrapCrescIndex) {
                                                      final wrapCrescProdutoRecord =
                                                          wrapCrescProdutoRecordList[
                                                              wrapCrescIndex];
                                                      return Container(
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Visibility(
                                                          visible:
                                                              containerCategoriaRecord
                                                                      ?.ativo ??
                                                                  true,
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                'detalhesProdutoCatalogo',
                                                                queryParameters:
                                                                    {
                                                                  'detalhesProduto':
                                                                      serializeParam(
                                                                    wrapCrescProdutoRecord,
                                                                    ParamType
                                                                        .Document,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  'detalhesProduto':
                                                                      wrapCrescProdutoRecord,
                                                                  kTransitionInfoKey:
                                                                      const TransitionInfo(
                                                                    hasTransition:
                                                                        true,
                                                                    transitionType:
                                                                        PageTransitionType
                                                                            .fade,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            0),
                                                                  ),
                                                                },
                                                              );
                                                            },
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              child: Container(
                                                                constraints:
                                                                    const BoxConstraints(
                                                                  minHeight:
                                                                      300.0,
                                                                  maxWidth:
                                                                      300.0,
                                                                  maxHeight:
                                                                      320.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          8.0,
                                                                          16.0,
                                                                          16.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.network(
                                                                            valueOrDefault<String>(
                                                                              wrapCrescProdutoRecord.imgProduto.first,
                                                                              'https://cdn-icons-png.flaticon.com/512/7486/7486744.png',
                                                                            ),
                                                                            width:
                                                                                150.0,
                                                                            height:
                                                                                150.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          wrapCrescProdutoRecord
                                                                              .nomeProduto,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                fontSize: 24.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Divider(
                                                                        thickness:
                                                                            1.0,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent4,
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            if (wrapCrescProdutoRecord.valorPromo >
                                                                                0.0)
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  '${formatNumber(
                                                                                    wrapCrescProdutoRecord.valorPromo,
                                                                                    formatType: FormatType.decimal,
                                                                                    decimalType: DecimalType.commaDecimal,
                                                                                    currency: 'R\$',
                                                                                  )} no Pix',
                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 18.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                formatNumber(
                                                                                  wrapCrescProdutoRecord.valorVenda,
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.commaDecimal,
                                                                                  currency: 'R\$',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                      color: wrapCrescProdutoRecord.valorPromo > 0.0 ? FlutterFlowTheme.of(context).secondaryText : FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: wrapCrescProdutoRecord.valorPromo > 0.0 ? 16.0 : 18.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                  );
                                                },
                                              );
                                            } else {
                                              return StreamBuilder<
                                                  List<ProdutoRecord>>(
                                                stream: queryProdutoRecord(
                                                  parent:
                                                      catalogoVirtualMinhaLojaRecord
                                                          .reference,
                                                  queryBuilder:
                                                      (produtoRecord) =>
                                                          produtoRecord
                                                              .where(
                                                                'ativo',
                                                                isEqualTo: true,
                                                              )
                                                              .orderBy(
                                                                  'nomeProduto',
                                                                  descending:
                                                                      true),
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
                                                  List<ProdutoRecord>
                                                      wrapDecrescProdutoRecordList =
                                                      snapshot.data!;

                                                  return Wrap(
                                                    spacing: 16.0,
                                                    runSpacing: 16.0,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    crossAxisAlignment:
                                                        WrapCrossAlignment
                                                            .start,
                                                    direction: Axis.horizontal,
                                                    runAlignment:
                                                        WrapAlignment.start,
                                                    verticalDirection:
                                                        VerticalDirection.down,
                                                    clipBehavior: Clip.none,
                                                    children: List.generate(
                                                        wrapDecrescProdutoRecordList
                                                            .length,
                                                        (wrapDecrescIndex) {
                                                      final wrapDecrescProdutoRecord =
                                                          wrapDecrescProdutoRecordList[
                                                              wrapDecrescIndex];
                                                      return Visibility(
                                                        visible:
                                                            containerCategoriaRecord
                                                                    ?.ativo ??
                                                                true,
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'detalhesProdutoCatalogo',
                                                              queryParameters: {
                                                                'detalhesProduto':
                                                                    serializeParam(
                                                                  wrapDecrescProdutoRecord,
                                                                  ParamType
                                                                      .Document,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                'detalhesProduto':
                                                                    wrapDecrescProdutoRecord,
                                                                kTransitionInfoKey:
                                                                    const TransitionInfo(
                                                                  hasTransition:
                                                                      true,
                                                                  transitionType:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          0),
                                                                ),
                                                              },
                                                            );
                                                          },
                                                          child: Container(
                                                            constraints:
                                                                const BoxConstraints(
                                                              maxWidth: 300.0,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          8.0,
                                                                          16.0,
                                                                          16.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: Image
                                                                          .network(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          wrapDecrescProdutoRecord
                                                                              .imgProduto
                                                                              .first,
                                                                          'https://cdn-icons-png.flaticon.com/512/7486/7486744.png',
                                                                        ),
                                                                        width:
                                                                            150.0,
                                                                        height:
                                                                            150.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      wrapDecrescProdutoRecord
                                                                          .nomeProduto,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                            fontSize:
                                                                                24.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      if (wrapDecrescProdutoRecord
                                                                              .valorPromo >
                                                                          0.0)
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              4.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '${formatNumber(
                                                                              wrapDecrescProdutoRecord.valorPromo,
                                                                              formatType: FormatType.decimal,
                                                                              decimalType: DecimalType.commaDecimal,
                                                                              currency: 'R\$',
                                                                            )} no Pix',
                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 18.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          formatNumber(
                                                                            wrapDecrescProdutoRecord.valorVenda,
                                                                            formatType:
                                                                                FormatType.decimal,
                                                                            decimalType:
                                                                                DecimalType.commaDecimal,
                                                                            currency:
                                                                                'R\$',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                color: wrapDecrescProdutoRecord.valorPromo > 0.0 ? FlutterFlowTheme.of(context).secondaryText : FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: wrapDecrescProdutoRecord.valorPromo > 0.0 ? 16.0 : 18.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                  );
                                                },
                                              );
                                            }
                                          },
                                        ),
                                      if (FFAppState().categoriaSelecionada !=
                                          null)
                                        Builder(
                                          builder: (context) {
                                            if ((FFAppState()
                                                        .categoriaSelecionada !=
                                                    null) &&
                                                (FFAppState().ordemCrescente ==
                                                    false)) {
                                              return StreamBuilder<
                                                  List<ProdutoRecord>>(
                                                stream: queryProdutoRecord(
                                                  parent:
                                                      catalogoVirtualMinhaLojaRecord
                                                          .reference,
                                                  queryBuilder:
                                                      (produtoRecord) =>
                                                          produtoRecord
                                                              .where(
                                                                'ativo',
                                                                isEqualTo: true,
                                                              )
                                                              .where(
                                                                'categoria',
                                                                isEqualTo:
                                                                    FFAppState()
                                                                        .categoriaSelecionada,
                                                              )
                                                              .orderBy(
                                                                  'nomeProduto'),
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
                                                  List<ProdutoRecord>
                                                      wrapCresc2ProdutoRecordList =
                                                      snapshot.data!;

                                                  return Wrap(
                                                    spacing: 16.0,
                                                    runSpacing: 16.0,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    crossAxisAlignment:
                                                        WrapCrossAlignment
                                                            .start,
                                                    direction: Axis.horizontal,
                                                    runAlignment:
                                                        WrapAlignment.start,
                                                    verticalDirection:
                                                        VerticalDirection.down,
                                                    clipBehavior: Clip.none,
                                                    children: List.generate(
                                                        wrapCresc2ProdutoRecordList
                                                            .length,
                                                        (wrapCresc2Index) {
                                                      final wrapCresc2ProdutoRecord =
                                                          wrapCresc2ProdutoRecordList[
                                                              wrapCresc2Index];
                                                      return Container(
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Visibility(
                                                          visible:
                                                              containerCategoriaRecord
                                                                      ?.ativo ??
                                                                  true,
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                'detalhesProdutoCatalogo',
                                                                queryParameters:
                                                                    {
                                                                  'detalhesProduto':
                                                                      serializeParam(
                                                                    wrapCresc2ProdutoRecord,
                                                                    ParamType
                                                                        .Document,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  'detalhesProduto':
                                                                      wrapCresc2ProdutoRecord,
                                                                  kTransitionInfoKey:
                                                                      const TransitionInfo(
                                                                    hasTransition:
                                                                        true,
                                                                    transitionType:
                                                                        PageTransitionType
                                                                            .fade,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            0),
                                                                  ),
                                                                },
                                                              );
                                                            },
                                                            child: Container(
                                                              constraints:
                                                                  const BoxConstraints(
                                                                maxWidth: 300.0,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              child: Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        8.0,
                                                                        16.0,
                                                                        16.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        child: Image
                                                                            .network(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            wrapCresc2ProdutoRecord.imgProduto.first,
                                                                            'https://cdn-icons-png.flaticon.com/512/7486/7486744.png',
                                                                          ),
                                                                          width:
                                                                              150.0,
                                                                          height:
                                                                              150.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        wrapCresc2ProdutoRecord
                                                                            .nomeProduto,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                              fontSize: 24.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Divider(
                                                                      thickness:
                                                                          1.0,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent4,
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        if (wrapCresc2ProdutoRecord.valorPromo >
                                                                            0.0)
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                4.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              '${formatNumber(
                                                                                wrapCresc2ProdutoRecord.valorPromo,
                                                                                formatType: FormatType.decimal,
                                                                                decimalType: DecimalType.commaDecimal,
                                                                                currency: 'R\$',
                                                                              )} no Pix',
                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 18.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              4.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            formatNumber(
                                                                              wrapCresc2ProdutoRecord.valorVenda,
                                                                              formatType: FormatType.decimal,
                                                                              decimalType: DecimalType.commaDecimal,
                                                                              currency: 'R\$',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                  color: wrapCresc2ProdutoRecord.valorPromo > 0.0 ? FlutterFlowTheme.of(context).secondaryText : FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: wrapCresc2ProdutoRecord.valorPromo > 0.0 ? 16.0 : 18.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                  );
                                                },
                                              );
                                            } else {
                                              return StreamBuilder<
                                                  List<ProdutoRecord>>(
                                                stream: queryProdutoRecord(
                                                  parent:
                                                      catalogoVirtualMinhaLojaRecord
                                                          .reference,
                                                  queryBuilder:
                                                      (produtoRecord) =>
                                                          produtoRecord
                                                              .where(
                                                                'ativo',
                                                                isEqualTo: true,
                                                              )
                                                              .where(
                                                                'categoria',
                                                                isEqualTo:
                                                                    FFAppState()
                                                                        .categoriaSelecionada,
                                                              )
                                                              .orderBy(
                                                                  'nomeProduto',
                                                                  descending:
                                                                      true),
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
                                                  List<ProdutoRecord>
                                                      wrapDecresc2ProdutoRecordList =
                                                      snapshot.data!;

                                                  return Wrap(
                                                    spacing: 16.0,
                                                    runSpacing: 16.0,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    crossAxisAlignment:
                                                        WrapCrossAlignment
                                                            .start,
                                                    direction: Axis.horizontal,
                                                    runAlignment:
                                                        WrapAlignment.start,
                                                    verticalDirection:
                                                        VerticalDirection.down,
                                                    clipBehavior: Clip.none,
                                                    children: List.generate(
                                                        wrapDecresc2ProdutoRecordList
                                                            .length,
                                                        (wrapDecresc2Index) {
                                                      final wrapDecresc2ProdutoRecord =
                                                          wrapDecresc2ProdutoRecordList[
                                                              wrapDecresc2Index];
                                                      return Visibility(
                                                        visible:
                                                            containerCategoriaRecord
                                                                    ?.ativo ??
                                                                true,
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'detalhesProdutoCatalogo',
                                                              queryParameters: {
                                                                'detalhesProduto':
                                                                    serializeParam(
                                                                  wrapDecresc2ProdutoRecord,
                                                                  ParamType
                                                                      .Document,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                'detalhesProduto':
                                                                    wrapDecresc2ProdutoRecord,
                                                                kTransitionInfoKey:
                                                                    const TransitionInfo(
                                                                  hasTransition:
                                                                      true,
                                                                  transitionType:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          0),
                                                                ),
                                                              },
                                                            );
                                                          },
                                                          child: Container(
                                                            constraints:
                                                                const BoxConstraints(
                                                              maxWidth: 300.0,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          8.0,
                                                                          16.0,
                                                                          16.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: Image
                                                                          .network(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          wrapDecresc2ProdutoRecord
                                                                              .imgProduto
                                                                              .first,
                                                                          'https://cdn-icons-png.flaticon.com/512/7486/7486744.png',
                                                                        ),
                                                                        width:
                                                                            150.0,
                                                                        height:
                                                                            150.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      wrapDecresc2ProdutoRecord
                                                                          .nomeProduto,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                            fontSize:
                                                                                24.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      if (wrapDecresc2ProdutoRecord
                                                                              .valorPromo >
                                                                          0.0)
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              4.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '${formatNumber(
                                                                              wrapDecresc2ProdutoRecord.valorPromo,
                                                                              formatType: FormatType.decimal,
                                                                              decimalType: DecimalType.commaDecimal,
                                                                              currency: 'R\$',
                                                                            )} no Pix',
                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 18.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          formatNumber(
                                                                            wrapDecresc2ProdutoRecord.valorVenda,
                                                                            formatType:
                                                                                FormatType.decimal,
                                                                            decimalType:
                                                                                DecimalType.commaDecimal,
                                                                            currency:
                                                                                'R\$',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                color: wrapDecresc2ProdutoRecord.valorPromo > 0.0 ? FlutterFlowTheme.of(context).secondaryText : FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: wrapDecresc2ProdutoRecord.valorPromo > 0.0 ? 16.0 : 18.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                  );
                                                },
                                              );
                                            }
                                          },
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ));
      },
    );
  }
}
