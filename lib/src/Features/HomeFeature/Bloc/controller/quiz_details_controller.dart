import 'package:get/get.dart';

class QuizDetailsController extends GetxController {
  String questionType = 'True&false';

  void changeQuestionType(String question) {
    questionType = question;
    update(); // To refresh the UI
  }
}
