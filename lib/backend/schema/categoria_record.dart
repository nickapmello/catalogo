import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriaRecord extends FirestoreRecord {
  CategoriaRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "categoriaRef" field.
  String? _categoriaRef;
  String get categoriaRef => _categoriaRef ?? '';
  bool hasCategoriaRef() => _categoriaRef != null;

  // "ativo" field.
  bool? _ativo;
  bool get ativo => _ativo ?? false;
  bool hasAtivo() => _ativo != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _categoriaRef = snapshotData['categoriaRef'] as String?;
    _ativo = snapshotData['ativo'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('categoria')
          : FirebaseFirestore.instance.collectionGroup('categoria');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('categoria').doc(id);

  static Stream<CategoriaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoriaRecord.fromSnapshot(s));

  static Future<CategoriaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoriaRecord.fromSnapshot(s));

  static CategoriaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoriaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoriaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoriaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoriaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoriaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoriaRecordData({
  String? nome,
  String? categoriaRef,
  bool? ativo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'categoriaRef': categoriaRef,
      'ativo': ativo,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoriaRecordDocumentEquality implements Equality<CategoriaRecord> {
  const CategoriaRecordDocumentEquality();

  @override
  bool equals(CategoriaRecord? e1, CategoriaRecord? e2) {
    return e1?.nome == e2?.nome &&
        e1?.categoriaRef == e2?.categoriaRef &&
        e1?.ativo == e2?.ativo;
  }

  @override
  int hash(CategoriaRecord? e) =>
      const ListEquality().hash([e?.nome, e?.categoriaRef, e?.ativo]);

  @override
  bool isValidKey(Object? o) => o is CategoriaRecord;
}
