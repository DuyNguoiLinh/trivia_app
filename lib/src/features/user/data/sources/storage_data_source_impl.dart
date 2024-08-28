import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trivia_app_with_flutter/src/features/user/data/sources/storage_data_source.dart';

class StorageDataSourceImpl implements StorageDataSource{
  final FirebaseStorage  _storage = FirebaseStorage.instance ;

  @override
  Future<String>  uploadAvatar(XFile pickerFile)  async {
    try {
      final String fileName = '${DateTime.now()}_${pickerFile.name}';
      final String path = 'avatar/$fileName';
      final Reference storageRef = _storage.ref().child(path);
      
      await storageRef.putFile(File(pickerFile.path));


         final String downloadUrl = await storageRef.getDownloadURL();
          return downloadUrl;

    } catch (err) {
      return Future.error(err);
    }
  }

  @override
  Future<String>  changeAvatar(XFile newPickerFile, String currentAvatarUrl )  async {
    try {

        final Reference oldRef = _storage.refFromURL(currentAvatarUrl);
        await oldRef.delete();

        final String fileName = '${DateTime.now()}_${newPickerFile.name}';
        final String path = 'avatars/$fileName';
        final Reference storageRef = _storage.ref().child(path);

        await _storage.ref().putFile(File(newPickerFile.path));

        final String newAvatarUrl = await storageRef.getDownloadURL();
         return newAvatarUrl;
    } catch (err) {
       return Future.error(err);
    }
  }

}