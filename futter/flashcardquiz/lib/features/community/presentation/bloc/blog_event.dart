part of 'blog_bloc.dart';

abstract class BlogEvent extends Equatable{}

class GetBlogData extends BlogEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}


class CreateBlogData extends BlogEvent{
  final BlogModel blogData;
  CreateBlogData({required this.blogData});
  @override
  // TODO: implement props
  List<Object?> get props => [blogData];

}
