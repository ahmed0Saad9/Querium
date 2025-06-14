class CustomQuizQuestions {
  final int id;
  final int uploadId;
  final String questionText;
  final String questionCorrectAnswer;
  final List<String> answers;
  final String status;

  CustomQuizQuestions({
    required this.id,
    required this.uploadId,
    required this.questionText,
    required this.questionCorrectAnswer,
    required this.answers,
    required this.status,
  });

  factory CustomQuizQuestions.fromJson(Map<String, dynamic> json) {
    return CustomQuizQuestions(
      id: json['id'],
      uploadId: json['uploadId'],
      questionText: json['questionText'],
      questionCorrectAnswer: json['questionCorrectAnswer'],
      answers: List<String>.from(json['answers']),
      status: json['status'],
    );
  }
}
