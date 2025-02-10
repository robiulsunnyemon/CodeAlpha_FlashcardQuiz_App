import 'package:equatable/equatable.dart';
import 'package:flashcardquiz/features/question/domain/use_cases/create_answer_question.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/question_model.dart';
import '../../domain/entities/question.dart';
import '../../domain/use_cases/create_question.dart';
import '../../domain/use_cases/delete_question.dart';
import '../../domain/use_cases/get_questions.dart';
import '../../domain/use_cases/update_question.dart';

part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  final GetQuestions getQuestions;
  final CreateQuestion createQuestion;
  final UpdateQuestion updateQuestion;
  final DeleteQuestion deleteQuestion;
  final CreateAnswerQuestion createAnswerQuestion;

  QuestionBloc({
    required this.getQuestions,
    required this.createQuestion,
    required this.updateQuestion,
    required this.deleteQuestion,
    required this.createAnswerQuestion,
  }) : super(QuestionInitial()) {

    on<GetQuestionsEvent>((event, emit) async {
      emit(QuestionLoading());
      final result = await getQuestions();
      result.fold(
            (failure) => emit(QuestionError("Failed to load questions")),
            (questions) => emit(QuestionLoaded(questions: questions, selectedIndex: -1)),
      );
    });

    on<CreateQuestionsEvent>((event, emit) async {
      emit(QuestionLoading());
      final result = await createQuestion(event.data);
      result.fold(
            (failure) => emit(QuestionError("Failed to create question")),
            (question) => emit(QuestionCreated()),
      );
    });

    on<AnswerQuestionsEvent>((event, emit) async {
      if (state is QuestionLoaded) {
        final currentState = state as QuestionLoaded;

        // **1️⃣ প্রথমে selectedIndex আপডেট করি**
        emit(QuestionLoaded(
          questions: currentState.questions,
          selectedIndex: event.selectedIndex,
        ));

        // **2️⃣ যদি data থাকে, তাহলে API call করি**
        if (event.data != null) {
          final result = await createAnswerQuestion(event.data!);
          result.fold(
                (failure) => emit(QuestionError("Failed to create answer")),
                (questionAnswer) => emit(QuestionAnswerCreated()),
          );

          // **3️⃣ API call এর পর আবার selectedIndex ঠিক করি**
          emit(QuestionLoaded(
            questions: currentState.questions,
            selectedIndex: event.selectedIndex,
          ));
        }
      }
    });
  }
}


//
// import 'package:equatable/equatable.dart';
// import 'package:flashcardquiz/features/question/domain/use_cases/create_answer_question.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../data/models/question_model.dart';
// import '../../domain/entities/question.dart';
// import '../../domain/use_cases/create_question.dart';
// import '../../domain/use_cases/delete_question.dart';
// import '../../domain/use_cases/get_questions.dart';
// import '../../domain/use_cases/update_question.dart';
//
// part 'question_event.dart';
// part 'question_state.dart';
//
// class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
//   final GetQuestions getQuestions;
//   final CreateQuestion createQuestion;
//   final UpdateQuestion updateQuestion;
//   final DeleteQuestion deleteQuestion;
//   final CreateAnswerQuestion createAnswerQuestion;
//
//   QuestionBloc({
//     required this.getQuestions,
//     required this.createQuestion,
//     required this.updateQuestion,
//     required this.deleteQuestion,
//     required this.createAnswerQuestion,
//   }) : super(QuestionInitial()) {
//
//     on<GetQuestionsEvent>((event, emit) async {
//       emit(QuestionLoading());
//       final result = await getQuestions();
//       result.fold(
//             (failure) => emit(QuestionError("Failed to load questions")),
//             (questions) => emit(QuestionLoaded(questions: questions, selectedIndex: -1, isAnswered: false)),
//       );
//     });
//
//     on<CreateQuestionsEvent>((event, emit) async {
//       emit(QuestionLoading());
//       final result = await createQuestion(event.data);
//       result.fold(
//             (failure) => emit(QuestionError("Failed to create question")),
//             (question) => emit(QuestionCreated()),
//       );
//     });
//
//     on<AnswerQuestionsEvent>((event, emit) async {
//       if (state is QuestionLoaded) {
//         final currentState = state as QuestionLoaded;
//
//         // যদি আগেই উত্তর দেওয়া হয়ে থাকে, তাহলে নতুন করে কিছু করবো না
//         if (currentState.isAnswered) return;
//
//         emit(currentState.copyWith(
//           selectedIndex: event.selectedIndex,
//           isAnswered: true,
//         ));
//
//         if (event.data != null) {
//           final result = await createAnswerQuestion(event.data!);
//           result.fold(
//                 (failure) => emit(QuestionError("Failed to create answer")),
//                 (questionAnswer) => emit(QuestionAnswerCreated()),
//           );
//         }
//       }
//     });
//   }
// }
