import 'package:flutter/cupertino.dart';
import 'package:trivia_app_with_flutter/src/features/questions/domain/entity/question_entity.dart';

class QuestionItem extends StatelessWidget {
  const QuestionItem({super.key, required this.questionEntity});
  final QuestionEntity questionEntity;
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        children: [
          Text(questionEntity.question),
          Text(questionEntity.correctAnswer),
          Center(
            child: SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: questionEntity.incorrectAnswers.length,
                  itemBuilder: (context,index) {
                   return Text(questionEntity.incorrectAnswers[index]);
                  }
              ),
            ),
          )

        ],
      ),
    );
  }
}
