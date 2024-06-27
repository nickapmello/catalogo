import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/header_catalogo_widget.dart';
import '/components/login_componente/login_componente_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'detalhes_produto_catalogo_model.dart';
export 'detalhes_produto_catalogo_model.dart';

class DetalhesProdutoCatalogoWidget extends StatefulWidget {
  const DetalhesProdutoCatalogoWidget({
    super.key,
    required this.detalhesProduto,
  });

  final ProdutoRecord? detalhesProduto;

  @override
  State<DetalhesProdutoCatalogoWidget> createState() =>
      _DetalhesProdutoCatalogoWidgetState();
}

class _DetalhesProdutoCatalogoWidgetState
    extends State<DetalhesProdutoCatalogoWidget> with TickerProviderStateMixin {
  late DetalhesProdutoCatalogoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetalhesProdutoCatalogoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().listaImgProdutoCarrossel =
          widget.detalhesProduto!.imgProduto.toList().cast<String>();
      FFAppState().imgProdutoSelecionada =
          widget.detalhesProduto!.imgProduto.first;
      setState(() {});
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

    return StreamBuilder<MinhaLojaRecord>(
      stream:
          MinhaLojaRecord.getDocument(widget.detalhesProduto!.parentReference),
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
        final detalhesProdutoCatalogoMinhaLojaRecord = snapshot.data!;
        return Title(
            title: 'detalhesProdutoCatalogo',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              body: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.headerCatalogoModel,
                    updateCallback: () => setState(() {}),
                    child: HeaderCatalogoWidget(
                      parameter1:
                          detalhesProdutoCatalogoMinhaLojaRecord.logoLoja,
                      parameter2:
                          detalhesProdutoCatalogoMinhaLojaRecord.nomeLoja,
                      parameter3: detalhesProdutoCatalogoMinhaLojaRecord,
                      parameter4: detalhesProdutoCatalogoMinhaLojaRecord.cor!,
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 24.0),
                            child: Wrap(
                              spacing: 0.0,
                              runSpacing: 0.0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width >=
                                              768.0
                                          ? (MediaQuery.sizeOf(context).width *
                                              0.5)
                                          : MediaQuery.sizeOf(context).width,
                                      height: 400.0,
                                      constraints: BoxConstraints(
                                        maxWidth: 750.0,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Stack(
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Hero(
                                                  tag: FFAppState()
                                                      .imgProdutoSelecionada,
                                                  transitionOnUserGestures:
                                                      true,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: Image.network(
                                                      FFAppState()
                                                          .imgProdutoSelecionada,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 32.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Card(
                                                        clipBehavior: Clip
                                                            .antiAliasWithSaveLayer,
                                                        color:
                                                            Color(0x3A000000),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 30.0,
                                                          buttonSize: 46.0,
                                                          icon: Icon(
                                                            Icons
                                                                .arrow_back_rounded,
                                                            color: Colors.white,
                                                            size: 25.0,
                                                          ),
                                                          onPressed: () async {
                                                            context.pop();
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final listaImgClicaveis = widget
                                                  .detalhesProduto?.imgProduto
                                                  ?.toList() ??
                                              [];
                                          return Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: List.generate(
                                                listaImgClicaveis.length,
                                                (listaImgClicaveisIndex) {
                                              final listaImgClicaveisItem =
                                                  listaImgClicaveis[
                                                      listaImgClicaveisIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 16.0, 0.0),
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
                                                            .imgProdutoSelecionada =
                                                        listaImgClicaveisItem;
                                                    setState(() {});
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      listaImgClicaveisItem,
                                                      width: 120.0,
                                                      height: 120.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                StreamBuilder<CategoriaRecord>(
                                  stream: CategoriaRecord.getDocument(
                                      widget.detalhesProduto!.categoria!),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    final containerCategoriaRecord =
                                        snapshot.data!;
                                    return Container(
                                      width: MediaQuery.sizeOf(context).width >=
                                              768.0
                                          ? (MediaQuery.sizeOf(context).width *
                                              0.5)
                                          : MediaQuery.sizeOf(context).width,
                                      constraints: BoxConstraints(
                                        maxWidth: 750.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 32.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 20.0, 24.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        widget.detalhesProduto
                                                            ?.nomeProduto,
                                                        'null',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineMediumFamily),
                                                              ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (widget
                                                              .detalhesProduto!
                                                              .valorPromo >
                                                          0.0)
                                                        Text(
                                                          formatNumber(
                                                            widget
                                                                .detalhesProduto!
                                                                .valorPromo,
                                                            formatType:
                                                                FormatType
                                                                    .decimal,
                                                            decimalType:
                                                                DecimalType
                                                                    .commaDecimal,
                                                            currency: 'R\$',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 20.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineMediumFamily),
                                                              ),
                                                        ),
                                                      if (widget
                                                              .detalhesProduto!
                                                              .valorPromo >
                                                          0.0)
                                                        Text(
                                                          formatNumber(
                                                            widget
                                                                .detalhesProduto!
                                                                .valorVenda,
                                                            formatType:
                                                                FormatType
                                                                    .decimal,
                                                            decimalType:
                                                                DecimalType
                                                                    .commaDecimal,
                                                            currency: 'R\$',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 20.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineMediumFamily),
                                                              ),
                                                        ),
                                                      if (widget
                                                              .detalhesProduto!
                                                              .valorPromo <
                                                          0.0)
                                                        Text(
                                                          formatNumber(
                                                            widget
                                                                .detalhesProduto!
                                                                .valorVenda,
                                                            formatType:
                                                                FormatType
                                                                    .decimal,
                                                            decimalType:
                                                                DecimalType
                                                                    .commaDecimal,
                                                            currency: 'R\$',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 20.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineMediumFamily),
                                                              ),
                                                        ),
                                                    ].divide(
                                                        SizedBox(width: 20.0)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 4.0, 24.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    containerCategoriaRecord
                                                        .nome,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily),
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 16.0, 24.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'r9ymihvv' /* Descrição */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmallFamily,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily),
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 4.0, 24.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        widget.detalhesProduto
                                                            ?.descricaoProduto,
                                                        'null',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily),
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            if (responsiveVisibility(
                                              context: context,
                                              phone: false,
                                              tablet: false,
                                            ))
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 42.0, 16.0, 42.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Flexible(
                                                      child: Builder(
                                                        builder: (context) =>
                                                            Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              if (loggedIn &&
                                                                  !valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.lojista,
                                                                      false)) {
                                                                _model.pesquisaCarrinho =
                                                                    await queryCarrinhoRecordOnce(
                                                                  queryBuilder: (carrinhoRecord) =>
                                                                      carrinhoRecord
                                                                          .where(
                                                                            'userComprador',
                                                                            isEqualTo:
                                                                                currentUserReference,
                                                                          )
                                                                          .where(
                                                                            'loja',
                                                                            isEqualTo:
                                                                                detalhesProdutoCatalogoMinhaLojaRecord.reference,
                                                                          ),
                                                                  singleRecord:
                                                                      true,
                                                                ).then((s) => s
                                                                        .firstOrNull);
                                                                if (_model
                                                                        .pesquisaCarrinho !=
                                                                    null) {
                                                                  _model.produtoExiste =
                                                                      await queryProdutoCarrinhoRecordOnce(
                                                                    parent: _model
                                                                        .pesquisaCarrinho
                                                                        ?.reference,
                                                                    queryBuilder:
                                                                        (produtoCarrinhoRecord) =>
                                                                            produtoCarrinhoRecord.where(
                                                                      'produto',
                                                                      isEqualTo: widget
                                                                          .detalhesProduto
                                                                          ?.reference,
                                                                    ),
                                                                    singleRecord:
                                                                        true,
                                                                  ).then((s) =>
                                                                          s.firstOrNull);
                                                                  if (_model
                                                                          .produtoExiste !=
                                                                      null) {
                                                                    await _model
                                                                        .produtoExiste!
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'quantidade':
                                                                              FieldValue.increment(1),
                                                                          'subtotal': FieldValue.increment(_model
                                                                              .produtoExiste!
                                                                              .valorUnitario),
                                                                        },
                                                                      ),
                                                                    });

                                                                    await _model
                                                                        .pesquisaCarrinho!
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'total': FieldValue.increment(_model
                                                                              .produtoExiste!
                                                                              .valorUnitario),
                                                                        },
                                                                      ),
                                                                    });
                                                                  } else {
                                                                    var produtoCarrinhoRecordReference1 =
                                                                        ProdutoCarrinhoRecord.createDoc(_model
                                                                            .pesquisaCarrinho!
                                                                            .reference);
                                                                    await produtoCarrinhoRecordReference1
                                                                        .set(
                                                                            createProdutoCarrinhoRecordData(
                                                                      produto: widget
                                                                          .detalhesProduto
                                                                          ?.reference,
                                                                      valorUnitario: widget.detalhesProduto!.valorPromo >
                                                                              0.0
                                                                          ? widget
                                                                              .detalhesProduto
                                                                              ?.valorPromo
                                                                          : widget
                                                                              .detalhesProduto
                                                                              ?.valorVenda,
                                                                      quantidade:
                                                                          1,
                                                                      subtotal: widget.detalhesProduto!.valorPromo >
                                                                              0.0
                                                                          ? widget
                                                                              .detalhesProduto
                                                                              ?.valorPromo
                                                                          : widget
                                                                              .detalhesProduto
                                                                              ?.valorVenda,
                                                                    ));
                                                                    _model.produtoCarrinhoExiste =
                                                                        ProdutoCarrinhoRecord.getDocumentFromData(
                                                                            createProdutoCarrinhoRecordData(
                                                                              produto: widget.detalhesProduto?.reference,
                                                                              valorUnitario: widget.detalhesProduto!.valorPromo > 0.0 ? widget.detalhesProduto?.valorPromo : widget.detalhesProduto?.valorVenda,
                                                                              quantidade: 1,
                                                                              subtotal: widget.detalhesProduto!.valorPromo > 0.0 ? widget.detalhesProduto?.valorPromo : widget.detalhesProduto?.valorVenda,
                                                                            ),
                                                                            produtoCarrinhoRecordReference1);

                                                                    await _model
                                                                        .pesquisaCarrinho!
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'total': FieldValue.increment(_model
                                                                              .produtoCarrinhoExiste!
                                                                              .valorUnitario),
                                                                        },
                                                                      ),
                                                                    });
                                                                  }

                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            'Produto adicionado!'),
                                                                        content:
                                                                            Text('Este produto foi adicionado no seu carrinho!'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                                Text('Ok'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                } else {
                                                                  var carrinhoRecordReference =
                                                                      CarrinhoRecord
                                                                          .collection
                                                                          .doc();
                                                                  await carrinhoRecordReference
                                                                      .set(
                                                                          createCarrinhoRecordData(
                                                                    userComprador:
                                                                        currentUserReference,
                                                                    loja: detalhesProdutoCatalogoMinhaLojaRecord
                                                                        .reference,
                                                                  ));
                                                                  _model.novoCarrinho =
                                                                      CarrinhoRecord.getDocumentFromData(
                                                                          createCarrinhoRecordData(
                                                                            userComprador:
                                                                                currentUserReference,
                                                                            loja:
                                                                                detalhesProdutoCatalogoMinhaLojaRecord.reference,
                                                                          ),
                                                                          carrinhoRecordReference);

                                                                  var produtoCarrinhoRecordReference2 =
                                                                      ProdutoCarrinhoRecord.createDoc(_model
                                                                          .novoCarrinho!
                                                                          .reference);
                                                                  await produtoCarrinhoRecordReference2
                                                                      .set(
                                                                          createProdutoCarrinhoRecordData(
                                                                    produto: widget
                                                                        .detalhesProduto
                                                                        ?.reference,
                                                                    valorUnitario: widget
                                                                        .detalhesProduto
                                                                        ?.valorVenda,
                                                                    quantidade:
                                                                        1,
                                                                    subtotal: widget
                                                                                .detalhesProduto!.valorPromo >
                                                                            0.0
                                                                        ? widget
                                                                            .detalhesProduto
                                                                            ?.valorPromo
                                                                        : widget
                                                                            .detalhesProduto
                                                                            ?.valorVenda,
                                                                  ));
                                                                  _model.produtoCarrinhoAdd =
                                                                      ProdutoCarrinhoRecord.getDocumentFromData(
                                                                          createProdutoCarrinhoRecordData(
                                                                            produto:
                                                                                widget.detalhesProduto?.reference,
                                                                            valorUnitario:
                                                                                widget.detalhesProduto?.valorVenda,
                                                                            quantidade:
                                                                                1,
                                                                            subtotal: widget.detalhesProduto!.valorPromo > 0.0
                                                                                ? widget.detalhesProduto?.valorPromo
                                                                                : widget.detalhesProduto?.valorVenda,
                                                                          ),
                                                                          produtoCarrinhoRecordReference2);

                                                                  await _model
                                                                      .novoCarrinho!
                                                                      .reference
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'total': FieldValue.increment(_model
                                                                            .produtoCarrinhoAdd!
                                                                            .valorUnitario),
                                                                      },
                                                                    ),
                                                                  });
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            'Produto adicionado!'),
                                                                        content:
                                                                            Text('Este produto foi adicionado no seu carrinho!'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                                Text('Ok'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                }
                                                              } else {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: Text(
                                                                          'Você precisa estar logado!'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Dialog(
                                                                      elevation:
                                                                          0,
                                                                      insetPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          LoginComponenteWidget(
                                                                        tipoUsuarioLogin:
                                                                            'cliente',
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    setState(
                                                                        () {}));
                                                              }

                                                              setState(() {});
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'lx00m5y4' /* Adicionar */,
                                                            ),
                                                            icon: Icon(
                                                              Icons
                                                                  .shopping_cart_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              size: 20.0,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 50.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey('Outfit'),
                                                                      ),
                                                              elevation: 3.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (responsiveVisibility(
                    context: context,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryText,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x55000000),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 24.0, 16.0, 24.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 16.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'dtpkw5pi' /* Pedir por Whatsapp */,
                                  ),
                                  icon: FaIcon(
                                    FontAwesomeIcons.whatsapp,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 20.0,
                                  ),
                                  options: FFButtonOptions(
                                    height: 50.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 12.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    color: Color(0xFF42C452),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey('Outfit'),
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: Color(0xFF42C452),
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Builder(
                                builder: (context) => Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      if (loggedIn &&
                                          !valueOrDefault<bool>(
                                              currentUserDocument?.lojista,
                                              false)) {
                                        _model.pesquisaCarrinhoCopy =
                                            await queryCarrinhoRecordOnce(
                                          queryBuilder: (carrinhoRecord) =>
                                              carrinhoRecord
                                                  .where(
                                                    'userComprador',
                                                    isEqualTo:
                                                        currentUserReference,
                                                  )
                                                  .where(
                                                    'loja',
                                                    isEqualTo:
                                                        detalhesProdutoCatalogoMinhaLojaRecord
                                                            .reference,
                                                  ),
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);
                                        if (_model.pesquisaCarrinhoCopy !=
                                            null) {
                                          _model.produtoExisteCopy =
                                              await queryProdutoCarrinhoRecordOnce(
                                            parent: _model.pesquisaCarrinhoCopy
                                                ?.reference,
                                            queryBuilder:
                                                (produtoCarrinhoRecord) =>
                                                    produtoCarrinhoRecord.where(
                                              'produto',
                                              isEqualTo: widget
                                                  .detalhesProduto?.reference,
                                            ),
                                            singleRecord: true,
                                          ).then((s) => s.firstOrNull);
                                          if (_model.produtoExiste != null) {
                                            await _model
                                                .produtoExisteCopy!.reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'quantidade':
                                                      FieldValue.increment(1),
                                                  'subtotal': FieldValue
                                                      .increment(_model
                                                          .produtoExisteCopy!
                                                          .valorUnitario),
                                                },
                                              ),
                                            });

                                            await _model
                                                .pesquisaCarrinhoCopy!.reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'total': FieldValue.increment(
                                                      _model.produtoExisteCopy!
                                                          .valorUnitario),
                                                },
                                              ),
                                            });
                                          } else {
                                            var produtoCarrinhoRecordReference1 =
                                                ProdutoCarrinhoRecord.createDoc(
                                                    _model.pesquisaCarrinhoCopy!
                                                        .reference);
                                            await produtoCarrinhoRecordReference1
                                                .set(
                                                    createProdutoCarrinhoRecordData(
                                              produto: widget
                                                  .detalhesProduto?.reference,
                                              valorUnitario: widget
                                                          .detalhesProduto!
                                                          .valorPromo >
                                                      0.0
                                                  ? widget.detalhesProduto
                                                      ?.valorPromo
                                                  : widget.detalhesProduto
                                                      ?.valorVenda,
                                              quantidade: 1,
                                              subtotal: widget.detalhesProduto!
                                                          .valorPromo >
                                                      0.0
                                                  ? widget.detalhesProduto
                                                      ?.valorPromo
                                                  : widget.detalhesProduto
                                                      ?.valorVenda,
                                            ));
                                            _model.produtoCarrinhoExisteCopy =
                                                ProdutoCarrinhoRecord
                                                    .getDocumentFromData(
                                                        createProdutoCarrinhoRecordData(
                                                          produto: widget
                                                              .detalhesProduto
                                                              ?.reference,
                                                          valorUnitario: widget
                                                                      .detalhesProduto!
                                                                      .valorPromo >
                                                                  0.0
                                                              ? widget
                                                                  .detalhesProduto
                                                                  ?.valorPromo
                                                              : widget
                                                                  .detalhesProduto
                                                                  ?.valorVenda,
                                                          quantidade: 1,
                                                          subtotal: widget
                                                                      .detalhesProduto!
                                                                      .valorPromo >
                                                                  0.0
                                                              ? widget
                                                                  .detalhesProduto
                                                                  ?.valorPromo
                                                              : widget
                                                                  .detalhesProduto
                                                                  ?.valorVenda,
                                                        ),
                                                        produtoCarrinhoRecordReference1);

                                            await _model
                                                .pesquisaCarrinhoCopy!.reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'total': FieldValue.increment(
                                                      _model
                                                          .produtoCarrinhoExisteCopy!
                                                          .valorUnitario),
                                                },
                                              ),
                                            });
                                          }

                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title:
                                                    Text('Produto adicionado!'),
                                                content: Text(
                                                    'Este produto foi adicionado no seu carrinho!'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        } else {
                                          var carrinhoRecordReference =
                                              CarrinhoRecord.collection.doc();
                                          await carrinhoRecordReference
                                              .set(createCarrinhoRecordData(
                                            userComprador: currentUserReference,
                                            loja:
                                                detalhesProdutoCatalogoMinhaLojaRecord
                                                    .reference,
                                          ));
                                          _model.novoCarrinhoCopy =
                                              CarrinhoRecord
                                                  .getDocumentFromData(
                                                      createCarrinhoRecordData(
                                                        userComprador:
                                                            currentUserReference,
                                                        loja:
                                                            detalhesProdutoCatalogoMinhaLojaRecord
                                                                .reference,
                                                      ),
                                                      carrinhoRecordReference);

                                          var produtoCarrinhoRecordReference2 =
                                              ProdutoCarrinhoRecord.createDoc(
                                                  _model.novoCarrinhoCopy!
                                                      .reference);
                                          await produtoCarrinhoRecordReference2
                                              .set(
                                                  createProdutoCarrinhoRecordData(
                                            produto: widget
                                                .detalhesProduto?.reference,
                                            valorUnitario: widget
                                                .detalhesProduto?.valorVenda,
                                            quantidade: 1,
                                            subtotal: widget.detalhesProduto!
                                                        .valorPromo >
                                                    0.0
                                                ? widget
                                                    .detalhesProduto?.valorPromo
                                                : widget.detalhesProduto
                                                    ?.valorVenda,
                                          ));
                                          _model.produtoCarrinhoAddCopy =
                                              ProdutoCarrinhoRecord.getDocumentFromData(
                                                  createProdutoCarrinhoRecordData(
                                                    produto: widget
                                                        .detalhesProduto
                                                        ?.reference,
                                                    valorUnitario: widget
                                                        .detalhesProduto
                                                        ?.valorVenda,
                                                    quantidade: 1,
                                                    subtotal: widget
                                                                .detalhesProduto!
                                                                .valorPromo >
                                                            0.0
                                                        ? widget.detalhesProduto
                                                            ?.valorPromo
                                                        : widget.detalhesProduto
                                                            ?.valorVenda,
                                                  ),
                                                  produtoCarrinhoRecordReference2);

                                          await _model
                                              .novoCarrinhoCopy!.reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'total': FieldValue.increment(
                                                    _model.produtoCarrinhoAdd!
                                                        .valorUnitario),
                                              },
                                            ),
                                          });
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title:
                                                    Text('Produto adicionado!'),
                                                content: Text(
                                                    'Este produto foi adicionado no seu carrinho!'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text(
                                                  'Você precisa estar logado!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: LoginComponenteWidget(
                                                tipoUsuarioLogin: 'cliente',
                                              ),
                                            );
                                          },
                                        ).then((value) => setState(() {}));
                                      }

                                      setState(() {});
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'sskyf93v' /* Adicionar */,
                                    ),
                                    icon: Icon(
                                      Icons.shopping_cart_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      size: 20.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 50.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 12.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              8.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: Colors.white,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Outfit'),
                                          ),
                                      elevation: 3.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                    ),
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
            ));
      },
    );
  }
}
