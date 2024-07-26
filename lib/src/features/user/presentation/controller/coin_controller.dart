// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../../domain/repository/user_repository.dart';
//
// class AsyncCoinNotifier extends AutoDisposeAsyncNotifier<double> {
//   final userRepository = UserRepository.create();
//
//   @override
//   FutureOr<double> build() async{
//     // final userNameInfo =await userRepository.getInfoUser();
//     // return userNameInfo;
//   }
//
//   Future<void> saveUseName(String name) async {
//     await userRepository.saveUserName(name);
//   }
//
//
// }
// final userProvider = AsyncNotifierProvider.autoDispose<AsyncCoinNotifier,double>(() => AsyncCoinNotifier());
