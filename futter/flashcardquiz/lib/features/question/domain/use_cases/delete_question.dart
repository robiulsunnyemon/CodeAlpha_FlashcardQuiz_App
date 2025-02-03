import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../repositories/question_repository.dart';

class DeleteQuestion {
  final QuestionRepository repository;
  DeleteQuestion(this.repository);

  Future<Either<Failure, void>> call(int id) async {
    return await repository.deleteQuestion(id);
  }
}
