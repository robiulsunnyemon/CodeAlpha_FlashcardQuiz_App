part of 'blog_bloc.dart';

abstract class BlogEvent extends Equatable{}

class GetBlogDataEvent extends BlogEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}


class CreateBlogDataEvent extends BlogEvent{
  final BlogModel blogData;
  CreateBlogDataEvent({required this.blogData});
  @override
  // TODO: implement props
  List<Object?> get props => [blogData];

}
