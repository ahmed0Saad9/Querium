import 'package:get/get.dart';
import 'package:querium/src/Features/QuizzesFeature/Bloc/Model/quizzes_model.dart';

class QuizzesController extends GetxController {
  List<QuizzesModel> quizzes = [
    QuizzesModel(
        subject: 'subject',
        title: 'title',
        date: 'date',
        isApproved: 'Approved')
  ];
}
