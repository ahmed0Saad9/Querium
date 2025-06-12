class QuestionResult {
  final int questionNumber;
  final bool isCorrect;
  final bool isAnswered;
  final int? selectedAnswerIndex; // Track the index of user's selection
  final String? selectedAnswer; // The actual answer text user selected

  QuestionResult({
    required this.questionNumber,
    required this.isCorrect,
    required this.isAnswered,
    this.selectedAnswerIndex,
    this.selectedAnswer,
  });
}
