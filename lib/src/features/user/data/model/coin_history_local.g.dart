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
    r'idTransaction': PropertySchema(
      id: 1,
      name: r'idTransaction',
      type: IsarType.string,
    ),
    r'message': PropertySchema(
      id: 2,
      name: r'message',
      type: IsarType.string,
    ),
    r'timestamp': PropertySchema(
      id: 3,
      name: r'timestamp',
      type: IsarType.dateTime,
    ),
    r'type': PropertySchema(
      id: 4,
      name: r'type',
      type: IsarType.string,
    )
  },
  estimateSize: _coinHistoryLocalEstimateSize,
  serialize: _coinHistoryLocalSerialize,
  deserialize: _coinHistoryLocalDeserialize,
  deserializeProp: _coinHistoryLocalDeserializeProp,
  idName: r'id',
  indexes: {
    r'idTransaction': IndexSchema(
      id: 8537940135064520224,
      name: r'idTransaction',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'idTransaction',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
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
  bytesCount += 3 + object.idTransaction.length * 3;
  {
    final value = object.message;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
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
  writer.writeString(offsets[1], object.idTransaction);
  writer.writeString(offsets[2], object.message);
  writer.writeDateTime(offsets[3], object.timestamp);
  writer.writeString(offsets[4], object.type);
}

CoinHistoryLocal _coinHistoryLocalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CoinHistoryLocal(
    amountEarnCoin: reader.readDouble(offsets[0]),
    idTransaction: reader.readString(offsets[1]),
    message: reader.readStringOrNull(offsets[2]),
    timestamp: reader.readDateTime(offsets[3]),
    type: reader.readString(offsets[4]),
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
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
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

extension CoinHistoryLocalByIndex on IsarCollection<CoinHistoryLocal> {
  Future<CoinHistoryLocal?> getByIdTransaction(String idTransaction) {
    return getByIndex(r'idTransaction', [idTransaction]);
  }

  CoinHistoryLocal? getByIdTransactionSync(String idTransaction) {
    return getByIndexSync(r'idTransaction', [idTransaction]);
  }

  Future<bool> deleteByIdTransaction(String idTransaction) {
    return deleteByIndex(r'idTransaction', [idTransaction]);
  }

  bool deleteByIdTransactionSync(String idTransaction) {
    return deleteByIndexSync(r'idTransaction', [idTransaction]);
  }

  Future<List<CoinHistoryLocal?>> getAllByIdTransaction(
      List<String> idTransactionValues) {
    final values = idTransactionValues.map((e) => [e]).toList();
    return getAllByIndex(r'idTransaction', values);
  }

  List<CoinHistoryLocal?> getAllByIdTransactionSync(
      List<String> idTransactionValues) {
    final values = idTransactionValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'idTransaction', values);
  }

  Future<int> deleteAllByIdTransaction(List<String> idTransactionValues) {
    final values = idTransactionValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'idTransaction', values);
  }

  int deleteAllByIdTransactionSync(List<String> idTransactionValues) {
    final values = idTransactionValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'idTransaction', values);
  }

  Future<Id> putByIdTransaction(CoinHistoryLocal object) {
    return putByIndex(r'idTransaction', object);
  }

  Id putByIdTransactionSync(CoinHistoryLocal object, {bool saveLinks = true}) {
    return putByIndexSync(r'idTransaction', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByIdTransaction(List<CoinHistoryLocal> objects) {
    return putAllByIndex(r'idTransaction', objects);
  }

  List<Id> putAllByIdTransactionSync(List<CoinHistoryLocal> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'idTransaction', objects, saveLinks: saveLinks);
  }
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

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterWhereClause>
      idTransactionEqualTo(String idTransaction) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idTransaction',
        value: [idTransaction],
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterWhereClause>
      idTransactionNotEqualTo(String idTransaction) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idTransaction',
              lower: [],
              upper: [idTransaction],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idTransaction',
              lower: [idTransaction],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idTransaction',
              lower: [idTransaction],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idTransaction',
              lower: [],
              upper: [idTransaction],
              includeUpper: false,
            ));
      }
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
      idTransactionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idTransaction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      idTransactionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idTransaction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      idTransactionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idTransaction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      idTransactionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idTransaction',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      idTransactionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idTransaction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      idTransactionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idTransaction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      idTransactionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idTransaction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      idTransactionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idTransaction',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      idTransactionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idTransaction',
        value: '',
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      idTransactionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idTransaction',
        value: '',
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      messageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'message',
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      messageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'message',
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      messageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      messageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      messageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      messageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'message',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      messageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      messageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      messageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      messageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'message',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      messageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'message',
        value: '',
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      messageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'message',
        value: '',
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      timestampEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      timestampGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      timestampLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterFilterCondition>
      timestampBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
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
      sortByIdTransaction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idTransaction', Sort.asc);
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterSortBy>
      sortByIdTransactionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idTransaction', Sort.desc);
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterSortBy>
      sortByMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.asc);
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterSortBy>
      sortByMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.desc);
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
      thenByIdTransaction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idTransaction', Sort.asc);
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterSortBy>
      thenByIdTransactionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idTransaction', Sort.desc);
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterSortBy>
      thenByMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.asc);
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QAfterSortBy>
      thenByMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.desc);
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
      distinctByIdTransaction({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idTransaction',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QDistinct> distinctByMessage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'message', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CoinHistoryLocal, CoinHistoryLocal, QDistinct>
      distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
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

  QueryBuilder<CoinHistoryLocal, String, QQueryOperations>
      idTransactionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idTransaction');
    });
  }

  QueryBuilder<CoinHistoryLocal, String?, QQueryOperations> messageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'message');
    });
  }

  QueryBuilder<CoinHistoryLocal, DateTime, QQueryOperations>
      timestampProperty() {
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
