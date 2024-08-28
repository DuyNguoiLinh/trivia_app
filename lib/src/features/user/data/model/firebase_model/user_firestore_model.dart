import 'package:json_annotation/json_annotation.dart';
import 'package:trivia_app_with_flutter/src/features/user/data/model/firebase_model/coin_history_firestore_model.dart';
import 'package:trivia_app_with_flutter/src/features/user/data/model/firebase_model/question_firestore_model.dart';

part 'user_firestore_model.g.dart';

@JsonSerializable()
class UserFirestoreModel {
  final String uid;
  final String name;
  final double coin;
  final String? avatarUrl;
  final List<CoinHistoryFirestoreModel> coinHistories;
  final List<QuestionFirestoreModel> questionsFavorite;

  UserFirestoreModel({
    required this.uid,
    required this.name,
    this.coin = 0,
    this.avatarUrl,
    this.coinHistories = const <CoinHistoryFirestoreModel>[],
    this.questionsFavorite = const <QuestionFirestoreModel>[],
  });


  factory UserFirestoreModel.fromJson(Map<String, dynamic> json) => _$UserFirestoreModelFromJson(json);


  Map<String, dynamic> toJson() => _$UserFirestoreModelToJson(this);
}
