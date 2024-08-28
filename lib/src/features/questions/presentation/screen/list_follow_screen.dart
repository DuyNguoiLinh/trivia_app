
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListFollowScreen extends ConsumerWidget {
  const ListFollowScreen({super.key,required this.useName});
   final String useName;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
   return Scaffold(
     appBar: AppBar(
       title: Center(child: Text(useName),),
     ),
   );
  }

}