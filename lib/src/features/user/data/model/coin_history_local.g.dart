// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_history_local.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCoinHistoryLocalCollection on Isar {
  IsarCollection<CoinHistoryLocal> get coinHistoryLocals => this.collection();
}

const CoinHistoryLocalSchema = CollectionSchema(
  name: r'CoinHistoryLocal',
  id: 2608682959990734727,
  properties: {
    r'amountEarnCoin': PropertySchema(
      id: 0,
      name: r'amountEarnCoin',
      type: IsarType.double,
    ),
    r'oldAmount': PropertySchema(
      id: 1,
      name: r'oldAmount',
      type: IsarType.double,
    ),
    r'timestamp': PropertySchema(
      id: 2,
      name: r'timestamp',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 3,
      name: r'type',
      type: IsarType.string,
    )
  },
  estimateSize: _coinHistoryLocalEstimateSize,
  serialize: _coinHistoryLocalSerialize,
  deserialize: _coinHistoryLocalDeserialize,
  deserializeProp: _coinHistoryLocalDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _coinHistoryLocalGetId,
  getLinks: _coinHistoryLocalGetLinks,
  attach: _coinHistoryLocalAttach,
  version: '3.1.0+1',
);

int _coinHistoryLocalEstimateSize(
  CoinHistoryLocal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.timestamp.length * 3;
  bytesCount += 3 + object.type.length * 3;
  return bytesCount;
}

void _coinHistoryLocalSerialize(
  CoinHistoryLocal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.amountEarnCoin);
  writer.writeDouble(offsets[1], object.oldAmount);
  writer.writeString(offsets[2], object.timestamp);
  writer.writeString(offsets[3], object.type);
}

CoinHistoryLocal _coinHistoryLocalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CoinHistoryLocal(
    amountEarnCoin: reader.readDouble(offsets[0]),
    oldAmount: reader.readDouble(offsets[1]),
    timestamp: reader.readString(offsets[2]),
    type: reader.readString(offsets[3]),
  );
  object.id = id;
  return object;
}

P _coinHistoryLocalDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _coinHistoryLocalGetId(CoinHistoryLocal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _coinHistoryLocalGetLinks(CoinHistoryLocal object) {
  return [];
}

void _coinHistoryLocalAttach(
    IsarCollection<dynamic> col, Id id, CoinHistoryLocal object) {
  object.id = id;
}

extension CoinHistoryLocalQueryWhereSort
    on QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QWhere> {
  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CoinHistoryLocalQueryWhere
    on QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QWhereClause> {
  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterWhereClause> idBetween(
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

extension CoinHistoryLocalQueryFilter
    on QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QFilterCondition> {
  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      amountEarnCoinEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amountEarnCoin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      amountEarnCoinGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'amountEarnCoin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      amountEarnCoinLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'amountEarnCoin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      amountEarnCoinBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'amountEarnCoin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
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

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      oldAmountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'oldAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      oldAmountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'oldAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      oldAmountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'oldAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      oldAmountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'oldAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      timestampEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      timestampGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timestamp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      timestampLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timestamp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      timestampBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      timestampStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'timestamp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      timestampEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'timestamp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      timestampContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'timestamp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      timestampMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'timestamp',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      timestampIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: '',
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      timestampIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'timestamp',
        value: '',
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      typeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      typeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      typeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      typeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }
}

extension CoinHistoryLocalQueryObject
    on QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QFilterCondition> {}

extension CoinHistoryLocalQueryLinks
    on QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QFilterCondition> {}

extension CoinHistoryLocalQuerySortBy
    on QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QSortBy> {
  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterSortBy>
      sortByAmountEarnCoin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amountEarnCoin', Sort.asc);
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterSortBy>
      sortByAmountEarnCoinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amountEarnCoin', Sort.desc);
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterSortBy>
      sortByOldAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oldAmount', Sort.asc);
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterSortBy>
      sortByOldAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oldAmount', Sort.desc);
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterSortBy>
      sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterSortBy>
      sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension CoinHistoryLocalQuerySortThenBy
    on QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QSortThenBy> {
  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterSortBy>
      thenByAmountEarnCoin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amountEarnCoin', Sort.asc);
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterSortBy>
      thenByAmountEarnCoinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amountEarnCoin', Sort.desc);
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterSortBy>
      thenByOldAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oldAmount', Sort.asc);
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterSortBy>
      thenByOldAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oldAmount', Sort.desc);
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterSortBy>
      thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterSortBy>
      thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension CoinHistoryLocalQueryWhereDistinct
    on QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QDistinct> {
  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QDistinct>
      distinctByAmountEarnCoin() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amountEarnCoin');
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QDistinct>
      distinctByOldAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'oldAmount');
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QDistinct>
      distinctByTimestamp({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }
}

extension CoinHistoryLocalQueryProperty
    on QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QQueryProperty> {
  QueryBuilder<CoinHistoryLocal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CoinHistoryLocal, double, QQueryOperations>
      amountEarnCoinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amountEarnCoin');
    });
  }

  QueryBuilder<CoinHistoryLocal, double, QQueryOperations> oldAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'oldAmount');
    });
  }

  QueryBuilder<CoinHistoryLocal, String, QQueryOperations> timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }

  QueryBuilder<CoinHistoryLocal, String, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}
