import 'package:flutter/material.dart';

class ShowAnswersModel {
  final int questionNumber;
  final Color questionStatus;
  final bool isCorrect;
  final bool isAnswered;

  const ShowAnswersModel({
    required this.questionNumber,
    required this.questionStatus,
    required this.isCorrect,
    required this.isAnswered,
  });
}
