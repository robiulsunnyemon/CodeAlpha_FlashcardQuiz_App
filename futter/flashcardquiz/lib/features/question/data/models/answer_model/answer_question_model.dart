// import '../../../domain/entities/answer/question_answer.dart';
//
// class AnswerQuestionModel extends AnswerQuestion {
//   const AnswerQuestionModel({
//     required super.id,
//     required super.isCorrect,
//     required super.score,
//     required super.user,
//     required super.question,
//     required super.selectedChoice,
//   });
//
//   // ✅ Factory method for JSON deserialization
//   factory AnswerQuestionModel.fromJson(Map<String, dynamic> json) {
//     return AnswerQuestionModel(
//       id: json['id'],
//       isCorrect: json['is_correct'],
//       score: json['score'],
//       user: json['user'],
//       question: json['question'],
//       selectedChoice: json['selected_choice'],
//     );
//   }
//
//   // ✅ Method to convert to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       "id": id,
//       "is_correct": isCorrect,
//       "score": score,
//       "user": user,
//       "question": question,
//       "selected_choice": selectedChoice,
//     };
//   }
// }