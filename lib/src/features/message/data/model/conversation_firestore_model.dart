
import 'package:json_annotation/json_annotation.dart';

part 'conversation_firestore_model.g.dart';

@JsonSerializable()
class ConversationFirestoreModel {

  final String id;
  final String userId1;
  final String userId2;
  final String lastMessage;
  final DateTime lastMessageTimestamp;

  ConversationFirestoreModel({
    required this.id,
    required this.userId1,
    required this.userId2,
    required this.lastMessage,
    required this.lastMessageTimestamp,
  });


  factory ConversationFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$ConversationFirestoreModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationFirestoreModelToJson(this);
}