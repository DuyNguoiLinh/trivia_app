import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/controller/app_controller.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/screen/set_name_screen.dart';

class DrawSetting extends ConsumerWidget {
  const DrawSetting({super.key});

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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  SetNameScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('Sign Out'),
            onTap: () {
              ref.read(appProvider.notifier).signOut();
            },
          ),
          ListTile(
            title: const Text('Google account connect'),
            onTap: () {
              ref.read(appProvider.notifier).linkGoogleAccount();
            },
          ),
          ListTile(
            title: const Text('Delete account'),
            onTap: () {
              ref.read(appProvider.notifier).deleteAccount();
            },
          ),
        ],
      ),
    );
  }
}