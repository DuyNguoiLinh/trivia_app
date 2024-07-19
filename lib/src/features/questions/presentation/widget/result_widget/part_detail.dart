import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/result_controller/part_detail_controller.dart';

class PartDetail extends ConsumerWidget {
  const PartDetail({super.key,required this.title,required this.content});

  final String title;
  final String content;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final mapColor =ref.watch(colorPartDetailProvider);
    final mapIcon=ref.watch(iconPartDetailProvider);
    final IconData iconData = mapIcon[title] ?? Icons.help_outline;
    final Color colorData = mapColor[title] ?? Colors.black;


    return  Container(
      margin: const EdgeInsets.only(left: 20),
      padding: const EdgeInsets.symmetric(horizontal: 1),
      width: 150,
      height: 150,
      alignment: Alignment.center,
      decoration:  BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)),
        color: colorData,
      ),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10,),
          Text(title ,style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, shadows: [
            Shadow(
              offset: Offset(2.0, 2.0),
              blurRadius: 5.0,
              color: Colors.white,
            ),
          ],),),
          const Spacer(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
            width: 140,
            height: 100,
            alignment: Alignment.center,
            decoration:  BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: Colors.black.withOpacity(0.75),
            ),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                if(title != 'Completion')

                Icon(iconData,color: title != 'Correct' ? ( title != 'Wrong' ? Colors.white : Colors.redAccent) :  Colors.lightGreenAccent ,),
                const SizedBox(width: 10,),
                Text(content.toString(),style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30,color: Colors.white),),

                if(title == 'Completion')
                  Icon(iconData,color: Colors.white ,),

              ],
            ),
          )

        ],
      ),
    );
  }

}