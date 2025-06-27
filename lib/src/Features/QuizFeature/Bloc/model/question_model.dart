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
