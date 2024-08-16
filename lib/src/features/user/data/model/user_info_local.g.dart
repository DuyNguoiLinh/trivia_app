// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_local.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserInfoLocalCollection on Isar {
  IsarCollection<UserInfoLocal> get userInfoLocals => this.collection();
}

const UserInfoLocalSchema = CollectionSchema(
  name: r'UserInfoLocal',
  id: 4546886641457929965,
  properties: {
    r'coin': PropertySchema(
      id: 0,
      name: r'coin',
      type: IsarType.double,
    ),
    r'uid': PropertySchema(
      id: 1,
      name: r'uid',
      type: IsarType.string,
    ),
    r'userName': PropertySchema(
      id: 2,
      name: r'userName',
      type: IsarType.string,
    )
  },
  estimateSize: _userInfoLocalEstimateSize,
  serialize: _userInfoLocalSerialize,
  deserialize: _userInfoLocalDeserialize,
  deserializeProp: _userInfoLocalDeserializeProp,
  idName: r'id',
  indexes: {
    r'userName': IndexSchema(
      id: -1677712070637581736,
      name: r'userName',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userName',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'uid': IndexSchema(
      id: 8193695471701937315,
      name: r'uid',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'uid',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'coinHistories': LinkSchema(
      id: 7088160925093364011,
      name: r'coinHistories',
      target: r'CoinHistoryLocal',
      single: false,
    ),
    r'questions': LinkSchema(
      id: 8576210939815796632,
      name: r'questions',
      target: r'QuestionLocal',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _userInfoLocalGetId,
  getLinks: _userInfoLocalGetLinks,
  attach: _userInfoLocalAttach,
  version: '3.1.0+1',
);

int _userInfoLocalEstimateSize(
  UserInfoLocal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.uid.length * 3;
  bytesCount += 3 + object.userName.length * 3;
  return bytesCount;
}

void _userInfoLocalSerialize(
  UserInfoLocal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.coin);
  writer.writeString(offsets[1], object.uid);
  writer.writeString(offsets[2], object.userName);
}

UserInfoLocal _userInfoLocalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserInfoLocal(
    coin: reader.readDoubleOrNull(offsets[0]) ?? 0.0,
    uid: reader.readString(offsets[1]),
    userName: reader.readString(offsets[2]),
  );
  object.id = id;
  return object;
}

P _userInfoLocalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset) ?? 0.0) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userInfoLocalGetId(UserInfoLocal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userInfoLocalGetLinks(UserInfoLocal object) {
  return [object.coinHistories, object.questions];
}

void _userInfoLocalAttach(
    IsarCollection<dynamic> col, Id id, UserInfoLocal object) {
  object.id = id;
  object.coinHistories.attach(
      col, col.isar.collection<CoinHistoryLocal>(), r'coinHistories', id);
  object.questions
      .attach(col, col.isar.collection<QuestionLocal>(), r'questions', id);
}

extension UserInfoLocalByIndex on IsarCollection<UserInfoLocal> {
  Future<UserInfoLocal?> getByUserName(String userName) {
    return getByIndex(r'userName', [userName]);
  }

  UserInfoLocal? getByUserNameSync(String userName) {
    return getByIndexSync(r'userName', [userName]);
  }

  Future<bool> deleteByUserName(String userName) {
    return deleteByIndex(r'userName', [userName]);
  }

  bool deleteByUserNameSync(String userName) {
    return deleteByIndexSync(r'userName', [userName]);
  }

  Future<List<UserInfoLocal?>> getAllByUserName(List<String> userNameValues) {
    final values = userNameValues.map((e) => [e]).toList();
    return getAllByIndex(r'userName', values);
  }

  List<UserInfoLocal?> getAllByUserNameSync(List<String> userNameValues) {
    final values = userNameValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'userName', values);
  }

  Future<int> deleteAllByUserName(List<String> userNameValues) {
    final values = userNameValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'userName', values);
  }

  int deleteAllByUserNameSync(List<String> userNameValues) {
    final values = userNameValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'userName', values);
  }

  Future<Id> putByUserName(UserInfoLocal object) {
    return putByIndex(r'userName', object);
  }

  Id putByUserNameSync(UserInfoLocal object, {bool saveLinks = true}) {
    return putByIndexSync(r'userName', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUserName(List<UserInfoLocal> objects) {
    return putAllByIndex(r'userName', objects);
  }

  List<Id> putAllByUserNameSync(List<UserInfoLocal> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'userName', objects, saveLinks: saveLinks);
  }

  Future<UserInfoLocal?> getByUid(String uid) {
    return getByIndex(r'uid', [uid]);
  }

  UserInfoLocal? getByUidSync(String uid) {
    return getByIndexSync(r'uid', [uid]);
  }

  Future<bool> deleteByUid(String uid) {
    return deleteByIndex(r'uid', [uid]);
  }

  bool deleteByUidSync(String uid) {
    return deleteByIndexSync(r'uid', [uid]);
  }

  Future<List<UserInfoLocal?>> getAllByUid(List<String> uidValues) {
    final values = uidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uid', values);
  }

  List<UserInfoLocal?> getAllByUidSync(List<String> uidValues) {
    final values = uidValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'uid', values);
  }

  Future<int> deleteAllByUid(List<String> uidValues) {
    final values = uidValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'uid', values);
  }

  int deleteAllByUidSync(List<String> uidValues) {
    final values = uidValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'uid', values);
  }

  Future<Id> putByUid(UserInfoLocal object) {
    return putByIndex(r'uid', object);
  }

  Id putByUidSync(UserInfoLocal object, {bool saveLinks = true}) {
    return putByIndexSync(r'uid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUid(List<UserInfoLocal> objects) {
    return putAllByIndex(r'uid', objects);
  }

  List<Id> putAllByUidSync(List<UserInfoLocal> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'uid', objects, saveLinks: saveLinks);
  }
}

extension UserInfoLocalQueryWhereSort
    on QueryBuilder<UserInfoLocal, UserInfoLocal, QWhere> {
  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserInfoLocalQueryWhere
    on QueryBuilder<UserInfoLocal, UserInfoLocal, QWhereClause> {
  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterWhereClause> idBetween(
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

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterWhereClause> userNameEqualTo(
      String userName) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userName',
        value: [userName],
      ));
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterWhereClause>
      userNameNotEqualTo(String userName) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userName',
              lower: [],
              upper: [userName],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userName',
              lower: [userName],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userName',
              lower: [userName],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userName',
              lower: [],
              upper: [userName],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterWhereClause> uidEqualTo(
      String uid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uid',
        value: [uid],
      ));
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterWhereClause> uidNotEqualTo(
      String uid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uid',
              lower: [],
              upper: [uid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uid',
              lower: [uid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uid',
              lower: [uid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uid',
              lower: [],
              upper: [uid],
              includeUpper: false,
            ));
      }
    });
  }
}

extension UserInfoLocalQueryFilter
    on QueryBuilder<UserInfoLocal, UserInfoLocal, QFilterCondition> {
  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition> coinEqualTo(
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

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition>
      coinGreaterThan(
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

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition>
      coinLessThan(
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

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition> coinBetween(
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

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition>
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

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition> idBetween(
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

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition> uidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition>
      uidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition> uidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition> uidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition>
      uidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition> uidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition> uidContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition> uidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition>
      uidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uid',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition>
      uidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uid',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition>
      userNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition>
      userNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition>
      userNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition>
      userNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition>
      userNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition>
      userNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition>
      userNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition>
      userNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition>
      userNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userName',
        value: '',
      ));
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition>
      userNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userName',
        value: '',
      ));
    });
  }
}

extension UserInfoLocalQueryObject
    on QueryBuilder<UserInfoLocal, UserInfoLocal, QFilterCondition> {}

extension UserInfoLocalQueryLinks
    on QueryBuilder<UserInfoLocal, UserInfoLocal, QFilterCondition> {
  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition>
      coinHistories(FilterQuery<CoinHistoryLocal> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'coinHistories');
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition>
      coinHistoriesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'coinHistories', length, true, length, true);
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition>
      coinHistoriesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'coinHistories', 0, true, 0, true);
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition>
      coinHistoriesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'coinHistories', 0, false, 999999, true);
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition>
      coinHistoriesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'coinHistories', 0, true, length, include);
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition>
      coinHistoriesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'coinHistories', length, include, 999999, true);
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition>
      coinHistoriesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'coinHistories', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition> questions(
      FilterQuery<QuestionLocal> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'questions');
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition>
      questionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'questions', length, true, length, true);
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition>
      questionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'questions', 0, true, 0, true);
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition>
      questionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'questions', 0, false, 999999, true);
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition>
      questionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'questions', 0, true, length, include);
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition>
      questionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'questions', length, include, 999999, true);
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterFilterCondition>
      questionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'questions', lower, includeLower, upper, includeUpper);
    });
  }
}

extension UserInfoLocalQuerySortBy
    on QueryBuilder<UserInfoLocal, UserInfoLocal, QSortBy> {
  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterSortBy> sortByCoin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coin', Sort.asc);
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterSortBy> sortByCoinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coin', Sort.desc);
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterSortBy> sortByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.asc);
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterSortBy> sortByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.desc);
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterSortBy> sortByUserName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userName', Sort.asc);
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterSortBy>
      sortByUserNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userName', Sort.desc);
    });
  }
}

extension UserInfoLocalQuerySortThenBy
    on QueryBuilder<UserInfoLocal, UserInfoLocal, QSortThenBy> {
  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterSortBy> thenByCoin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coin', Sort.asc);
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterSortBy> thenByCoinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coin', Sort.desc);
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterSortBy> thenByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.asc);
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterSortBy> thenByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.desc);
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterSortBy> thenByUserName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userName', Sort.asc);
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QAfterSortBy>
      thenByUserNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userName', Sort.desc);
    });
  }
}

extension UserInfoLocalQueryWhereDistinct
    on QueryBuilder<UserInfoLocal, UserInfoLocal, QDistinct> {
  QueryBuilder<UserInfoLocal, UserInfoLocal, QDistinct> distinctByCoin() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coin');
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QDistinct> distinctByUid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserInfoLocal, UserInfoLocal, QDistinct> distinctByUserName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userName', caseSensitive: caseSensitive);
    });
  }
}

extension UserInfoLocalQueryProperty
    on QueryBuilder<UserInfoLocal, UserInfoLocal, QQueryProperty> {
  QueryBuilder<UserInfoLocal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserInfoLocal, double, QQueryOperations> coinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coin');
    });
  }

  QueryBuilder<UserInfoLocal, String, QQueryOperations> uidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uid');
    });
  }

  QueryBuilder<UserInfoLocal, String, QQueryOperations> userNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userName');
    });
  }
}
