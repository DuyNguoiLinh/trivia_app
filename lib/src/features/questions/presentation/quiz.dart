
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/controller/router_controller.dart';

class Quiz extends ConsumerWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
     return   MaterialApp.router(
     routerConfig: router,
     debugShowCheckedModeBanner: false,
   );
  }

}


