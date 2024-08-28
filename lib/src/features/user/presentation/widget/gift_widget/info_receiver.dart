import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../../controller/user_controller.dart';


class InfoReceiver extends ConsumerWidget {
  const InfoReceiver({super.key,required this.receiverName,required this.messageController});
  final String  receiverName;
 final TextEditingController messageController;
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final asyncUserName =ref.watch(userProvider);
    final userInfo=asyncUserName.valueOrNull;

    messageController.text = '${userInfo?.userName} send coin';

   return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "Sent to : ",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
        Container(
          height: 50,
          margin: const EdgeInsets.only(top: 8),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.grey,
                width: 2,
              )),
          child:  Center(
              child: Text(
                receiverName,
                style: const TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
              )),
        ),
      const Text(
        "Message ",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      Container(
        height: 60,
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.grey,
              width: 2,
            )),
        child: TextField(
          controller: messageController,
          decoration: const InputDecoration(
               border: InputBorder.none),
        ),
      ),
    ],
   );

  }

}