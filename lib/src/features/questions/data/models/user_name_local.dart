import 'package:isar/isar.dart';

part 'user_name_local.g.dart';
@Collection()
class UserNameLocal{
  Id id=Isar.autoIncrement;
  @Index(unique: true)
  late String userName;
  UserNameLocal({
    required this.userName
});
}