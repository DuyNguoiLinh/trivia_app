import 'package:isar/isar.dart';
part 'user_info_local.g.dart';
@collection
class UserInfoLocal{
  Id id=Isar.autoIncrement;
  @Index(unique: true)
  late String userName;
  UserInfoLocal({
    required this.userName
});
}