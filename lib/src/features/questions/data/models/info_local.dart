import 'package:isar/isar.dart';

part 'info_local.g.dart';
@Collection()
class InfoLocal{
  Id id=Isar.autoIncrement;
  late String userName;
  InfoLocal({
    required this.userName
});
}