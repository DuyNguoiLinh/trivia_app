import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trivia_app_with_flutter/src/features/message/presentation/screen/Setting_screen.dart';
import 'package:trivia_app_with_flutter/src/features/message/presentation/screen/message_screen.dart';
import 'package:trivia_app_with_flutter/src/features/message/presentation/screen/page_route_builder.dart';
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
  final _shellNavigatorMessKey = GlobalKey<NavigatorState>(debugLabel: 'mess');
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
            navigatorKey: _shellNavigatorMessKey,
            routes: [
              GoRoute(
                path: '/mess',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child:  MessageScreen(),
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

      // GoRoute(
      //   path: '/setting',
      //   pageBuilder: (context, state) => CustomTransitionPage(
      //     key: state.pageKey,
      //     child: const SettingScreen(),
      //     transitionDuration: const Duration(milliseconds: 500),
      //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //
      //       final slideAnimation = Tween<Offset>(
      //         begin: const Offset(0.0, 0.0),
      //         end: const Offset(0.0, 1.0),
      //       ).animate(animation);
      //
      //       final fadeAnimation = Tween<double>(
      //         begin: 1.0,
      //         end: 0.0,
      //       ).animate(animation);
      //
      //       return SlideTransition(
      //         position: slideAnimation,
      //         child: FadeTransition(
      //           opacity: fadeAnimation,
      //           child: child,
      //         ),
      //       );
      //     },
      //   ),
      // ),

      GoRoute(
        path: '/setting',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const SettingScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final fadeAnimation = Tween<double>(
                      begin: 0.7,
                      end: 1,
                    ).animate(animation);

            final fadeOutAnimation = Tween<double>(
              begin: 0,
              end: 1,
            ).animate(CurvedAnimation(parent: animation, curve: Curves.easeIn));

            final slideUpAnimation = Tween<Offset>(
              begin: const Offset(0.0, 0.08),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            ));

            final slideDownAnimation = Tween<Offset>(
              // begin: Offset.zero,
              // end: Offset(0.0 , 0.1),
              begin:  const Offset(0.0, 0.1),
              end:  const Offset(0.0,0.0),
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            ));

            return SlideTransition(
              position: animation.status == AnimationStatus.reverse
                  ? slideDownAnimation
                  : slideUpAnimation,
              child: FadeTransition(
                opacity: animation.status == AnimationStatus.reverse ? fadeOutAnimation :fadeAnimation,
                child: child,
              ),
            );
          },
          transitionDuration: const Duration(milliseconds: 400),
          reverseTransitionDuration: const Duration(milliseconds: 230),
        ),
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
