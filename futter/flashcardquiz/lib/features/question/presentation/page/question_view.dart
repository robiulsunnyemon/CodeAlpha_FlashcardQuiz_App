import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/question_bloc.dart';
import 'create_question_view.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Questions')),
      body: BlocBuilder<QuestionBloc, QuestionState>(
        builder: (context, state) {
          if (state is QuestionLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is QuestionLoaded) {
            return ListView.builder(
              itemCount: state.questions.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(state.questions[index].question?? "no title"));
              },
            );
          } else if (state is QuestionError) {
            return Center(child: Text(state.message));
          }
          return Center(child: Text('Press the button to load questions.'));
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<QuestionBloc>().add(GetQuestionsEvent());
            },
            child: Icon(Icons.refresh),
          ),
          SizedBox(width: 20,),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CreateQuestionPage();
              },),);
            },
            child: Icon(Icons.add),
          ),

        ],
      ),
    );
  }
}
