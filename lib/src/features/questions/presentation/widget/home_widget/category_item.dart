import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/category_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/parametter_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/screen/option_screen.dart';

class CategoryItem extends ConsumerWidget {
  const CategoryItem({super.key , required this.categoryEntity});
  final CategoryEntity categoryEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapOptions=ref.watch(parameterProvider);
    final isPickOption= (mapOptions['idCategory'] == categoryEntity.id);
    return Padding(
     padding: const EdgeInsets.symmetric(horizontal: 10),
     child: OutlinedButton(
         style: OutlinedButton.styleFrom(
           backgroundColor: isPickOption ? Colors.blueAccent : Colors.white,
           foregroundColor: isPickOption ? Colors.white.withOpacity(0.8) : Colors.blueAccent.withOpacity(0.8),
           side: const BorderSide(width: 2.0,color: Colors.blueAccent),
           padding: const EdgeInsets.symmetric(vertical: 20),
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(5),
           ),
         ),
         onPressed: () {
           ref.read(parameterProvider.notifier).addParameter('idCategory', categoryEntity.id);
           Navigator.push(
             context,
             MaterialPageRoute(builder: (context) => OptionScreen(nameCategory: categoryEntity.nameCategory,)),
           );
         },
         child: Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             //  Images
             const SizedBox(width: 150,),
             Expanded(child: Text(categoryEntity.nameCategory.toString()))
           ],
         )
     ),
   );
  }

}
