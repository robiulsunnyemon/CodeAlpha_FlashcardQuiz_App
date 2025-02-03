import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/question.dart';
import '../repositories/question_repository.dart';

class UpdateQuestion {
  final QuestionRepository repository;
  UpdateQuestion(this.repository);

  Future<Either<Failure, Question>> call(Question question) async {
    return await repository.updateQuestion(question);
  }
}
