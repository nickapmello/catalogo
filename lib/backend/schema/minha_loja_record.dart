import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MinhaLojaRecord extends FirestoreRecord {
  MinhaLojaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nomeLoja" field.
  String? _nomeLoja;
  String get nomeLoja => _nomeLoja ?? '';
  bool hasNomeLoja() => _nomeLoja != null;

  // "logoLoja" field.
  String? _logoLoja;
  String get logoLoja => _logoLoja ?? '';
  bool hasLogoLoja() => _logoLoja != null;

  // "dataCriacao" field.
  DateTime? _dataCriacao;
  DateTime? get dataCriacao => _dataCriacao;
  bool hasDataCriacao() => _dataCriacao != null;

  // "urlLoja" field.
  String? _urlLoja;
  String get urlLoja => _urlLoja ?? '';
  bool hasUrlLoja() => _urlLoja != null;

  // "cnpjLoja" field.
  String? _cnpjLoja;
  String get cnpjLoja => _cnpjLoja ?? '';
  bool hasCnpjLoja() => _cnpjLoja != null;

  // "descricaoLoja" field.
  String? _descricaoLoja;
  String get descricaoLoja => _descricaoLoja ?? '';
  bool hasDescricaoLoja() => _descricaoLoja != null;

  // "enderecoRua" field.
  String? _enderecoRua;
  String get enderecoRua => _enderecoRua ?? '';
  bool hasEnderecoRua() => _enderecoRua != null;

  // "enderecoBairro" field.
  String? _enderecoBairro;
  String get enderecoBairro => _enderecoBairro ?? '';
  bool hasEnderecoBairro() => _enderecoBairro != null;

  // "enderecoEstado" field.
  String? _enderecoEstado;
  String get enderecoEstado => _enderecoEstado ?? '';
  bool hasEnderecoEstado() => _enderecoEstado != null;

  // "enderecoNumero" field.
  String? _enderecoNumero;
  String get enderecoNumero => _enderecoNumero ?? '';
  bool hasEnderecoNumero() => _enderecoNumero != null;

  // "telefoneLoja" field.
  String? _telefoneLoja;
  String get telefoneLoja => _telefoneLoja ?? '';
  bool hasTelefoneLoja() => _telefoneLoja != null;

  // "instagramLoja" field.
  String? _instagramLoja;
  String get instagramLoja => _instagramLoja ?? '';
  bool hasInstagramLoja() => _instagramLoja != null;

  // "emailLoja" field.
  String? _emailLoja;
  String get emailLoja => _emailLoja ?? '';
  bool hasEmailLoja() => _emailLoja != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "enderecoCidade" field.
  String? _enderecoCidade;
  String get enderecoCidade => _enderecoCidade ?? '';
  bool hasEnderecoCidade() => _enderecoCidade != null;

  // "cor" field.
  Color? _cor;
  Color? get cor => _cor;
  bool hasCor() => _cor != null;

  void _initializeFields() {
    _nomeLoja = snapshotData['nomeLoja'] as String?;
    _logoLoja = snapshotData['logoLoja'] as String?;
    _dataCriacao = snapshotData['dataCriacao'] as DateTime?;
    _urlLoja = snapshotData['urlLoja'] as String?;
    _cnpjLoja = snapshotData['cnpjLoja'] as String?;
    _descricaoLoja = snapshotData['descricaoLoja'] as String?;
    _enderecoRua = snapshotData['enderecoRua'] as String?;
    _enderecoBairro = snapshotData['enderecoBairro'] as String?;
    _enderecoEstado = snapshotData['enderecoEstado'] as String?;
    _enderecoNumero = snapshotData['enderecoNumero'] as String?;
    _telefoneLoja = snapshotData['telefoneLoja'] as String?;
    _instagramLoja = snapshotData['instagramLoja'] as String?;
    _emailLoja = snapshotData['emailLoja'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
    _enderecoCidade = snapshotData['enderecoCidade'] as String?;
    _cor = getSchemaColor(snapshotData['cor']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('minhaLoja');

  static Stream<MinhaLojaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MinhaLojaRecord.fromSnapshot(s));

  static Future<MinhaLojaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MinhaLojaRecord.fromSnapshot(s));

  static MinhaLojaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MinhaLojaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MinhaLojaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MinhaLojaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MinhaLojaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MinhaLojaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMinhaLojaRecordData({
  String? nomeLoja,
  String? logoLoja,
  DateTime? dataCriacao,
  String? urlLoja,
  String? cnpjLoja,
  String? descricaoLoja,
  String? enderecoRua,
  String? enderecoBairro,
  String? enderecoEstado,
  String? enderecoNumero,
  String? telefoneLoja,
  String? instagramLoja,
  String? emailLoja,
  DocumentReference? user,
  String? enderecoCidade,
  Color? cor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nomeLoja': nomeLoja,
      'logoLoja': logoLoja,
      'dataCriacao': dataCriacao,
      'urlLoja': urlLoja,
      'cnpjLoja': cnpjLoja,
      'descricaoLoja': descricaoLoja,
      'enderecoRua': enderecoRua,
      'enderecoBairro': enderecoBairro,
      'enderecoEstado': enderecoEstado,
      'enderecoNumero': enderecoNumero,
      'telefoneLoja': telefoneLoja,
      'instagramLoja': instagramLoja,
      'emailLoja': emailLoja,
      'user': user,
      'enderecoCidade': enderecoCidade,
      'cor': cor,
    }.withoutNulls,
  );

  return firestoreData;
}

class MinhaLojaRecordDocumentEquality implements Equality<MinhaLojaRecord> {
  const MinhaLojaRecordDocumentEquality();

  @override
  bool equals(MinhaLojaRecord? e1, MinhaLojaRecord? e2) {
    return e1?.nomeLoja == e2?.nomeLoja &&
        e1?.logoLoja == e2?.logoLoja &&
        e1?.dataCriacao == e2?.dataCriacao &&
        e1?.urlLoja == e2?.urlLoja &&
        e1?.cnpjLoja == e2?.cnpjLoja &&
        e1?.descricaoLoja == e2?.descricaoLoja &&
        e1?.enderecoRua == e2?.enderecoRua &&
        e1?.enderecoBairro == e2?.enderecoBairro &&
        e1?.enderecoEstado == e2?.enderecoEstado &&
        e1?.enderecoNumero == e2?.enderecoNumero &&
        e1?.telefoneLoja == e2?.telefoneLoja &&
        e1?.instagramLoja == e2?.instagramLoja &&
        e1?.emailLoja == e2?.emailLoja &&
        e1?.user == e2?.user &&
        e1?.enderecoCidade == e2?.enderecoCidade &&
        e1?.cor == e2?.cor;
  }

  @override
  int hash(MinhaLojaRecord? e) => const ListEquality().hash([
        e?.nomeLoja,
        e?.logoLoja,
        e?.dataCriacao,
        e?.urlLoja,
        e?.cnpjLoja,
        e?.descricaoLoja,
        e?.enderecoRua,
        e?.enderecoBairro,
        e?.enderecoEstado,
        e?.enderecoNumero,
        e?.telefoneLoja,
        e?.instagramLoja,
        e?.emailLoja,
        e?.user,
        e?.enderecoCidade,
        e?.cor
      ]);

  @override
  bool isValidKey(Object? o) => o is MinhaLojaRecord;
}
