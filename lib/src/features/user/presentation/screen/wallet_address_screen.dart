import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/user_controller.dart';

class WalletAddressScreen extends ConsumerWidget {
  const WalletAddressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final asyncUser = ref.watch(userProvider);
    final userInfo = asyncUser.valueOrNull;
    if(userInfo == null) {
      return const Center(child: CircularProgressIndicator(),);
    }
    final walletAddress =userInfo.uid;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 100,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const Center(
              child: Text(
                'Your Wallet Address',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.wallet, size: 24.0),
                   Expanded(
                    child: Text(
                      walletAddress,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.copy),
                    onPressed: () {
                      Clipboard.setData( ClipboardData(text: walletAddress));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Address copied to clipboard')),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
