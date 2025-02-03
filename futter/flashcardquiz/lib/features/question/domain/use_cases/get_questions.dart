import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/question.dart';
import '../repositories/question_repository.dart';

class GetQuestions {
  final QuestionRepository repository;
  GetQuestions(this.repository);

  Future<Either<Failure, List<Question>>> call() async {
    return await repository.getQuestions();
  }
}
