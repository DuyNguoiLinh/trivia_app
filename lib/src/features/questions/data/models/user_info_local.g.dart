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
    r'userName': PropertySchema(
      id: 0,
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
    )
  },
  links: {},
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
  bytesCount += 3 + object.userName.length * 3;
  return bytesCount;
}

void _userInfoLocalSerialize(
  UserInfoLocal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.userName);
}

UserInfoLocal _userInfoLocalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserInfoLocal(
    userName: reader.readString(offsets[0]),
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
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userInfoLocalGetId(UserInfoLocal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userInfoLocalGetLinks(UserInfoLocal object) {
  return [];
}

void _userInfoLocalAttach(
    IsarCollection<dynamic> col, Id id, UserInfoLocal object) {
  object.id = id;
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
}

extension UserInfoLocalQueryFilter
    on QueryBuilder<UserInfoLocal, UserInfoLocal, QFilterCondition> {
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
    on QueryBuilder<UserInfoLocal, UserInfoLocal, QFilterCondition> {}

extension UserInfoLocalQuerySortBy
    on QueryBuilder<UserInfoLocal, UserInfoLocal, QSortBy> {
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

  QueryBuilder<UserInfoLocal, String, QQueryOperations> userNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userName');
    });
  }
}
