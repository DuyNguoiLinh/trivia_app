import 'package:json_annotation/json_annotation.dart';

part 'message_firestore_model.g.dart';

@JsonSerializable()
class MessageFirestoreModel {

  final String messageId;
  final String conversationId;
  final String senderId;
  final String text;
  final String timestamp;

  MessageFirestoreModel({
    required this.messageId,
    required this.conversationId,
    required this.senderId,
    required this.text,
    required this.timestamp,
  });

  factory MessageFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$MessageFirestoreModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageFirestoreModelToJson(this);
}
