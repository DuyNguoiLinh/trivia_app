// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_firestore_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationFirestoreModel _$ConversationFirestoreModelFromJson(
        Map<String, dynamic> json) =>
    ConversationFirestoreModel(
      id: json['id'] as String,
      userId1: json['userId1'] as String,
      userId2: json['userId2'] as String,
      lastMessage: json['lastMessage'] as String,
      lastMessageTimestamp:
          DateTime.parse(json['lastMessageTimestamp'] as String),
    );

Map<String, dynamic> _$ConversationFirestoreModelToJson(
        ConversationFirestoreModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId1': instance.userId1,
      'userId2': instance.userId2,
      'lastMessage': instance.lastMessage,
      'lastMessageTimestamp': instance.lastMessageTimestamp.toIso8601String(),
    };
