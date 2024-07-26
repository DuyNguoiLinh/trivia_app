// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_local.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCategoryLocalCollection on Isar {
  IsarCollection<CategoryLocal> get categoryLocals => this.collection();
}

const CategoryLocalSchema = CollectionSchema(
  name: r'CategoryLocal',
  id: -1311674181132516467,
  properties: {
    r'filterCategory': PropertySchema(
      id: 0,
      name: r'filterCategory',
      type: IsarType.string,
    ),
    r'idCategory': PropertySchema(
      id: 1,
      name: r'idCategory',
      type: IsarType.long,
    ),
    r'nameCategory': PropertySchema(
      id: 2,
      name: r'nameCategory',
      type: IsarType.string,
    )
  },
  estimateSize: _categoryLocalEstimateSize,
  serialize: _categoryLocalSerialize,
  deserialize: _categoryLocalDeserialize,
  deserializeProp: _categoryLocalDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _categoryLocalGetId,
  getLinks: _categoryLocalGetLinks,
  attach: _categoryLocalAttach,
  version: '3.1.0+1',
);

int _categoryLocalEstimateSize(
  CategoryLocal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.filterCategory.length * 3;
  bytesCount += 3 + object.nameCategory.length * 3;
  return bytesCount;
}

void _categoryLocalSerialize(
  CategoryLocal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.filterCategory);
  writer.writeLong(offsets[1], object.idCategory);
  writer.writeString(offsets[2], object.nameCategory);
}

CategoryLocal _categoryLocalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CategoryLocal(
    filterCategory: reader.readString(offsets[0]),
    idCategory: reader.readLong(offsets[1]),
    nameCategory: reader.readString(offsets[2]),
  );
  object.id = id;
  return object;
}

P _categoryLocalDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _categoryLocalGetId(CategoryLocal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _categoryLocalGetLinks(CategoryLocal object) {
  return [];
}

void _categoryLocalAttach(
    IsarCollection<dynamic> col, Id id, CategoryLocal object) {
  object.id = id;
}

extension CategoryLocalQueryWhereSort
    on QueryBuilder<CategoryLocal, CategoryLocal, QWhere> {
  QueryBuilder<CategoryLocal, CategoryLocal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CategoryLocalQueryWhere
    on QueryBuilder<CategoryLocal, CategoryLocal, QWhereClause> {
  QueryBuilder<CategoryLocal, CategoryLocal, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterWhereClause> idBetween(
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

extension CategoryLocalQueryFilter
    on QueryBuilder<CategoryLocal, CategoryLocal, QFilterCondition> {
  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
      filterCategoryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'filterCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
      filterCategoryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'filterCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
      filterCategoryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'filterCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
      filterCategoryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'filterCategory',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
      filterCategoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'filterCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
      filterCategoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'filterCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
      filterCategoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'filterCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
      filterCategoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'filterCategory',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
      filterCategoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'filterCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
      filterCategoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'filterCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
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

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition> idBetween(
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

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
      idCategoryEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idCategory',
        value: value,
      ));
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
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

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
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

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
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

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
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

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
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

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
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

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
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

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
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

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
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

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
      nameCategoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nameCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
      nameCategoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nameCategory',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
      nameCategoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
      nameCategoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nameCategory',
        value: '',
      ));
    });
  }
}

extension CategoryLocalQueryObject
    on QueryBuilder<CategoryLocal, CategoryLocal, QFilterCondition> {}

extension CategoryLocalQueryLinks
    on QueryBuilder<CategoryLocal, CategoryLocal, QFilterCondition> {}

extension CategoryLocalQuerySortBy
    on QueryBuilder<CategoryLocal, CategoryLocal, QSortBy> {
  QueryBuilder<CategoryLocal, CategoryLocal, QAfterSortBy>
      sortByFilterCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filterCategory', Sort.asc);
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterSortBy>
      sortByFilterCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filterCategory', Sort.desc);
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterSortBy> sortByIdCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCategory', Sort.asc);
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterSortBy>
      sortByIdCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCategory', Sort.desc);
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterSortBy>
      sortByNameCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameCategory', Sort.asc);
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterSortBy>
      sortByNameCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameCategory', Sort.desc);
    });
  }
}

extension CategoryLocalQuerySortThenBy
    on QueryBuilder<CategoryLocal, CategoryLocal, QSortThenBy> {
  QueryBuilder<CategoryLocal, CategoryLocal, QAfterSortBy>
      thenByFilterCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filterCategory', Sort.asc);
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterSortBy>
      thenByFilterCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filterCategory', Sort.desc);
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterSortBy> thenByIdCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCategory', Sort.asc);
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterSortBy>
      thenByIdCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCategory', Sort.desc);
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterSortBy>
      thenByNameCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameCategory', Sort.asc);
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterSortBy>
      thenByNameCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameCategory', Sort.desc);
    });
  }
}

extension CategoryLocalQueryWhereDistinct
    on QueryBuilder<CategoryLocal, CategoryLocal, QDistinct> {
  QueryBuilder<CategoryLocal, CategoryLocal, QDistinct>
      distinctByFilterCategory({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'filterCategory',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QDistinct> distinctByIdCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idCategory');
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QDistinct> distinctByNameCategory(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nameCategory', caseSensitive: caseSensitive);
    });
  }
}

extension CategoryLocalQueryProperty
    on QueryBuilder<CategoryLocal, CategoryLocal, QQueryProperty> {
  QueryBuilder<CategoryLocal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CategoryLocal, String, QQueryOperations>
      filterCategoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'filterCategory');
    });
  }

  QueryBuilder<CategoryLocal, int, QQueryOperations> idCategoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idCategory');
    });
  }

  QueryBuilder<CategoryLocal, String, QQueryOperations> nameCategoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nameCategory');
    });
  }
}
