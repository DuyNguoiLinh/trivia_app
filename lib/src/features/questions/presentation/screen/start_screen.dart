import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/controller/app_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/start_widget/login_screen.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/start_widget/sign_up_screen.dart';

class StartScreen extends ConsumerWidget{
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final index= ref.watch(loginProvider);

    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  height: 300,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/onBoarding1.png'),
                        )),),
                ),

              ),
              if(index==0)
              const LoginScreen(),
              if(index==1)
               const SignUpScreen(),
            ],
          ),
        ));
  }

}
