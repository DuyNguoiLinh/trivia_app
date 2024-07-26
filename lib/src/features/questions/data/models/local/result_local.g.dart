// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_local.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetResultLocalCollection on Isar {
  IsarCollection<ResultLocal> get resultLocals => this.collection();
}

const ResultLocalSchema = CollectionSchema(
  name: r'ResultLocal',
  id: -2383970383311193447,
  properties: {
    r'coin': PropertySchema(
      id: 0,
      name: r'coin',
      type: IsarType.double,
    ),
    r'completion': PropertySchema(
      id: 1,
      name: r'completion',
      type: IsarType.double,
    ),
    r'correct': PropertySchema(
      id: 2,
      name: r'correct',
      type: IsarType.long,
    ),
    r'idResult': PropertySchema(
      id: 3,
      name: r'idResult',
      type: IsarType.string,
    ),
    r'total': PropertySchema(
      id: 4,
      name: r'total',
      type: IsarType.long,
    ),
    r'wrong': PropertySchema(
      id: 5,
      name: r'wrong',
      type: IsarType.long,
    )
  },
  estimateSize: _resultLocalEstimateSize,
  serialize: _resultLocalSerialize,
  deserialize: _resultLocalDeserialize,
  deserializeProp: _resultLocalDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _resultLocalGetId,
  getLinks: _resultLocalGetLinks,
  attach: _resultLocalAttach,
  version: '3.1.0+1',
);

int _resultLocalEstimateSize(
  ResultLocal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.idResult.length * 3;
  return bytesCount;
}

void _resultLocalSerialize(
  ResultLocal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.coin);
  writer.writeDouble(offsets[1], object.completion);
  writer.writeLong(offsets[2], object.correct);
  writer.writeString(offsets[3], object.idResult);
  writer.writeLong(offsets[4], object.total);
  writer.writeLong(offsets[5], object.wrong);
}

ResultLocal _resultLocalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ResultLocal(
    coin: reader.readDouble(offsets[0]),
    completion: reader.readDouble(offsets[1]),
    correct: reader.readLong(offsets[2]),
    idResult: reader.readString(offsets[3]),
    total: reader.readLong(offsets[4]),
    wrong: reader.readLong(offsets[5]),
  );
  object.id = id;
  return object;
}

P _resultLocalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _resultLocalGetId(ResultLocal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _resultLocalGetLinks(ResultLocal object) {
  return [];
}

void _resultLocalAttach(
    IsarCollection<dynamic> col, Id id, ResultLocal object) {
  object.id = id;
}

extension ResultLocalQueryWhereSort
    on QueryBuilder<ResultLocal, ResultLocal, QWhere> {
  QueryBuilder<ResultLocal, ResultLocal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ResultLocalQueryWhere
    on QueryBuilder<ResultLocal, ResultLocal, QWhereClause> {
  QueryBuilder<ResultLocal, ResultLocal, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<ResultLocal, ResultLocal, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterWhereClause> idBetween(
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
}

extension ResultLocalQueryFilter
    on QueryBuilder<ResultLocal, ResultLocal, QFilterCondition> {
  QueryBuilder<ResultLocal, ResultLocal, QAfterFilterCondition> coinEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterFilterCondition> coinGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterFilterCondition> coinLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterFilterCondition> coinBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterFilterCondition>
      completionEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completion',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterFilterCondition>
      completionGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completion',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterFilterCondition>
      completionLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completion',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterFilterCondition>
      completionBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterFilterCondition> correctEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correct',
        value: value,
      ));
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterFilterCondition>
      correctGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'correct',
        value: value,
      ));
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterFilterCondition> correctLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'correct',
        value: value,
      ));
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterFilterCondition> correctBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'correct',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ResultLocal, ResultLocal, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ResultLocal, ResultLocal, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ResultLocal, ResultLocal, QAfterFilterCondition> idResultEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idResult',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterFilterCondition>
      idResultGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idResult',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterFilterCondition>
      idResultLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idResult',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterFilterCondition> idResultBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idResult',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterFilterCondition>
      idResultStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idResult',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterFilterCondition>
      idResultEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idResult',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterFilterCondition>
      idResultContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idResult',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterFilterCondition> idResultMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idResult',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterFilterCondition>
      idResultIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idResult',
        value: '',
      ));
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterFilterCondition>
      idResultIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idResult',
        value: '',
      ));
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterFilterCondition> totalEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'total',
        value: value,
      ));
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterFilterCondition>
      totalGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'total',
        value: value,
      ));
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterFilterCondition> totalLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'total',
        value: value,
      ));
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterFilterCondition> totalBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'total',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterFilterCondition> wrongEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wrong',
        value: value,
      ));
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterFilterCondition>
      wrongGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wrong',
        value: value,
      ));
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterFilterCondition> wrongLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wrong',
        value: value,
      ));
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterFilterCondition> wrongBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wrong',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ResultLocalQueryObject
    on QueryBuilder<ResultLocal, ResultLocal, QFilterCondition> {}

extension ResultLocalQueryLinks
    on QueryBuilder<ResultLocal, ResultLocal, QFilterCondition> {}

extension ResultLocalQuerySortBy
    on QueryBuilder<ResultLocal, ResultLocal, QSortBy> {
  QueryBuilder<ResultLocal, ResultLocal, QAfterSortBy> sortByCoin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coin', Sort.asc);
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterSortBy> sortByCoinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coin', Sort.desc);
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterSortBy> sortByCompletion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completion', Sort.asc);
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterSortBy> sortByCompletionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completion', Sort.desc);
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterSortBy> sortByCorrect() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correct', Sort.asc);
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterSortBy> sortByCorrectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correct', Sort.desc);
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterSortBy> sortByIdResult() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idResult', Sort.asc);
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterSortBy> sortByIdResultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idResult', Sort.desc);
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterSortBy> sortByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterSortBy> sortByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterSortBy> sortByWrong() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wrong', Sort.asc);
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterSortBy> sortByWrongDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wrong', Sort.desc);
    });
  }
}

extension ResultLocalQuerySortThenBy
    on QueryBuilder<ResultLocal, ResultLocal, QSortThenBy> {
  QueryBuilder<ResultLocal, ResultLocal, QAfterSortBy> thenByCoin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coin', Sort.asc);
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterSortBy> thenByCoinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coin', Sort.desc);
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterSortBy> thenByCompletion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completion', Sort.asc);
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterSortBy> thenByCompletionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completion', Sort.desc);
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterSortBy> thenByCorrect() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correct', Sort.asc);
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterSortBy> thenByCorrectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correct', Sort.desc);
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterSortBy> thenByIdResult() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idResult', Sort.asc);
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterSortBy> thenByIdResultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idResult', Sort.desc);
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterSortBy> thenByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterSortBy> thenByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterSortBy> thenByWrong() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wrong', Sort.asc);
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QAfterSortBy> thenByWrongDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wrong', Sort.desc);
    });
  }
}

extension ResultLocalQueryWhereDistinct
    on QueryBuilder<ResultLocal, ResultLocal, QDistinct> {
  QueryBuilder<ResultLocal, ResultLocal, QDistinct> distinctByCoin() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coin');
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QDistinct> distinctByCompletion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completion');
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QDistinct> distinctByCorrect() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'correct');
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QDistinct> distinctByIdResult(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idResult', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QDistinct> distinctByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'total');
    });
  }

  QueryBuilder<ResultLocal, ResultLocal, QDistinct> distinctByWrong() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wrong');
    });
  }
}

extension ResultLocalQueryProperty
    on QueryBuilder<ResultLocal, ResultLocal, QQueryProperty> {
  QueryBuilder<ResultLocal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ResultLocal, double, QQueryOperations> coinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coin');
    });
  }

  QueryBuilder<ResultLocal, double, QQueryOperations> completionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completion');
    });
  }

  QueryBuilder<ResultLocal, int, QQueryOperations> correctProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'correct');
    });
  }

  QueryBuilder<ResultLocal, String, QQueryOperations> idResultProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idResult');
    });
  }

  QueryBuilder<ResultLocal, int, QQueryOperations> totalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'total');
    });
  }

  QueryBuilder<ResultLocal, int, QQueryOperations> wrongProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wrong');
    });
  }
}
