import '../../domain/entities/question.dart';

class ChoiceModel extends Choice {
  const ChoiceModel({
    required super.id,
    required super.option,
    required super.isCorrect,
    required super.user,
    required super.question,
  });

  factory ChoiceModel.fromJson(Map<String, dynamic> json) {
    return ChoiceModel(
      id: json['id'],
      option: json['option'],
      isCorrect: json['is_correct'],
      user: json['user'],
      question: json['question'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'option': option,
      'is_correct': isCorrect,
      'user': user,
      'question': question,
    };
  }
}

class QuestionModel extends Question {
  const QuestionModel({
    required super.id,
    required super.question,
    required super.timeLimit,
    required super.createdAt,
    required super.user,
    required super.category,
    required super.choices,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'],
      question: json['question'],
      timeLimit: json['time_limit'],
      createdAt: DateTime.parse(json['created_at']),
      user: json['user'],
      category: json['category'],
      choices: (json['choices'] as List<dynamic>)
          .map((choice) => ChoiceModel.fromJson(choice))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'time_limit': timeLimit,
      'user': user,
      'category': category,
    };
  }
}



//new model

// class QuestionModel extends Question {
//   const QuestionModel({
//     required int id,
//     required String question,
//     required int timeLimit,
//     required DateTime createdAt,
//     required int user,
//     required int category,
//     required List<Choice> choices,
//   }) : super(
//     id: id,
//     question: question,
//     timeLimit: timeLimit,
//     createdAt: createdAt,
//     user: user,
//     category: category,
//     choices: choices,
//   );
//
//   Map<String, dynamic> toJson() {
//     return {
//       'question': question,
//       'time_limit': timeLimit,
//       'user': user,
//       'category': category,
//     };
//   }
// }
//
// class ChoiceModel extends Choice {
//   const ChoiceModel({
//     required int id,
//     required String option,
//     required bool isCorrect,
//     required int user,
//     required int question,
//   }) : super(
//     id: id,
//     option: option,
//     isCorrect: isCorrect,
//     user: user,
//     question: question,
//   );
//
//   Map<String, dynamic> toJson() {
//     return {
//       'option': option,
//       'is_correct': isCorrect,
//       'user': user,
//       'question': question,
//     };
//   }
// }
