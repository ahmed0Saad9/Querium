// class QuestionsModel {
//   QuestionsModel({
//     required this.success,
//     required this.count,
//     required this.questions,
//   });
//
//   late final bool success;
//   late final int count;
//   late final List<Questions> questions;
//
//   QuestionsModel.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     count = json['count'];
//     questions =
//         List.from(json['questions']).map((e) => Questions.fromJson(e)).toList();
//   }
// }

class Questions {
  Questions({
    required this.id,
    required this.questionText,
    required this.answers,
    required this.correctAnswer,
  });

  late final int id;
  late final String questionText;
  late final List<String> answers;
  late final String correctAnswer;

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionText = json['questionText'];
    answers = List<String>.from(json['answers']);
    correctAnswer = json['correctAnswer'];
  }
}

// class Answers {
//   Answers({required this.answers});
//
//   late final List<String> answers;
//
//   Answers.fromJson(Map<String, dynamic> json) {
//     answers = List<String>.from(json['answers']);
//   }
// }
