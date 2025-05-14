import 'package:get/get.dart';
import 'package:querium/src/Features/QuizzesFeature/Bloc/Model/quizzes_model.dart';

import '../Model/quizzes_category_model.dart';

class QuizzesController extends GetxController {
  List<QuizzesModel> quizzes = [
    const QuizzesModel(
      title: 'title',
      isApproved: false,
      isPending: true,
    ),
    const QuizzesModel(
      title: 'title',
      isApproved: false,
      isPending: false,
    ),
    const QuizzesModel(
      title: 'title',
      isApproved: true,
      isPending: false,
    ),
  ];
}
