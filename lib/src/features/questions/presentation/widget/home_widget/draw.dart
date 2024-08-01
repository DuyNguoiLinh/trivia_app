import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Draw extends ConsumerWidget {
  const Draw({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Setting '),
          ),
          ListTile(
            // set name
            title: const Text('Change name '),
            onTap: () {
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
            },
          ),
        ],
      ),
    );
  }

}