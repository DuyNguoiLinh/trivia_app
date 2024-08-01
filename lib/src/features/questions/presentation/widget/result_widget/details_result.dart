import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/result_entity.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/controller/result_controller/data_result_controller.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/result_widget/part_detail.dart';

class DetailsResult extends ConsumerWidget {
  const DetailsResult({super.key,required this.resultEntity});

  final ResultEntity resultEntity;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
              return  Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 260,
                    decoration:  const BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50)),
                      color: Colors.purpleAccent,
                    ),
                    child: Center(
                      child: Container(
                        width: 200,
                        height: 200,
                        alignment: Alignment.center,
                        decoration:  BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.yellow.withOpacity(0.5),
                              spreadRadius: 10,
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 8,),
                            const Text('+ ' , style: TextStyle(fontSize: 28 ,fontWeight: FontWeight.bold)),
                            Text(resultEntity.coin.toString(), style: const TextStyle(fontSize: 35 ,fontWeight: FontWeight.bold),),
                            const SizedBox(width: 4,),
                            Image.asset('assets/images/bitcoin.png', width: 35, height: 35),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      const SizedBox(width: 5,),
                      PartDetail(title: 'Completion', content: resultEntity.completion.toStringAsFixed(1)),
                      const SizedBox(width: 20,),
                      PartDetail(title: 'Total', content: resultEntity.total.toString()),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      const SizedBox(width: 5,),
                      PartDetail(title: 'Correct', content: resultEntity.correct.toString() ),
                      const SizedBox(width: 20,),
                      PartDetail(title: 'Wrong', content: resultEntity.wrong.toString()),
                    ],
                  )
                ],
              );
  }
}
