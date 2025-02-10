import 'package:flashcardquiz/features/question/data/models/question_model.dart';
import 'package:flashcardquiz/features/question/domain/entities/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/question_bloc.dart';

class QuestionView extends StatefulWidget {
  const QuestionView({super.key});

  @override
  State<QuestionView> createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  final PageController _pageController = PageController(viewportFraction: 1.0);

  void scrollToNextCard() {
    if (_pageController.hasClients) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      context.read<QuestionBloc>().add(AnswerQuestionsEvent(selectedIndex: -1));
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<QuestionBloc>().add(GetQuestionsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Question",style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xff12CBC4),
        actions: [
          IconButton(
              onPressed: (){}, icon: Icon(Icons.logout_sharp,size: 30,color: Colors.white,)
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 400,
            child: BlocBuilder<QuestionBloc, QuestionState>(
              builder: (context, state) {
                if (state is QuestionLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is QuestionLoaded) {
                  return PageView.builder(
                    controller: _pageController,
                    itemCount: state.questions.length,
                    itemBuilder: (context, index) {
                      final question = state.questions[index];

                      return buildQuestionCard(question, state);
                    },
                  );
                } else if (state is QuestionError) {
                  return const Center(child: Text("Error Occurred"));
                } else {
                  return const Center(child: Text("No Data Available"));
                }
              },
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: scrollToNextCard,
            child: const Text("Next Card"),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget buildQuestionCard(Question question, QuestionLoaded state) {
    return SizedBox(
                      width: 350,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                        ),
                        color: const Color(0xff12CBC4),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Q: ${question.question ?? "No Title"}",
                                style: const TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 120,
                                child: ListView.builder(
                                  physics:
                                      const NeverScrollableScrollPhysics(),
                                  itemCount: question.choices.length,
                                  itemBuilder: (context, index) {
                                    final choice = question.choices[index];
                                    print(choice);
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border:
                                            Border.all(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        children: [
                                          const SizedBox(width: 10),
                                          Text("${index+1}. ",
                                              style: const TextStyle(
                                                  fontSize: 16)),
                                          Text(choice.option,
                                              style: const TextStyle(
                                                  fontSize: 16)),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 50,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: question.choices.length,
                                  itemBuilder: (context, index) {
                                    final choice = question.choices[index];

                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: ElevatedButton(
                                        onPressed: state.selectedIndex == -1
                                            ? () {
                                                final answerQuestion =
                                                    AnswerQuestionModel(
                                                        id: 0,
                                                        isCorrect: true,
                                                        score: 0,
                                                        user: 2,
                                                        question:
                                                            choice.question,
                                                        selectedChoice:
                                                            choice.id);

                                                context
                                                    .read<QuestionBloc>()
                                                    .add(AnswerQuestionsEvent(
                                                        selectedIndex: index,
                                                        data:
                                                            answerQuestion));
                                              }
                                            : () {

                                              },

                                        style: ElevatedButton.styleFrom(
                                          shape:
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                side: BorderSide(
                                                  color: Colors.white,
                                                  width: 4
                                                ),


                                              ),
                                          //foregroundColor: state.selectedIndex==index?Colors.limeAccent:Colors.cyan,
                                          backgroundColor:
                                              state.selectedIndex == index
                                                  ? Color(0xff12CBC4)
                                                  : Colors.white,
                                        ),
                                        child: Text("${index+1}",style: TextStyle(color: state.selectedIndex == index
                                            ? Colors.white
                                            : Color(0xff12CBC4),fontSize: 20,fontWeight: FontWeight.bold),),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
  }
}


