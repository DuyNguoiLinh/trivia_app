import 'package:json_annotation/json_annotation.dart';

part 'follower_firestore_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FollowerFirestoreModel {
  final String followId;
  final String receiverId;

  FollowerFirestoreModel({
    required this.followId,
    required this.receiverId,
  });


  factory FollowerFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$FollowerFirestoreModelFromJson(json);


  Map<String, dynamic> toJson() => _$FollowerFirestoreModelToJson(this);
}
