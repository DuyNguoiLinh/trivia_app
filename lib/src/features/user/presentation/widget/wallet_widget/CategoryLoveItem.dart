import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/category_entity.dart';
import 'package:trivia_app_with_flutter/src/features/user/presentation/screen/view_question_screen.dart';
import '../../../../questions/presentation/controller/home_controller/category_controller.dart';
import '../../../../questions/presentation/controller/question_controller/list_question_controller.dart';

class CategoryLoveItem extends ConsumerWidget{
  const CategoryLoveItem({super.key,required this.categoryEntity,});

   final CategoryEntity categoryEntity;
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final mapIcon=ref.watch(iconCategoryProvider);
    final iconCategory= mapIcon[categoryEntity.id] ?? "assets/icons/book.png";

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor:  Colors.blueGrey,
            foregroundColor: Colors.white,
            side: const BorderSide(width: 2.0,color: Colors.white70),
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          onPressed: () {

          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 20,),
              Image.asset(
                iconCategory,
                width: 40,
                height: 40,
              ),
              const SizedBox(width: 40,),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        categoryEntity.nameCategory.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                       Row(
                        children: [
                          Icon(
                            Icons.question_answer,
                            color: Colors.redAccent.withOpacity(0.9),
                            size: 24,
                          ),
                          const SizedBox(width: 4),
                          Text( '${categoryEntity.listQuestion?.length.toString()} question',
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
              ),
              IconButton(
                  onPressed: () {
                     ref.read(idCategoryProvider.notifier).state=categoryEntity.id;
                  //   view question
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ViewQuestionScreen(listQuestion: categoryEntity.listQuestion!,)),
                    );
                  },
                  icon: const Icon(Icons.visibility),iconSize: 28,)
            ],
          )
      ),
    );

  }

}