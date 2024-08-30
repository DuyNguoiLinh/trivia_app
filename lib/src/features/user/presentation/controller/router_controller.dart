import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/screen/option_screen.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/screen/question_screen.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/screen/result_screen.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/screen/review_screen.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/home_widget/bottom_navigationbar.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/screen/Ranking_screen.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/screen/gift_screen.dart';
import 'package:trivia_app_with_flutter/src/features/follower/presentation/screen/myself_screen.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/screen/wallet_screen.dart';
import '../../../questions/presentation/screen/home_screen.dart';
import '../../../questions/presentation/screen/start_screen.dart';
import 'app_controller.dart';

final authStateProvider = StreamProvider((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

final goRouterProvider = Provider.autoDispose<GoRouter>((ref) {

  final authState = ref.watch(authStateProvider);
  final isLoginCompleted = authState.asData?.value != null;

  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'home');
  final _shellNavigatorWalletKey = GlobalKey<NavigatorState>(debugLabel: 'wallet');
  final _shellNavigatorRankingKey = GlobalKey<NavigatorState>(debugLabel: 'ranking');
  final _shellNavigatorSelfKey = GlobalKey<NavigatorState>(debugLabel: 'self');
  final _shellNavigatorGiftKey = GlobalKey<NavigatorState>(debugLabel: 'gift');

  return GoRouter(
    initialLocation: '/',
    routes: [

      StatefulShellRoute.indexedStack(
        builder: (context,state,navigatorShell) {
          return  QuizBottomNavigationBar(navigationShell: navigatorShell,);
        },
        branches: [

          StatefulShellBranch(
            navigatorKey: _shellNavigatorHomeKey,
            routes: [
              GoRoute(path: '/',
                pageBuilder: (context, state) => const NoTransitionPage(child: HomeScreen())
              ),
            ]
          ),

          StatefulShellBranch(
            navigatorKey: _shellNavigatorWalletKey,
            routes: [
              GoRoute(
                path: '/wallet',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: WalletScreen(),
                ),
              ),
            ],
          ),

          StatefulShellBranch(
            navigatorKey: _shellNavigatorRankingKey,
            routes: [
              GoRoute(
                path: '/ranking',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: RankingScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorSelfKey,
            routes: [
              GoRoute(
                path: '/myself',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: MyselfScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorGiftKey,
            routes: [
              GoRoute(
                path: '/gift',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: GiftScreen(),
                ),
              ),
            ],
          ),
        ],
      ),
      GoRoute(path: '/auth', builder: (context, state) => const StartScreen()),

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
