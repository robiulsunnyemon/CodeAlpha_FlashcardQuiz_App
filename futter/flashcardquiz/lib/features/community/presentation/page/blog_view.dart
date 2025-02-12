import 'package:flashcardquiz/features/community/presentation/bloc/blog_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogView extends StatefulWidget {
  const BlogView({super.key});

  @override
  State<BlogView> createState() => _BlogViewState();
}

class _BlogViewState extends State<BlogView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<BlogBloc>().add(GetBlogDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Community"),
        ),
        body: BlocBuilder<BlogBloc, BlogState>(
          builder: (context, state) {
            if (state is BlogLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is BlogLoaded) {
              return ListView.builder(
                itemCount: state.blogs.length,
                itemBuilder: (context, index) {
                  final blog=state.blogs[index];
                  return Card(
                    child: Column(
                      children: [
                        Text(blog.title),
                        Text(blog.content),
                        Image.network(blog.image ?? ""),
                        Text(blog.userId.toString()),
                      ],
                    ),
                  );
                },
              );
            }else if(state is BlogError){
              return Center(
                child: Text(state.message),
              );
            }else{
              return Container();
            }
          },
        ));
  }
}
