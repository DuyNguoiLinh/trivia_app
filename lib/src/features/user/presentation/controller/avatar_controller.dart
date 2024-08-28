import 'dart:async';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/repository/user_repository.dart';
import 'package:trivia_app_with_flutter/src/features/user/global_variables.dart';

class AvatarNotifier extends AutoDisposeAsyncNotifier<File?> {

  final ImagePicker _picker = ImagePicker();
  final _userRepository = UserRepository.create();

  @override
  FutureOr<File?> build() {
    // TODO: implement build
    throw UnimplementedError();
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        await _userRepository.uploadAvatar(pickedFile, uidGlobal);
        state = AsyncValue.data(File(pickedFile.path));
      }
    } catch (err) {
      return Future.error(err);
    }
  }
}

final avatarProvider  = AsyncNotifierProvider.autoDispose <AvatarNotifier,File?> (() => AvatarNotifier());