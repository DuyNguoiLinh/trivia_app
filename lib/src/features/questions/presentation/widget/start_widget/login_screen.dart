import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/screen/home_screen.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/start_widget/forgot_password.dart';
import 'package:trivia_app_with_flutter/src/features/user/data/sources/auth_error.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/controller/app_controller.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();


    ref.listen(appProvider, (previous, next) {
      if (next is AsyncError ) {
        final error = next.error;
        if(error is FirebaseAuthError){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error.message)),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Failed Login")),
          );
        }
      }
    });


    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(
            child: Text(
              'Welcome to My Friend',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "  Email Adress",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    )),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: const InputDecoration(
                      hintText: 'hehe@gmail.com', border: InputBorder.none),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "  Password",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    )),
                child: TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                      hintText: 'xyz1256', border: InputBorder.none),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Spacer(),
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const ForgotPassword();
                    },
                  );
                },
                child: const Text(
                  "Forgot Password ?",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          ElevatedButton(
            onPressed: ()  {
              ref
                  .read(appProvider.notifier)
                  .signIn(_emailController.text, _passwordController.text);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            child: const Text(
              'Login',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: ()  {
              ref.read(appProvider.notifier).signInWithGoogle();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              padding: const EdgeInsets.symmetric(vertical: 8,),
            ),
            child: const Text(
              'Sign in with Google',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Are you a new user ?',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              TextButton(
                  onPressed: () {
                    ref.read(loginProvider.notifier).state = 1;
                  },
                  child: const Text('SIGN UP',
                      style: TextStyle(color: Colors.red, fontSize: 18))),
            ],
          )
        ],
      ),
    );
  }
}
