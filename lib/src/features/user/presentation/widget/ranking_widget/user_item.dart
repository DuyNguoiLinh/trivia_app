import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/user/domain/entity/user_entity.dart';

class UserItem extends ConsumerWidget {
  const UserItem({super.key,required this.userEntity});
 final UserEntity userEntity;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
   return Container(
     height: 250,
     margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
     padding:  const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
     decoration: BoxDecoration(
       color: Colors.white,
       border: Border.all(
         color: Colors.grey,
         width: 2.0,
       ),
       borderRadius: BorderRadius.circular(20),
       boxShadow: [
         BoxShadow(
           color: Colors.black.withOpacity(0.3),
           spreadRadius: 2,
           blurRadius: 5,
           offset: const Offset(0, 2),
         ),
       ],
     ),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceAround,
       children: [
         Text(userEntity.userName),
         Text(userEntity.coin.toString()),
       ],
     ),
   );
  }

}