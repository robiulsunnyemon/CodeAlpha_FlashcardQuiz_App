import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/question.dart';

abstract class QuestionRepository {
  Future<Either<Failure, List<Question>>> getQuestions();
  Future<Either<Failure, Question>> createQuestion(Question question);
  Future<Either<Failure, Question>> updateQuestion(Question question);
  Future<Either<Failure, void>> deleteQuestion(int id);
}
