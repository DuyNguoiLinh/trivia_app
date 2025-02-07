import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/controller/user_controller.dart';
import '../../../../user/presentation/controller/app_controller.dart';
import '../../../../user/presentation/screen/set_name_screen.dart';
import '../../../../user/presentation/screen/wallet_address_screen.dart';


class DrawSetting extends ConsumerStatefulWidget {
  const DrawSetting({super.key});

  @override
  _DrawSettingState createState() => _DrawSettingState();
}

class _DrawSettingState extends ConsumerState<DrawSetting> {


  @override
  Widget build(BuildContext context) {

    final asyncUserInfo = ref.watch(userProvider);
    final userInfo = asyncUserInfo.valueOrNull;

    if(userInfo != null) {
      return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(userInfo.userName),
              accountEmail: const Text(''),
              currentAccountPicture: GestureDetector(
                // onTap: () => ref.read(avatarProvider.notifier).pickImage,
                child: ClipOval(
                  // borderRadius: BorderRadius.circular(30.0),
                  child: IconButton(
                    onPressed: () {},
                    icon: userInfo.avatarUrl == null ?  Image.asset('assets/images/user.png') :
                    Image.network(userInfo.avatarUrl!,
                      loadingBuilder: (context,child,loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                            ),
                          );
                        }
                      },

                    ),
                    iconSize: 50,
                  ),
                )
              ),
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: const Text('Set Avatar'),
              onTap: () =>
              ref
                  .read(userProvider.notifier)
                  .pickImage(ImageSource.gallery),
            ),
            ListTile(
              title: const Text('Change name '),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SetNameScreen()),
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
              title: const Text('Wallet address'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WalletAddressScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('Delete account'),
              onTap: () {
                ref.read(appProvider.notifier).deleteAccount();
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {

              },
            ),
          ],
        ),
      );
    } else {
      return Center(child: CircularProgressIndicator(),);
    }
  }
}


