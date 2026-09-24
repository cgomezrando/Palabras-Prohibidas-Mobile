// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionStruct extends BaseStruct {
  QuestionStruct({
    int? id,
    String? palabraAdivinar,
    String? palabraProhibida1,
    String? palabraProhibida2,
    String? palabraProhibida3,
    String? palabraProhibida4,
  })  : _id = id,
        _palabraAdivinar = palabraAdivinar,
        _palabraProhibida1 = palabraProhibida1,
        _palabraProhibida2 = palabraProhibida2,
        _palabraProhibida3 = palabraProhibida3,
        _palabraProhibida4 = palabraProhibida4;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "PalabraAdivinar" field.
  String? _palabraAdivinar;
  String get palabraAdivinar => _palabraAdivinar ?? '';
  set palabraAdivinar(String? val) => _palabraAdivinar = val;

  bool hasPalabraAdivinar() => _palabraAdivinar != null;

  // "PalabraProhibida1" field.
  String? _palabraProhibida1;
  String get palabraProhibida1 => _palabraProhibida1 ?? '';
  set palabraProhibida1(String? val) => _palabraProhibida1 = val;

  bool hasPalabraProhibida1() => _palabraProhibida1 != null;

  // "PalabraProhibida2" field.
  String? _palabraProhibida2;
  String get palabraProhibida2 => _palabraProhibida2 ?? '';
  set palabraProhibida2(String? val) => _palabraProhibida2 = val;

  bool hasPalabraProhibida2() => _palabraProhibida2 != null;

  // "PalabraProhibida3" field.
  String? _palabraProhibida3;
  String get palabraProhibida3 => _palabraProhibida3 ?? '';
  set palabraProhibida3(String? val) => _palabraProhibida3 = val;

  bool hasPalabraProhibida3() => _palabraProhibida3 != null;

  // "PalabraProhibida4" field.
  String? _palabraProhibida4;
  String get palabraProhibida4 => _palabraProhibida4 ?? '';
  set palabraProhibida4(String? val) => _palabraProhibida4 = val;

  bool hasPalabraProhibida4() => _palabraProhibida4 != null;

  static QuestionStruct fromMap(Map<String, dynamic> data) => QuestionStruct(
        id: castToType<int>(data['id']),
        palabraAdivinar: data['PalabraAdivinar'] as String?,
        palabraProhibida1: data['PalabraProhibida1'] as String?,
        palabraProhibida2: data['PalabraProhibida2'] as String?,
        palabraProhibida3: data['PalabraProhibida3'] as String?,
        palabraProhibida4: data['PalabraProhibida4'] as String?,
      );

  static QuestionStruct? maybeFromMap(dynamic data) =>
      data is Map ? QuestionStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'PalabraAdivinar': _palabraAdivinar,
        'PalabraProhibida1': _palabraProhibida1,
        'PalabraProhibida2': _palabraProhibida2,
        'PalabraProhibida3': _palabraProhibida3,
        'PalabraProhibida4': _palabraProhibida4,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'PalabraAdivinar': serializeParam(
          _palabraAdivinar,
          ParamType.String,
        ),
        'PalabraProhibida1': serializeParam(
          _palabraProhibida1,
          ParamType.String,
        ),
        'PalabraProhibida2': serializeParam(
          _palabraProhibida2,
          ParamType.String,
        ),
        'PalabraProhibida3': serializeParam(
          _palabraProhibida3,
          ParamType.String,
        ),
        'PalabraProhibida4': serializeParam(
          _palabraProhibida4,
          ParamType.String,
        ),
      }.withoutNulls;

  static QuestionStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuestionStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        palabraAdivinar: deserializeParam(
          data['PalabraAdivinar'],
          ParamType.String,
          false,
        ),
        palabraProhibida1: deserializeParam(
          data['PalabraProhibida1'],
          ParamType.String,
          false,
        ),
        palabraProhibida2: deserializeParam(
          data['PalabraProhibida2'],
          ParamType.String,
          false,
        ),
        palabraProhibida3: deserializeParam(
          data['PalabraProhibida3'],
          ParamType.String,
          false,
        ),
        palabraProhibida4: deserializeParam(
          data['PalabraProhibida4'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'QuestionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QuestionStruct &&
        id == other.id &&
        palabraAdivinar == other.palabraAdivinar &&
        palabraProhibida1 == other.palabraProhibida1 &&
        palabraProhibida2 == other.palabraProhibida2 &&
        palabraProhibida3 == other.palabraProhibida3 &&
        palabraProhibida4 == other.palabraProhibida4;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        palabraAdivinar,
        palabraProhibida1,
        palabraProhibida2,
        palabraProhibida3,
        palabraProhibida4
      ]);
}

QuestionStruct createQuestionStruct({
  int? id,
  String? palabraAdivinar,
  String? palabraProhibida1,
  String? palabraProhibida2,
  String? palabraProhibida3,
  String? palabraProhibida4,
}) =>
    QuestionStruct(
      id: id,
      palabraAdivinar: palabraAdivinar,
      palabraProhibida1: palabraProhibida1,
      palabraProhibida2: palabraProhibida2,
      palabraProhibida3: palabraProhibida3,
      palabraProhibida4: palabraProhibida4,
    );
