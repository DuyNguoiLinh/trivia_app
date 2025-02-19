import 'package:json_annotation/json_annotation.dart';

import 'category_response.dart';
part 'categories_response.g.dart';
@JsonSerializable()
class CategoriesResponse {
  @JsonKey(name: 'trivia_categories')
  final List<CategoryResponse> triviaCategories;

  CategoriesResponse({required this.triviaCategories});

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) => _$CategoriesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CategoriesResponseToJson(this);
}

