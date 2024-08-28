import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../user/presentation/controller/user_controller.dart';
import 'filters.dart';
import 'list_category.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // get info user into local
    final asyncUserName =ref.watch(userProvider);
    final userInfo=asyncUserName.valueOrNull;

    if(userInfo != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Hello, ',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(width: 5,),
                    Text(userInfo!.userName, style: const TextStyle(
                        fontSize: 30,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),)
                  ],
                ),
                const Text("Lets test your knowledge",
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 100),
            child: const Text(
              'Pick a Quiz Category',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Divider(
                height: 3,
                color: Colors.grey,
              )),
          const Filters(),
          const Expanded(child: ListCategory())
        ],
      );
    } else {
      return const Center(child: CircularProgressIndicator(),);
    }
  }

}