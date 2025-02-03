import 'package:equatable/equatable.dart';

class Choice extends Equatable {
  final int id;
  final String option;
  final bool isCorrect;
  final int user;
  final int question;

  const Choice({
    required this.id,
    required this.option,
    required this.isCorrect,
    required this.user,
    required this.question,
  });

  @override
  List<Object> get props => [id, option, isCorrect, user, question];
}

class Question extends Equatable {
  final int id;
  final String question;
  final int timeLimit;
  final DateTime createdAt;
  final int user;
  final int category;
  final List<Choice> choices;

  const Question({
    required this.id,
    required this.question,
    required this.timeLimit,
    required this.createdAt,
    required this.user,
    required this.category,
    required this.choices,
  });

  @override
  List<Object> get props => [id, question, timeLimit, createdAt, user, category, choices];
}
