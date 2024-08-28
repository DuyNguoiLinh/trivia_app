class FollowRealtimeDatabaseModel {
  final String uidFollower;
  final String userName ;
  final String? avatarUrl;

  FollowRealtimeDatabaseModel({
    required this.uidFollower,
    required this.userName,
    this.avatarUrl,
  });

  factory FollowRealtimeDatabaseModel.fromJson(Map<String, dynamic> json) {
    return FollowRealtimeDatabaseModel(
      uidFollower: json['uidFollower'] as String,
      userName: json['userName'] as String,
      avatarUrl: json['avatarUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uidFollower': uidFollower,
      'userName' : userName,
      'avatarUrl' : avatarUrl,
    };
  }
}
