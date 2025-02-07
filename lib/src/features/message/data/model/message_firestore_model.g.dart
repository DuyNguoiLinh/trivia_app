// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_firestore_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageFirestoreModel _$MessageFirestoreModelFromJson(
        Map<String, dynamic> json) =>
    MessageFirestoreModel(
      messageId: json['messageId'] as String,
      conversationId: json['conversationId'] as String,
      senderId: json['senderId'] as String,
      text: json['text'] as String,
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$MessageFirestoreModelToJson(
        MessageFirestoreModel instance) =>
    <String, dynamic>{
      'messageId': instance.messageId,
      'conversationId': instance.conversationId,
      'senderId': instance.senderId,
      'text': instance.text,
      'timestamp': instance.timestamp,
    };
