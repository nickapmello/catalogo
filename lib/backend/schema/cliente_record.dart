import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClienteRecord extends FirestoreRecord {
  ClienteRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nomeCliente" field.
  String? _nomeCliente;
  String get nomeCliente => _nomeCliente ?? '';
  bool hasNomeCliente() => _nomeCliente != null;

  // "cpfcnpjCliente" field.
  String? _cpfcnpjCliente;
  String get cpfcnpjCliente => _cpfcnpjCliente ?? '';
  bool hasCpfcnpjCliente() => _cpfcnpjCliente != null;

  // "observacoesCliente" field.
  String? _observacoesCliente;
  String get observacoesCliente => _observacoesCliente ?? '';
  bool hasObservacoesCliente() => _observacoesCliente != null;

  // "emailCliente" field.
  String? _emailCliente;
  String get emailCliente => _emailCliente ?? '';
  bool hasEmailCliente() => _emailCliente != null;

  // "clienteId" field.
  String? _clienteId;
  String get clienteId => _clienteId ?? '';
  bool hasClienteId() => _clienteId != null;

  // "createData" field.
  DateTime? _createData;
  DateTime? get createData => _createData;
  bool hasCreateData() => _createData != null;

  // "enderecoRuaCliente" field.
  String? _enderecoRuaCliente;
  String get enderecoRuaCliente => _enderecoRuaCliente ?? '';
  bool hasEnderecoRuaCliente() => _enderecoRuaCliente != null;

  // "enderecoNumeroCliente" field.
  String? _enderecoNumeroCliente;
  String get enderecoNumeroCliente => _enderecoNumeroCliente ?? '';
  bool hasEnderecoNumeroCliente() => _enderecoNumeroCliente != null;

  // "enderecoBairroCliente" field.
  String? _enderecoBairroCliente;
  String get enderecoBairroCliente => _enderecoBairroCliente ?? '';
  bool hasEnderecoBairroCliente() => _enderecoBairroCliente != null;

  // "telefoneCliente" field.
  String? _telefoneCliente;
  String get telefoneCliente => _telefoneCliente ?? '';
  bool hasTelefoneCliente() => _telefoneCliente != null;

  // "fotoCliente" field.
  String? _fotoCliente;
  String get fotoCliente => _fotoCliente ?? '';
  bool hasFotoCliente() => _fotoCliente != null;

  // "enderecoCidadeCliente" field.
  String? _enderecoCidadeCliente;
  String get enderecoCidadeCliente => _enderecoCidadeCliente ?? '';
  bool hasEnderecoCidadeCliente() => _enderecoCidadeCliente != null;

  // "enderecoEstadoCliente" field.
  String? _enderecoEstadoCliente;
  String get enderecoEstadoCliente => _enderecoEstadoCliente ?? '';
  bool hasEnderecoEstadoCliente() => _enderecoEstadoCliente != null;

  // "ativo" field.
  bool? _ativo;
  bool get ativo => _ativo ?? false;
  bool hasAtivo() => _ativo != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nomeCliente = snapshotData['nomeCliente'] as String?;
    _cpfcnpjCliente = snapshotData['cpfcnpjCliente'] as String?;
    _observacoesCliente = snapshotData['observacoesCliente'] as String?;
    _emailCliente = snapshotData['emailCliente'] as String?;
    _clienteId = snapshotData['clienteId'] as String?;
    _createData = snapshotData['createData'] as DateTime?;
    _enderecoRuaCliente = snapshotData['enderecoRuaCliente'] as String?;
    _enderecoNumeroCliente = snapshotData['enderecoNumeroCliente'] as String?;
    _enderecoBairroCliente = snapshotData['enderecoBairroCliente'] as String?;
    _telefoneCliente = snapshotData['telefoneCliente'] as String?;
    _fotoCliente = snapshotData['fotoCliente'] as String?;
    _enderecoCidadeCliente = snapshotData['enderecoCidadeCliente'] as String?;
    _enderecoEstadoCliente = snapshotData['enderecoEstadoCliente'] as String?;
    _ativo = snapshotData['ativo'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('cliente')
          : FirebaseFirestore.instance.collectionGroup('cliente');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('cliente').doc(id);

  static Stream<ClienteRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClienteRecord.fromSnapshot(s));

  static Future<ClienteRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClienteRecord.fromSnapshot(s));

  static ClienteRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ClienteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClienteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClienteRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClienteRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClienteRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClienteRecordData({
  String? nomeCliente,
  String? cpfcnpjCliente,
  String? observacoesCliente,
  String? emailCliente,
  String? clienteId,
  DateTime? createData,
  String? enderecoRuaCliente,
  String? enderecoNumeroCliente,
  String? enderecoBairroCliente,
  String? telefoneCliente,
  String? fotoCliente,
  String? enderecoCidadeCliente,
  String? enderecoEstadoCliente,
  bool? ativo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nomeCliente': nomeCliente,
      'cpfcnpjCliente': cpfcnpjCliente,
      'observacoesCliente': observacoesCliente,
      'emailCliente': emailCliente,
      'clienteId': clienteId,
      'createData': createData,
      'enderecoRuaCliente': enderecoRuaCliente,
      'enderecoNumeroCliente': enderecoNumeroCliente,
      'enderecoBairroCliente': enderecoBairroCliente,
      'telefoneCliente': telefoneCliente,
      'fotoCliente': fotoCliente,
      'enderecoCidadeCliente': enderecoCidadeCliente,
      'enderecoEstadoCliente': enderecoEstadoCliente,
      'ativo': ativo,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClienteRecordDocumentEquality implements Equality<ClienteRecord> {
  const ClienteRecordDocumentEquality();

  @override
  bool equals(ClienteRecord? e1, ClienteRecord? e2) {
    return e1?.nomeCliente == e2?.nomeCliente &&
        e1?.cpfcnpjCliente == e2?.cpfcnpjCliente &&
        e1?.observacoesCliente == e2?.observacoesCliente &&
        e1?.emailCliente == e2?.emailCliente &&
        e1?.clienteId == e2?.clienteId &&
        e1?.createData == e2?.createData &&
        e1?.enderecoRuaCliente == e2?.enderecoRuaCliente &&
        e1?.enderecoNumeroCliente == e2?.enderecoNumeroCliente &&
        e1?.enderecoBairroCliente == e2?.enderecoBairroCliente &&
        e1?.telefoneCliente == e2?.telefoneCliente &&
        e1?.fotoCliente == e2?.fotoCliente &&
        e1?.enderecoCidadeCliente == e2?.enderecoCidadeCliente &&
        e1?.enderecoEstadoCliente == e2?.enderecoEstadoCliente &&
        e1?.ativo == e2?.ativo;
  }

  @override
  int hash(ClienteRecord? e) => const ListEquality().hash([
        e?.nomeCliente,
        e?.cpfcnpjCliente,
        e?.observacoesCliente,
        e?.emailCliente,
        e?.clienteId,
        e?.createData,
        e?.enderecoRuaCliente,
        e?.enderecoNumeroCliente,
        e?.enderecoBairroCliente,
        e?.telefoneCliente,
        e?.fotoCliente,
        e?.enderecoCidadeCliente,
        e?.enderecoEstadoCliente,
        e?.ativo
      ]);

  @override
  bool isValidKey(Object? o) => o is ClienteRecord;
}
