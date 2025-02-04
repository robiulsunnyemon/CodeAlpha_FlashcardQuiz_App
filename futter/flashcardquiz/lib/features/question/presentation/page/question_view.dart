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
                final question = state.questions[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          "Q${index + 1}: ${question.question}",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),


                        SizedBox(
                          height: 120,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(), // Parent এর সাথে স্ক্রল করবে
                            itemCount: question.choices.length,
                            itemBuilder: (context, i) {
                              final choice = question.choices[i];
                              return Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      choice.isCorrect
                                          ? Icons.check_circle
                                          : Icons.radio_button_unchecked,
                                      color: choice.isCorrect ? Colors.green : Colors.grey,
                                    ),
                                    SizedBox(width: 10),
                                    Text(choice.option, style: TextStyle(fontSize: 16)),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
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
          SizedBox(width: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return CreateQuestionPage();
                },
              ));
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}






//
// class QuestionPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Questions")),
//       body: BlocBuilder<QuestionBloc, QuestionState>(
//         builder: (context, state) {
//           if (state is QuestionLoading) {
//             return Center(child: CircularProgressIndicator());
//           } else if (state is QuestionLoaded) {
//             return ListView.builder(
//               itemCount: state.questions.length,
//               itemBuilder: (context, index) {
//                 final question = state.questions[index];
//                 return Card(
//                   margin: EdgeInsets.all(10),
//                   child: Padding(
//                     padding: EdgeInsets.all(10),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           question.question,
//                           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(height: 10),
//                         // 🔥 Choice গুলো দেখানোর জন্য ListView.builder()
//                         ...question.choices.map((choice) {
//                           return ListTile(
//                             title: Text(choice.option),
//                             leading: Icon(
//                               choice.isCorrect ? Icons.check_circle : Icons.radio_button_unchecked,
//                               color: choice.isCorrect ? Colors.green : Colors.grey,
//                             ),
//                           );
//                         }).toList(),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             );
//           } else if (state is QuestionError) {
//             return Center(child: Text("Error loading questions"));
//           }
//           return Container();
//         },
//       ),
//     );
//   }
// }



