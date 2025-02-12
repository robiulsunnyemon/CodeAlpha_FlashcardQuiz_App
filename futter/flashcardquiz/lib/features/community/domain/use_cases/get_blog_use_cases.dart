import 'package:dartz/dartz.dart';
import 'package:flashcardquiz/core/error/failure.dart';
import 'package:flashcardquiz/features/community/domain/entities/blog_entity.dart';
import 'package:flashcardquiz/features/community/domain/repositories/blog_repository.dart';


class GetBlogData {
  final BlogRepository repository;
  GetBlogData(this.repository);

  Future<Either<Failure, List<BlogEntity>>> call() async {
    return await repository.getBlogData();
  }
}
