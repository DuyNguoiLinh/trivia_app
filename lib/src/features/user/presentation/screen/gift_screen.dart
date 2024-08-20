import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/user/data/sources/send_coin_error.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/controller/gift_controller.dart';

import '../../../questions/presentation/widget/question_widget/warning_dialog.dart';
import '../../global_variables.dart';
import '../controller/user_controller.dart';

class GiftScreen extends ConsumerWidget {
  const GiftScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final TextEditingController _adressController = TextEditingController();
    final TextEditingController _amountCoinController = TextEditingController();

    final asyncNewCoinValue = ref.watch(giftProvider);
    final newCoin = asyncNewCoinValue.valueOrNull;

    ref.listen(giftProvider, (previous, next) {
      if (next is AsyncError ) {
        final error = next.error;
        if(error is SendCoinError){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error.message)),);
        }
      } else if(next is AsyncData && previous != next)  {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Send your gift Success')),);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('give a gift '),),
      ),
      body:Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Your wallet :',
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(newCoin.toString(),
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8,),
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
                  " Wallet Adress",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                    keyboardType: TextInputType.emailAddress,
                    controller: _adressController,
                    decoration: const InputDecoration(
                        hintText: 'oVLGfwYQDOTGD8QicGDxcvdziH3', border: InputBorder.none),
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
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
              ],
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: ()  {

                if(_amountCoinController.text.isNotEmpty) {
                  final amount = double.tryParse(_amountCoinController.text);

                  if(amount! <= coin) {
                    FocusScope.of(context).unfocus();
                    ref.read(giftProvider.notifier).sendCoin(_adressController.text,amount);
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const WarningDialog(optionName: 'Give a gift');
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
    );
  }

}