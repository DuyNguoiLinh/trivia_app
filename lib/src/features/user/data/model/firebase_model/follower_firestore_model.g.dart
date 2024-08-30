// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follower_firestore_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowerFirestoreModel _$FollowerFirestoreModelFromJson(
        Map<String, dynamic> json) =>
    FollowerFirestoreModel(
      followId: json['followId'] as String,
      receiverId: json['receiverId'] as String,
    );

Map<String, dynamic> _$FollowerFirestoreModelToJson(
        FollowerFirestoreModel instance) =>
    <String, dynamic>{
      'followId': instance.followId,
      'receiverId': instance.receiverId,
    };
