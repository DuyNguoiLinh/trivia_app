import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/screen/option_screen.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/screen/question_screen.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/screen/result_screen.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/screen/review_screen.dart';
import '../../../questions/presentation/screen/home_screen.dart';
import '../../../questions/presentation/screen/start_screen.dart';
import 'app_controller.dart';

final authStateProvider = StreamProvider((ref) {
  return FirebaseAuth.instance.authStateChanges();
});


final goRouterProvider = Provider.autoDispose<GoRouter>((ref) {

  final authState = ref.watch(authStateProvider);
  final isLoginCompleted = authState.asData?.value != null;

  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/auth', builder: (context, state) => const StartScreen()),
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
          path: '/options', builder: (context, state) => const OptionScreen()),
      GoRoute(
          path: '/questions',
          builder: (context, state) => const QuestionScreen()),
      GoRoute(
          path: '/result', builder: (context, state) => const ResultScreen()),
      GoRoute(
          path: '/review', builder: (context, state) => const ReviewScreen()),
    ],
    redirect: (context, state) {
      if (isLoginCompleted && state.path == "/auth") {
        return "/";
      }
      if (!isLoginCompleted && state.path != "/auth") {
        return "/auth";
      }
      return null;
    },
  );
});
