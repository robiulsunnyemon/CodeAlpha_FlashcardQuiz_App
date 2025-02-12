

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/blog_model.dart';
import '../../domain/entities/blog_entity.dart';
import '../../domain/use_cases/create_blog_use_cases.dart';
import '../../domain/use_cases/get_blog_use_cases.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final CreateBlogData createBlogData;
  final GetBlogData getBlogData;

  BlogBloc({
    required this.getBlogData,
    required this.createBlogData,
  }) : super(BlogInitial()) {

    on<GetBlogData>((event, emit) async {
      emit(BlogLoading());

      final result = await getBlogData();

      result.fold(
            (failure) => emit(BlogError(message: failure.toString())),
            (blogs) => emit(BlogLoaded(blogs: blogs)),
      );
    });
  }
}
