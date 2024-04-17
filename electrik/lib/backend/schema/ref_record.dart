import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class RefRecord extends FirestoreRecord {
  RefRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "reftype" field.
  String? _reftype;
  String get reftype => _reftype ?? '';
  bool hasReftype() => _reftype != null;

  void _initializeFields() {
    _reftype = snapshotData['reftype'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ref');

  static Stream<RefRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RefRecord.fromSnapshot(s));

  static Future<RefRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RefRecord.fromSnapshot(s));

  static RefRecord fromSnapshot(DocumentSnapshot snapshot) => RefRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RefRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RefRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RefRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RefRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRefRecordData({
  String? reftype,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'reftype': reftype,
    }.withoutNulls,
  );

  return firestoreData;
}

class RefRecordDocumentEquality implements Equality<RefRecord> {
  const RefRecordDocumentEquality();

  @override
  bool equals(RefRecord? e1, RefRecord? e2) {
    return e1?.reftype == e2?.reftype;
  }

  @override
  int hash(RefRecord? e) => const ListEquality().hash([e?.reftype]);

  @override
  bool isValidKey(Object? o) => o is RefRecord;
}
