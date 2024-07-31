import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/controller/user_controller.dart';

class SetNameScreen extends ConsumerWidget {
   SetNameScreen({super.key});

  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final asyncInfoUser=ref.watch(userProvider);

    final infoUser = asyncInfoUser.valueOrNull;

    _textController.text=infoUser!.userName;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50,),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',style: TextStyle(fontSize: 20,color: Colors.redAccent)
                  ),
                ),

                const SizedBox(width: 20,),

                const Text(
                  'UserName',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
                ),

                const SizedBox(width: 20,),

                TextButton(
                  onPressed: () {

                    if(_textController.text != infoUser.userName){
                      ref.read(userProvider.notifier).changeUserName(_textController.text);
                      Navigator.pop(context);
                    }

                  },
                  child: const Text(
                    'Save',style: TextStyle(fontSize: 20,color: Colors.blueAccent),
                  ),
                ),

              ],
            ),
            const SizedBox(height: 5),
            Container(
              color: Colors.grey.withOpacity(0.5),
              height: 1.0,
              width: double.infinity,
            ),
            const SizedBox(height: 10),
            Container(
              padding:  const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  label: const Text('UserName'),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _textController.clear();
                    },
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
