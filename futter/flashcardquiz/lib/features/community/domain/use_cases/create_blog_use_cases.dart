import 'package:dartz/dartz.dart';
import 'package:flashcardquiz/core/error/failure.dart';
import 'package:flashcardquiz/features/community/domain/entities/blog_entity.dart';
import 'package:flashcardquiz/features/community/domain/repositories/blog_repository.dart';

class CreateBlogData{
  final BlogRepository repository;
  CreateBlogData(this.repository);


  Future<Either<Failure, BlogEntity>> call(BlogEntity blogs) async {
    return await repository.createBlogData(blogs);
  }


}