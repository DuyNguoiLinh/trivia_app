// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_firestore_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowFirestoreModel _$FollowFirestoreModelFromJson(
        Map<String, dynamic> json) =>
    FollowFirestoreModel(
      senderId: json['senderId'] as String,
      receiverId: json['receiverId'] as String,
      createdAt: (json['createdAt'] as num).toInt(),
    );

Map<String, dynamic> _$FollowFirestoreModelToJson(
        FollowFirestoreModel instance) =>
    <String, dynamic>{
      'senderId': instance.senderId,
      'receiverId': instance.receiverId,
      'createdAt': instance.createdAt,
    };
