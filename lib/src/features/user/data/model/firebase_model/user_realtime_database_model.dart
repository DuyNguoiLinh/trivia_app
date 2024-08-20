class UserRealtimeDatabaseModel {
  final String uid;
  final String name;
  final String email;
  final double coin;

  UserRealtimeDatabaseModel({
    required this.uid,
    required this.name,
    required this.email,
    this.coin = 0,
  });

  factory UserRealtimeDatabaseModel.fromJson(Map<String, dynamic> json) {
    return UserRealtimeDatabaseModel(
      uid: json['uid'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      coin: (json['coin'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'coin': coin,
    };
  }
}
