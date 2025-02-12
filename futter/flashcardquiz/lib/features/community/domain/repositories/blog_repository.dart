import 'package:dartz/dartz.dart';
import 'package:flashcardquiz/core/error/failure.dart';
import 'package:flashcardquiz/features/community/domain/entities/blog_entity.dart';

abstract class BlogRepository{
  Future<Either<Failure,List<BlogEntity>>> getBlogData();
  Future<Either<Failure,BlogEntity>> createBlogData(BlogEntity blog);
}
