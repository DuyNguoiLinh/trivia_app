// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_firestore_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserFirestoreModel _$UserFirestoreModelFromJson(Map<String, dynamic> json) =>
    UserFirestoreModel(
      uid: json['uid'] as String,
      name: json['name'] as String,
      coin: (json['coin'] as num?)?.toDouble() ?? 0,
      avatarUrl: json['avatarUrl'] as String?,
      coinHistories: (json['coinHistories'] as List<dynamic>?)
              ?.map((e) =>
                  CoinHistoryFirestoreModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <CoinHistoryFirestoreModel>[],
      questionsFavorite: (json['questionsFavorite'] as List<dynamic>?)
              ?.map((e) =>
                  QuestionFirestoreModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <QuestionFirestoreModel>[],
    );

Map<String, dynamic> _$UserFirestoreModelToJson(UserFirestoreModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'coin': instance.coin,
      'avatarUrl': instance.avatarUrl,
      'coinHistories': instance.coinHistories,
      'questionsFavorite': instance.questionsFavorite,
    };
