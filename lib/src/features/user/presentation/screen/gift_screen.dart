import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/user/data/sources/send_coin_error.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/controller/gift_controller.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/controller/user_name_controller.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/widget/gift_widget/info_receiver.dart';

import '../../../questions/presentation/widget/question_widget/warning_dialog.dart';
import '../../global_variables.dart';
import '../controller/user_controller.dart';

class GiftScreen extends ConsumerStatefulWidget {
  const GiftScreen({super.key});

  @override
  _GiftScreenState createState() => _GiftScreenState();
}

class _GiftScreenState extends ConsumerState<GiftScreen> {

  final FocusNode _walletAddress = FocusNode();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _amountCoinController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _walletAddress.addListener(() {
      if (!_walletAddress.hasFocus ) {
        ref.read(userNameProvider.notifier).getUserNameByUid(_addressController.text);
      }
    });
  }

  @override
  void dispose() {
    _walletAddress.dispose();
    _addressController.dispose();
    _amountCoinController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final asyncName = ref.watch(userNameProvider);
    final userName = asyncName.valueOrNull;

    final asyncCoin = ref.watch(userProvider);
    final newCoin = asyncCoin.valueOrNull;


    ref.listen<AsyncValue<double>>(giftProvider, (previous, next) {
      if (next is AsyncError) {
        final error = next.error;
        if (error is SendCoinError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error.message)),
          );
        }
      } else if (next is AsyncData && previous != next) {
        final previousValue = previous?.value ?? 0.0;
        final nextValue = next.value ?? 0.0;

        if (previousValue > nextValue) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Send your gift Success')),
          );
        }  if(previousValue <nextValue && previous is AsyncData) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('You are given ${nextValue - previousValue} coin')),
          );
        }
      }
    });

    if(newCoin != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Give a Gift'),
          ),
        ),
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Your wallet :',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        newCoin.coin.toString(),
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Image.asset(
                        'assets/images/bitcoin.png',
                        width: 34,
                        height: 34,
                      ),
                    ],
                  ),
                  const SizedBox(height: 80),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        " Wallet Address",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
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
                        child: TextField(
                          focusNode: _walletAddress,
                          keyboardType: TextInputType.emailAddress,
                          controller: _addressController,
                          decoration: const InputDecoration(
                              hintText: 'oVLGfwYQDOTGD8QicGDxcvdziH3',
                              border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Amount Coin",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
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
                        child: TextField(
                          controller: _amountCoinController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              hintText: '0.0', border: InputBorder.none),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      if (userName != null &&
                          _addressController.text.isNotEmpty &&
                          _addressController.text != uidGlobal)
                        InfoReceiver(receiverName: userName,
                          messageController: messageController,),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_amountCoinController.text.isNotEmpty &&
                          _addressController.text != uidGlobal) {
                        final amount = double.tryParse(
                            _amountCoinController.text);

                        if (amount! <= coinGlobal) {
                          FocusScope.of(context).unfocus();
                          ref.read(giftProvider.notifier).sendCoin(
                              _addressController.text, amount,
                              messageController.text);
                          _addressController.clear();
                          _amountCoinController.clear();
                          messageController.clear();
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const WarningDialog(
                                  optionName: 'Give a gift');
                            },
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text(
                      'Send',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    } else {
      return const Center(child: Text('error'),);
    }
  }
}
