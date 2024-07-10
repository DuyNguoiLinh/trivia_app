import 'package:isar/isar.dart';

part 'user_name_local.g.dart';
@collection
class UserNameLocal{
  Id id=Isar.autoIncrement;
  late String userName;
}