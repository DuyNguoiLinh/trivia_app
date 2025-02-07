import 'package:json_annotation/json_annotation.dart';

part 'follow_firestore_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FollowFirestoreModel {
  final String senderId;
  final String receiverId;
  final int createdAt;

  FollowFirestoreModel({
    required this.senderId,
    required this.receiverId,
    required this.createdAt,
  });


  factory FollowFirestoreModel.fromJson(Map<String, dynamic> json) => _$FollowFirestoreModelFromJson(json);


  Map<String, dynamic> toJson() => _$FollowFirestoreModelToJson(this);
}
