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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Community"),
      ),
      body: Column(
        children: [
          TextButton(
              child: const Text("Get blog Data"),
            onPressed: (){
                context.read<BlogBloc>().add(GetBlogData());
            },
          )
        ],
      ),
    );
  }
}
