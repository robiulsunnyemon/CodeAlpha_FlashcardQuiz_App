import 'package:dartz/dartz.dart';
import 'package:flashcardquiz/features/community/data/data_sources/blog_data_source.dart';
import 'package:flashcardquiz/features/community/data/models/blog_model.dart';
import 'package:flashcardquiz/features/community/domain/entities/blog_entity.dart';
import 'package:flashcardquiz/features/community/domain/repositories/blog_repository.dart';

import '../../../../core/error/failure.dart';

class BlogRepositoryImpl extends BlogRepository {
  final BlogRemoteDataSource blogRemoteDataSource;
  BlogRepositoryImpl(this.blogRemoteDataSource);

  @override
  Future<Either<Failure, BlogEntity>> createBlogData(BlogEntity blog) async {
    try{
      final blogs= await blogRemoteDataSource.createBlogData(blog as BlogModel);
      return Right(blogs);
    }catch(e){
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<BlogEntity>>> getBlogData() async {
    try {
      final blogs = await blogRemoteDataSource.getBlogData();
      return Right(blogs);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
