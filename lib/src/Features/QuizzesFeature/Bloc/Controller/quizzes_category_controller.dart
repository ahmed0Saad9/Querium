import 'package:get/get.dart';
import 'package:querium/src/Features/QuizzesFeature/Bloc/Model/quizzes_category_model.dart';

class QuizzesCategoryController extends GetxController {
  int tapIdSelected = 1;

  void selectTapId(int id) {
    tapIdSelected = id;
    update();
  }

  List<QuizzesCategoryModel> quizzesCategory = [
    QuizzesCategoryModel(title: 'All', id: 1),
    QuizzesCategoryModel(title: 'Approved', id: 2),
    QuizzesCategoryModel(title: 'Rejected', id: 3),
    QuizzesCategoryModel(title: 'Pending', id: 4),
  ];
}
