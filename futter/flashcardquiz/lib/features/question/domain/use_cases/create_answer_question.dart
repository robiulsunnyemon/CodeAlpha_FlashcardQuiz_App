import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../repositories/question_repository.dart';
import '../entities/question.dart';


class CreateAnswerQuestion {
  final QuestionRepository repository;
  CreateAnswerQuestion(this.repository);

  Future<Either<Failure, AnswerQuestion>> call(AnswerQuestion answerQuestion) async {
    return await repository.createAnswerQuestion(answerQuestion);
  }
}