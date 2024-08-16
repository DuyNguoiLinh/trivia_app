import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/controller/app_controller.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/controller/user_controller.dart';

import '../../../../user/data/sources/auth_error.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final TextEditingController _userNameController = TextEditingController();
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
              'Sign up',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "  User name",
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
                child:  TextField(
                  controller: _userNameController,
                  decoration: const InputDecoration(
                      hintText: 'hehe168', border: InputBorder.none),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
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
                child:  TextField(
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
                child:  TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                      hintText: 'xyz1256', border: InputBorder.none),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          ElevatedButton(

            onPressed: () async {
              if(_userNameController.text.isNotEmpty){
                ref .read(appProvider.notifier).signUp(_emailController.text,_passwordController.text,_userNameController.text);

              }
            },

            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            child: const Text('Sign up', style: TextStyle(color: Colors.white, fontSize: 24),),
          ),
          const SizedBox(height: 20,),
          TextButton(
              onPressed:() {
                ref.read(loginProvider.notifier).state=0;
              },
              child: const Row(
                children: [
                  Icon(Icons.arrow_back,color: Colors.red,),
                  Text('Back',style: TextStyle(fontSize: 20,color: Colors.red),),
                ],
              )
          ),
        ],
      ),
    );
  }

}