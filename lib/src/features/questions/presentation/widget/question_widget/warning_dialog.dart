import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class WarningDialog extends ConsumerWidget {
  const WarningDialog({super.key, required this.optionName});

  final String optionName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text(
        'Warning !',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
      ),
      content: RichText(
        text: TextSpan(
          children: [
            const TextSpan(
              text: 'The remaining coins are not enough to use ',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            TextSpan(
              text: optionName,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            const TextSpan(
              text: ' .',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          child: const Text(
            'OK',
              style:  TextStyle(
              fontSize: 22,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
