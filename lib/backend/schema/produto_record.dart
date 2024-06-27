import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProdutoRecord extends FirestoreRecord {
  ProdutoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nomeProduto" field.
  String? _nomeProduto;
  String get nomeProduto => _nomeProduto ?? '';
  bool hasNomeProduto() => _nomeProduto != null;

  // "descricaoProduto" field.
  String? _descricaoProduto;
  String get descricaoProduto => _descricaoProduto ?? '';
  bool hasDescricaoProduto() => _descricaoProduto != null;

  // "dataProdutCriado" field.
  DateTime? _dataProdutCriado;
  DateTime? get dataProdutCriado => _dataProdutCriado;
  bool hasDataProdutCriado() => _dataProdutCriado != null;

  // "valorVenda" field.
  double? _valorVenda;
  double get valorVenda => _valorVenda ?? 0.0;
  bool hasValorVenda() => _valorVenda != null;

  // "valorPromo" field.
  double? _valorPromo;
  double get valorPromo => _valorPromo ?? 0.0;
  bool hasValorPromo() => _valorPromo != null;

  // "valorCusto" field.
  double? _valorCusto;
  double get valorCusto => _valorCusto ?? 0.0;
  bool hasValorCusto() => _valorCusto != null;

  // "codigProduto" field.
  String? _codigProduto;
  String get codigProduto => _codigProduto ?? '';
  bool hasCodigProduto() => _codigProduto != null;

  // "imgProduto" field.
  List<String>? _imgProduto;
  List<String> get imgProduto => _imgProduto ?? const [];
  bool hasImgProduto() => _imgProduto != null;

  // "categoria" field.
  DocumentReference? _categoria;
  DocumentReference? get categoria => _categoria;
  bool hasCategoria() => _categoria != null;

  // "ativo" field.
  bool? _ativo;
  bool get ativo => _ativo ?? false;
  bool hasAtivo() => _ativo != null;

  // "qntVendida" field.
  int? _qntVendida;
  int get qntVendida => _qntVendida ?? 0;
  bool hasQntVendida() => _qntVendida != null;

  // "valorTotalVendido" field.
  double? _valorTotalVendido;
  double get valorTotalVendido => _valorTotalVendido ?? 0.0;
  bool hasValorTotalVendido() => _valorTotalVendido != null;

  // "inativo" field.
  bool? _inativo;
  bool get inativo => _inativo ?? false;
  bool hasInativo() => _inativo != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nomeProduto = snapshotData['nomeProduto'] as String?;
    _descricaoProduto = snapshotData['descricaoProduto'] as String?;
    _dataProdutCriado = snapshotData['dataProdutCriado'] as DateTime?;
    _valorVenda = castToType<double>(snapshotData['valorVenda']);
    _valorPromo = castToType<double>(snapshotData['valorPromo']);
    _valorCusto = castToType<double>(snapshotData['valorCusto']);
    _codigProduto = snapshotData['codigProduto'] as String?;
    _imgProduto = getDataList(snapshotData['imgProduto']);
    _categoria = snapshotData['categoria'] as DocumentReference?;
    _ativo = snapshotData['ativo'] as bool?;
    _qntVendida = castToType<int>(snapshotData['qntVendida']);
    _valorTotalVendido = castToType<double>(snapshotData['valorTotalVendido']);
    _inativo = snapshotData['inativo'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('produto')
          : FirebaseFirestore.instance.collectionGroup('produto');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('produto').doc(id);

  static Stream<ProdutoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProdutoRecord.fromSnapshot(s));

  static Future<ProdutoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProdutoRecord.fromSnapshot(s));

  static ProdutoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProdutoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProdutoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProdutoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProdutoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProdutoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProdutoRecordData({
  String? nomeProduto,
  String? descricaoProduto,
  DateTime? dataProdutCriado,
  double? valorVenda,
  double? valorPromo,
  double? valorCusto,
  String? codigProduto,
  DocumentReference? categoria,
  bool? ativo,
  int? qntVendida,
  double? valorTotalVendido,
  bool? inativo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nomeProduto': nomeProduto,
      'descricaoProduto': descricaoProduto,
      'dataProdutCriado': dataProdutCriado,
      'valorVenda': valorVenda,
      'valorPromo': valorPromo,
      'valorCusto': valorCusto,
      'codigProduto': codigProduto,
      'categoria': categoria,
      'ativo': ativo,
      'qntVendida': qntVendida,
      'valorTotalVendido': valorTotalVendido,
      'inativo': inativo,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProdutoRecordDocumentEquality implements Equality<ProdutoRecord> {
  const ProdutoRecordDocumentEquality();

  @override
  bool equals(ProdutoRecord? e1, ProdutoRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nomeProduto == e2?.nomeProduto &&
        e1?.descricaoProduto == e2?.descricaoProduto &&
        e1?.dataProdutCriado == e2?.dataProdutCriado &&
        e1?.valorVenda == e2?.valorVenda &&
        e1?.valorPromo == e2?.valorPromo &&
        e1?.valorCusto == e2?.valorCusto &&
        e1?.codigProduto == e2?.codigProduto &&
        listEquality.equals(e1?.imgProduto, e2?.imgProduto) &&
        e1?.categoria == e2?.categoria &&
        e1?.ativo == e2?.ativo &&
        e1?.qntVendida == e2?.qntVendida &&
        e1?.valorTotalVendido == e2?.valorTotalVendido &&
        e1?.inativo == e2?.inativo;
  }

  @override
  int hash(ProdutoRecord? e) => const ListEquality().hash([
        e?.nomeProduto,
        e?.descricaoProduto,
        e?.dataProdutCriado,
        e?.valorVenda,
        e?.valorPromo,
        e?.valorCusto,
        e?.codigProduto,
        e?.imgProduto,
        e?.categoria,
        e?.ativo,
        e?.qntVendida,
        e?.valorTotalVendido,
        e?.inativo
      ]);

  @override
  bool isValidKey(Object? o) => o is ProdutoRecord;
}
