import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:trivia_app_with_flutter/src/features/questions/data/sources/quiz_local_data_source.dart';
import 'package:trivia_app_with_flutter/src/features/user/data/model/coin_history_local.dart';
import '../models/local/category_local.dart';
import '../models/local/question_local.dart';
import '../models/local/result_local.dart';
import '../../../user/data/model/user_info_local.dart';

class QuizLocalDataSourceImpl implements QuizLocalDataSource {
  late Future<Isar> db;

  QuizLocalDataSourceImpl() {
    db = _openDb();
  }

  Future<Isar> _openDb() async {
    final dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [
          UserInfoLocalSchema,
          CategoryLocalSchema,
          ResultLocalSchema,
          CoinHistoryLocalSchema,
          QuestionLocalSchema
        ],
        directory: dir.path,
      );
    }
    return Future.value(Isar.getInstance());
  }

  // save category
  @override
  Future<void> saveCategory(List<CategoryLocal> listCategoryLocal) async {
    try {
      final isar = await db;
      await isar
          .writeTxn(() async => isar.categoryLocals.putAll(listCategoryLocal));
    } catch (err) {
      return Future.error(Exception(err));
    }
  }

  // get category
  @override
  Future<List<CategoryLocal>> getCategories() async {
    try {
      final isar = await db;
      final dataCategories = await isar.categoryLocals.where().findAll();
      return dataCategories;
    } catch (err) {
      return Future.error(Exception(err));
    }
  }

//   save result quiz
  @override
  Future<void> saveResultQuiz(ResultLocal resultLocal) async {
    try {
      final isar = await db;
      await isar.writeTxn(() async {
        isar.resultLocals.put(resultLocal);
      });
    } catch (err) {
      return Future.error(Exception(err));
    }
  }

  //  save or not question
  @override
  Future<void> toggleSaveQuestion(QuestionLocal questionLocal,String uid) async {
    try {

      final isar = await db;

      final category = await isar.categoryLocals
          .filter()
          .idCategoryEqualTo(questionLocal.idCategory)
          .findFirst();
      final userInfo = await isar.userInfoLocals.filter().uidEqualTo(uid).findFirst();

      if (category == null) {
        return;
      }
      if(userInfo == null){
        return;
      }

      final question = await isar.questionLocals
          .filter()
          .idQuestionEqualTo(questionLocal.idQuestion)
          .findFirst();

      if (question == null) {

        category.questions.add(questionLocal);
        userInfo.questions.add(questionLocal);

        await isar.writeTxn(() async {
          await isar.questionLocals.put(questionLocal);
          await category.questions.save();
          await userInfo.questions.save();
        });
      } else {

        await isar.writeTxn(() async {
          isar.questionLocals.deleteByIdQuestion(questionLocal.idQuestion);
        });

      }
    } catch (err) {
      return Future.error(Exception(err));
    }
  }

  // save question favorite
  @override
  Future<void> saveQuestionFavorite(List<QuestionLocal> questionFavorite,String uid) async{
    try {
      final isar = await db;
      final questions =await isar.questionLocals.where().isEmpty();
      if(questions) {
        final userInfo = await isar.userInfoLocals.filter().uidEqualTo(uid).findFirst();
        if(userInfo == null){
          return;
        }
        for(final question in questionFavorite) {

          final category = await isar.categoryLocals
              .filter()
              .idCategoryEqualTo(question.idCategory)
              .findFirst();
          if (category == null) {
            return;
          }
          category.questions.add(question);
          userInfo.questions.add(question);

          await isar.writeTxn(() async {
            await isar.questionLocals.put(question);
            await category.questions.save();
            await userInfo.questions.save();
          });

          }

      }
    } catch (err) {
      return Future.error(Exception(err));
    }
  }

// //   get category has question
//   @override
//   Future<List<CategoryLocal>> getCategoryHasQuestion() async {
//     try {
//       final isar = await db;
//
//       final dataCategories =
//           await isar.categoryLocals.filter().questionsIsNotEmpty().findAll();
//
//       dataCategories
//           .sort((a, b) => b.questions.length.compareTo(a.questions.length));
//       return dataCategories;
//     } catch (err) {
//       return Future.error(Exception(err));
//     }
//   }

  //  watch category
  @override
  Stream<List<CategoryLocal>> watchCategories() async* {
     final isar =await db;
     Query<CategoryLocal>  categories = isar.categoryLocals.where().build();
     yield* categories.watch(fireImmediately: true);
  }

   //  watch question local
  @override
  Stream<List<QuestionLocal>>  watchQuestionLocal(int idCategory,String uid) async* {
    final isar =await db;
    final userInfo =await isar.userInfoLocals.filter().uidEqualTo(uid).findFirst();
    if(userInfo == null){
      return;
    }
    Query<QuestionLocal> questions = userInfo.questions.filter().idCategoryEqualTo(idCategory).build();
    // Query<QuestionLocal> questions =isar.questionLocals.filter().idCategoryEqualTo(idCategory).build();
    yield* questions.watch(fireImmediately: true);
  }

   // delete question by id
   @override
  Future<void>  deleteQuestion(String idQuestion,int idCategory,String uid) async{
     try {
        final isar =await db;
        final category = await isar.categoryLocals
            .filter()
            .idCategoryEqualTo(idCategory)
            .findFirst();
        if(category == null){
          return;
        }
        final userInfo =await isar.userInfoLocals.filter().uidEqualTo(uid).findFirst();
        if(userInfo == null){
          return;
        }
        // category.questions.removeWhere((element) => element.idQuestion == idQuestion,);
          await isar.writeTxn(() async {
          await isar.questionLocals.deleteByIdQuestion(idQuestion);
          await category.questions.save();
          await userInfo.questions.save();
        });
     } catch (err) {
       return Future.error(Exception(err));
     }
   }

//    delete all question
  @override
  Future<void>  deleteAllQuestionByIdCategory(int idCateGory,String uid)  async {
    try {
      final isar =await db;
      final userInfo =await isar.userInfoLocals.filter().uidEqualTo(uid).findFirst();
      if(userInfo == null){
        return;
      }
      await isar.writeTxn(() async {
        await isar.questionLocals.filter().idCategoryEqualTo(idCateGory).deleteAll();
        await userInfo.questions.save();
      });
    } catch (err) {
      return Future.error(Exception(err));
    }
  }


}
