import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/question_bloc.dart';

class CreateQuestionPage extends StatelessWidget {
  CreateQuestionPage({super.key});

  final TextEditingController titleController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Question View')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {

                context.read<QuestionBloc>().add(CreateQuestionsEvent());
              },
              child: Text('Create Question'),
            ),
          ],
        ),
      ),
    );
  }
}
