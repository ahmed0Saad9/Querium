import 'package:get/get.dart';
import 'package:querium/src/Features/HomeFeature/Bloc/model/show_answers_model.dart';
import 'package:querium/src/core/constants/color_constants.dart';

class ShowAnswersController extends GetxController {
  List<ShowAnswersModel> answersListCards = [
    const ShowAnswersModel(
      questionNumber: 1,
      questionStatus: AppColors.notAnswered,
    ),
    const ShowAnswersModel(
      questionNumber: 2,
      questionStatus: AppColors.correctAnswer,
    ),
    const ShowAnswersModel(
      questionNumber: 3,
      questionStatus: AppColors.correctAnswer,
    ),
    const ShowAnswersModel(
      questionNumber: 4,
      questionStatus: AppColors.correctAnswer,
    ),
    const ShowAnswersModel(
      questionNumber: 5,
      questionStatus: AppColors.incorrectAnswer,
    ),
    const ShowAnswersModel(
      questionNumber: 6,
      questionStatus: AppColors.correctAnswer,
    ),
    const ShowAnswersModel(
      questionNumber: 7,
      questionStatus: AppColors.incorrectAnswer,
    ),
    const ShowAnswersModel(
      questionNumber: 8,
      questionStatus: AppColors.correctAnswer,
    ),
    const ShowAnswersModel(
      questionNumber: 9,
      questionStatus: AppColors.incorrectAnswer,
    ),
    const ShowAnswersModel(
      questionNumber: 10,
      questionStatus: AppColors.incorrectAnswer,
    ),
  ];
}
