import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessageScreen extends ConsumerWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.symmetric(horizontal: 120),
          child: const Text(
            'Message',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
      ),
      body: Container(
        height: 80,
        child: ElevatedButton(
          onPressed: () {  },
          child: Row(
            children: [
              Image.asset('assets/images/user.png',height: 60,width: 60,)
            ],
          ),
        ),
      ),
      
    );
  }
}
