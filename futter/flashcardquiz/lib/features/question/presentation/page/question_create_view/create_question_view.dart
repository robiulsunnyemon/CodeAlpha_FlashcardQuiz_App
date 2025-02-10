import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/question_model.dart';
import '../../bloc/question_bloc.dart';

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


                final question = QuestionModel(
                    id: 0,  // Or the appropriate id if needed
                    question: 'from android studio',
                    timeLimit: 50,
                    createdAt: DateTime.now(),
                    user: 1,
                    category: 1,
                    choices: []  // Add any choices here if needed
                );


                context.read<QuestionBloc>().add(CreateQuestionsEvent(data: question));
              },
              child: Text('Create Question'),
            ),
          ],
        ),
      ),
    );
  }
}
