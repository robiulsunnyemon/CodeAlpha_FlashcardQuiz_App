import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/question.dart';
import '../../domain/repositories/question_repository.dart';
import '../data_sources/question_remote_data_source.dart';
import '../models/question_model.dart';

class QuestionRepositoryImpl implements QuestionRepository {
  final QuestionRemoteDataSource remoteDataSource;
  QuestionRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Question>>> getQuestions() async {
    try {
      final questions = await remoteDataSource.getQuestions();
      return Right(questions);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Question>> createQuestion(Question question) async {
    try {
      final newQuestion = await remoteDataSource.createQuestion(question as QuestionModel);
      return Right(newQuestion);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Question>> updateQuestion(Question question) async {
    try {
      final updatedQuestion = await remoteDataSource.updateQuestion(question as QuestionModel);
      return Right(updatedQuestion);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteQuestion(int id) async {
    try {
      await remoteDataSource.deleteQuestion(id);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
