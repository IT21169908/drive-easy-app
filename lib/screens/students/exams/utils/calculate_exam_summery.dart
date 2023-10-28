import 'package:flutter/foundation.dart';

Map<String, double> calculatePercentages(List answeredQuestions) {
  int totalQuestions = answeredQuestions.length;
  int correctAnswers = answeredQuestions.where((question) {
    return question.containsKey('given_answer') && question['given_answer'] == question['correct_option_id'];
  }).length;
  int incorrectAnswers = totalQuestions - correctAnswers;

  double correctPercentage = (correctAnswers / totalQuestions) * 100;
  double incorrectPercentage = (incorrectAnswers / totalQuestions) * 100;

  if (kDebugMode) {
    print('Correct Answers: $correctAnswers out of $totalQuestions');
    print('Correct Percentage: $correctPercentage%');

    print('Incorrect Answers: $incorrectAnswers out of $totalQuestions');
    print('Incorrect Percentage: $incorrectPercentage%');
  }

  return {
    "totalQuestions": double.parse(totalQuestions.toString()),
    "correctAnswers": double.parse(correctAnswers.toString()),
    "incorrectAnswers": double.parse(incorrectAnswers.toString()),
    "correctPercentage": correctPercentage,
    "incorrectPercentage": incorrectPercentage,
  };
}
