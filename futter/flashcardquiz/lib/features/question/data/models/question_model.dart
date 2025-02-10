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



class AnswerQuestionModel extends AnswerQuestion {
  const AnswerQuestionModel({
    required super.id,
    required super.isCorrect,
    required super.score,
    required super.user,
    required super.question,
    required super.selectedChoice,
  });

  // ✅ Factory method for JSON deserialization
  factory AnswerQuestionModel.fromJson(Map<String, dynamic> json) {
    return AnswerQuestionModel(
      id: json['id'],
      isCorrect: json['is_correct'],
      score: json['score'],
      user: json['user'],
      question: json['question'],
      selectedChoice: json['selected_choice'],
    );
  }

  // ✅ Method to convert to JSON
  Map<String, dynamic> toJson() {
    return {
      "user": user,
      "question": question,
      "selected_choice": selectedChoice,
    };
  }
}
