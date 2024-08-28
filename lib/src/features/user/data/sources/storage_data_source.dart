import 'package:image_picker/image_picker.dart';
import 'package:trivia_app_with_flutter/src/features/user/data/sources/storage_data_source_impl.dart';

abstract class StorageDataSource {

  Future<String>  uploadAvatar(XFile pickerFile);

  Future<String>  changeAvatar(XFile newPickerFile, String currentAvatarUrl );


  factory StorageDataSource.create() {
    return StorageDataSourceImpl();
  }
}