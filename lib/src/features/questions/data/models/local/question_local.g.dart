// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_local.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetQuestionLocalCollection on Isar {
  IsarCollection<QuestionLocal> get questionLocals => this.collection();
}

const QuestionLocalSchema = CollectionSchema(
  name: r'QuestionLocal',
  id: 240595281692372435,
  properties: {
    r'correctAnswer': PropertySchema(
      id: 0,
      name: r'correctAnswer',
      type: IsarType.string,
    ),
    r'idCategory': PropertySchema(
      id: 1,
      name: r'idCategory',
      type: IsarType.long,
    ),
    r'idQuestion': PropertySchema(
      id: 2,
      name: r'idQuestion',
      type: IsarType.string,
    ),
    r'incorrectAnswers': PropertySchema(
      id: 3,
      name: r'incorrectAnswers',
      type: IsarType.stringList,
    ),
    r'nameCategory': PropertySchema(
      id: 4,
      name: r'nameCategory',
      type: IsarType.string,
    ),
    r'question': PropertySchema(
      id: 5,
      name: r'question',
      type: IsarType.string,
    ),
    r'shuffleAnswer': PropertySchema(
      id: 6,
      name: r'shuffleAnswer',
      type: IsarType.stringList,
    )
  },
  estimateSize: _questionLocalEstimateSize,
  serialize: _questionLocalSerialize,
  deserialize: _questionLocalDeserialize,
  deserializeProp: _questionLocalDeserializeProp,
  idName: r'id',
  indexes: {
    r'idQuestion': IndexSchema(
      id: 6694995810877910614,
      name: r'idQuestion',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'idQuestion',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _questionLocalGetId,
  getLinks: _questionLocalGetLinks,
  attach: _questionLocalAttach,
  version: '3.1.0+1',
);

int _questionLocalEstimateSize(
  QuestionLocal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.correctAnswer.length * 3;
  bytesCount += 3 + object.idQuestion.length * 3;
  bytesCount += 3 + object.incorrectAnswers.length * 3;
  {
    for (var i = 0; i < object.incorrectAnswers.length; i++) {
      final value = object.incorrectAnswers[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.nameCategory.length * 3;
  bytesCount += 3 + object.question.length * 3;
  bytesCount += 3 + object.shuffleAnswer.length * 3;
  {
    for (var i = 0; i < object.shuffleAnswer.length; i++) {
      final value = object.shuffleAnswer[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _questionLocalSerialize(
  QuestionLocal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.correctAnswer);
  writer.writeLong(offsets[1], object.idCategory);
  writer.writeString(offsets[2], object.idQuestion);
  writer.writeStringList(offsets[3], object.incorrectAnswers);
  writer.writeString(offsets[4], object.nameCategory);
  writer.writeString(offsets[5], object.question);
  writer.writeStringList(offsets[6], object.shuffleAnswer);
}

QuestionLocal _questionLocalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = QuestionLocal(
    correctAnswer: reader.readString(offsets[0]),
    idCategory: reader.readLong(offsets[1]),
    idQuestion: reader.readString(offsets[2]),
    incorrectAnswers: reader.readStringList(offsets[3]) ?? [],
    nameCategory: reader.readString(offsets[4]),
    question: reader.readString(offsets[5]),
    shuffleAnswer: reader.readStringList(offsets[6]) ?? [],
  );
  object.id = id;
  return object;
}

P _questionLocalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringList(offset) ?? []) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readStringList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _questionLocalGetId(QuestionLocal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _questionLocalGetLinks(QuestionLocal object) {
  return [];
}

void _questionLocalAttach(
    IsarCollection<dynamic> col, Id id, QuestionLocal object) {
  object.id = id;
}

extension QuestionLocalByIndex on IsarCollection<QuestionLocal> {
  Future<QuestionLocal?> getByIdQuestion(String idQuestion) {
    return getByIndex(r'idQuestion', [idQuestion]);
  }

  QuestionLocal? getByIdQuestionSync(String idQuestion) {
    return getByIndexSync(r'idQuestion', [idQuestion]);
  }

  Future<bool> deleteByIdQuestion(String idQuestion) {
    return deleteByIndex(r'idQuestion', [idQuestion]);
  }

  bool deleteByIdQuestionSync(String idQuestion) {
    return deleteByIndexSync(r'idQuestion', [idQuestion]);
  }

  Future<List<QuestionLocal?>> getAllByIdQuestion(
      List<String> idQuestionValues) {
    final values = idQuestionValues.map((e) => [e]).toList();
    return getAllByIndex(r'idQuestion', values);
  }

  List<QuestionLocal?> getAllByIdQuestionSync(List<String> idQuestionValues) {
    final values = idQuestionValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'idQuestion', values);
  }

  Future<int> deleteAllByIdQuestion(List<String> idQuestionValues) {
    final values = idQuestionValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'idQuestion', values);
  }

  int deleteAllByIdQuestionSync(List<String> idQuestionValues) {
    final values = idQuestionValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'idQuestion', values);
  }

  Future<Id> putByIdQuestion(QuestionLocal object) {
    return putByIndex(r'idQuestion', object);
  }

  Id putByIdQuestionSync(QuestionLocal object, {bool saveLinks = true}) {
    return putByIndexSync(r'idQuestion', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByIdQuestion(List<QuestionLocal> objects) {
    return putAllByIndex(r'idQuestion', objects);
  }

  List<Id> putAllByIdQuestionSync(List<QuestionLocal> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'idQuestion', objects, saveLinks: saveLinks);
  }
}

extension QuestionLocalQueryWhereSort
    on QueryBuilder<QuestionLocal, QuestionLocal, QWhere> {
  QueryBuilder<QuestionLocal, QuestionLocal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension QuestionLocalQueryWhere
    on QueryBuilder<QuestionLocal, QuestionLocal, QWhereClause> {
  QueryBuilder<QuestionLocal, QuestionLocal, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterWhereClause>
      idQuestionEqualTo(String idQuestion) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idQuestion',
        value: [idQuestion],
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterWhereClause>
      idQuestionNotEqualTo(String idQuestion) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idQuestion',
              lower: [],
              upper: [idQuestion],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idQuestion',
              lower: [idQuestion],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idQuestion',
              lower: [idQuestion],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idQuestion',
              lower: [],
              upper: [idQuestion],
              includeUpper: false,
            ));
      }
    });
  }
}

extension QuestionLocalQueryFilter
    on QueryBuilder<QuestionLocal, QuestionLocal, QFilterCondition> {
  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      correctAnswerEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      correctAnswerGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      correctAnswerLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      correctAnswerBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'correctAnswer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      correctAnswerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      correctAnswerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      correctAnswerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      correctAnswerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'correctAnswer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      correctAnswerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correctAnswer',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      correctAnswerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'correctAnswer',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      idCategoryEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idCategory',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      idCategoryGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idCategory',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      idCategoryLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idCategory',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      idCategoryBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idCategory',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      idQuestionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idQuestion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      idQuestionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idQuestion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      idQuestionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idQuestion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      idQuestionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idQuestion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      idQuestionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idQuestion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      idQuestionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idQuestion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      idQuestionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idQuestion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      idQuestionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idQuestion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      idQuestionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idQuestion',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      idQuestionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idQuestion',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      incorrectAnswersElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'incorrectAnswers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      incorrectAnswersElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'incorrectAnswers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      incorrectAnswersElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'incorrectAnswers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      incorrectAnswersElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'incorrectAnswers',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      incorrectAnswersElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'incorrectAnswers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      incorrectAnswersElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'incorrectAnswers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      incorrectAnswersElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'incorrectAnswers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      incorrectAnswersElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'incorrectAnswers',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      incorrectAnswersElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'incorrectAnswers',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      incorrectAnswersElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'incorrectAnswers',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      incorrectAnswersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'incorrectAnswers',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      incorrectAnswersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'incorrectAnswers',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      incorrectAnswersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'incorrectAnswers',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      incorrectAnswersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'incorrectAnswers',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      incorrectAnswersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'incorrectAnswers',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      incorrectAnswersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'incorrectAnswers',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      nameCategoryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      nameCategoryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nameCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      nameCategoryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nameCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      nameCategoryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nameCategory',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      nameCategoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nameCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      nameCategoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nameCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      nameCategoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nameCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      nameCategoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nameCategory',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      nameCategoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      nameCategoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nameCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      questionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      questionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      questionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      questionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'question',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      questionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      questionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      questionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      questionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'question',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      questionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'question',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      questionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'question',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      shuffleAnswerElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shuffleAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      shuffleAnswerElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'shuffleAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      shuffleAnswerElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'shuffleAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      shuffleAnswerElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'shuffleAnswer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      shuffleAnswerElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'shuffleAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      shuffleAnswerElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'shuffleAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      shuffleAnswerElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'shuffleAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      shuffleAnswerElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'shuffleAnswer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      shuffleAnswerElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shuffleAnswer',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      shuffleAnswerElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'shuffleAnswer',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      shuffleAnswerLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'shuffleAnswer',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      shuffleAnswerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'shuffleAnswer',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      shuffleAnswerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'shuffleAnswer',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      shuffleAnswerLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'shuffleAnswer',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      shuffleAnswerLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'shuffleAnswer',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterFilterCondition>
      shuffleAnswerLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'shuffleAnswer',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension QuestionLocalQueryObject
    on QueryBuilder<QuestionLocal, QuestionLocal, QFilterCondition> {}

extension QuestionLocalQueryLinks
    on QueryBuilder<QuestionLocal, QuestionLocal, QFilterCondition> {}

extension QuestionLocalQuerySortBy
    on QueryBuilder<QuestionLocal, QuestionLocal, QSortBy> {
  QueryBuilder<QuestionLocal, QuestionLocal, QAfterSortBy>
      sortByCorrectAnswer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswer', Sort.asc);
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterSortBy>
      sortByCorrectAnswerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswer', Sort.desc);
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterSortBy> sortByIdCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCategory', Sort.asc);
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterSortBy>
      sortByIdCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCategory', Sort.desc);
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterSortBy> sortByIdQuestion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idQuestion', Sort.asc);
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterSortBy>
      sortByIdQuestionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idQuestion', Sort.desc);
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterSortBy>
      sortByNameCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameCategory', Sort.asc);
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterSortBy>
      sortByNameCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameCategory', Sort.desc);
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterSortBy> sortByQuestion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'question', Sort.asc);
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterSortBy>
      sortByQuestionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'question', Sort.desc);
    });
  }
}

extension QuestionLocalQuerySortThenBy
    on QueryBuilder<QuestionLocal, QuestionLocal, QSortThenBy> {
  QueryBuilder<QuestionLocal, QuestionLocal, QAfterSortBy>
      thenByCorrectAnswer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswer', Sort.asc);
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterSortBy>
      thenByCorrectAnswerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswer', Sort.desc);
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterSortBy> thenByIdCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCategory', Sort.asc);
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterSortBy>
      thenByIdCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCategory', Sort.desc);
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterSortBy> thenByIdQuestion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idQuestion', Sort.asc);
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterSortBy>
      thenByIdQuestionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idQuestion', Sort.desc);
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterSortBy>
      thenByNameCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameCategory', Sort.asc);
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterSortBy>
      thenByNameCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameCategory', Sort.desc);
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterSortBy> thenByQuestion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'question', Sort.asc);
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QAfterSortBy>
      thenByQuestionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'question', Sort.desc);
    });
  }
}

extension QuestionLocalQueryWhereDistinct
    on QueryBuilder<QuestionLocal, QuestionLocal, QDistinct> {
  QueryBuilder<QuestionLocal, QuestionLocal, QDistinct> distinctByCorrectAnswer(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'correctAnswer',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QDistinct> distinctByIdCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idCategory');
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QDistinct> distinctByIdQuestion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idQuestion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QDistinct>
      distinctByIncorrectAnswers() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'incorrectAnswers');
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QDistinct> distinctByNameCategory(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nameCategory', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QDistinct> distinctByQuestion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'question', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuestionLocal, QuestionLocal, QDistinct>
      distinctByShuffleAnswer() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shuffleAnswer');
    });
  }
}

extension QuestionLocalQueryProperty
    on QueryBuilder<QuestionLocal, QuestionLocal, QQueryProperty> {
  QueryBuilder<QuestionLocal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<QuestionLocal, String, QQueryOperations>
      correctAnswerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'correctAnswer');
    });
  }

  QueryBuilder<QuestionLocal, int, QQueryOperations> idCategoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idCategory');
    });
  }

  QueryBuilder<QuestionLocal, String, QQueryOperations> idQuestionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idQuestion');
    });
  }

  QueryBuilder<QuestionLocal, List<String>, QQueryOperations>
      incorrectAnswersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'incorrectAnswers');
    });
  }

  QueryBuilder<QuestionLocal, String, QQueryOperations> nameCategoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nameCategory');
    });
  }

  QueryBuilder<QuestionLocal, String, QQueryOperations> questionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'question');
    });
  }

  QueryBuilder<QuestionLocal, List<String>, QQueryOperations>
      shuffleAnswerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shuffleAnswer');
    });
  }
}
