part of 'blog_bloc.dart';

abstract class BlogState extends Equatable{}

final class BlogInitial extends BlogState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class BlogLoading extends BlogState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

// Loaded State
class BlogLoaded extends BlogState {
  final List<BlogEntity> blogs;
  BlogLoaded({required this.blogs});


  @override
  List<Object> get props => [blogs];
}

// Created State
class BlogCreated extends BlogState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

// Updated State
class BlogUpdated extends BlogState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

// Deleted State
class BlogDeleted extends BlogState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

// Error State
class BlogError extends BlogState {
  final String message;

   BlogError({required this.message});

  @override
  List<Object> get props => [message];
}

