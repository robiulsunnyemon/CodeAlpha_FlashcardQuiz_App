import 'package:flashcardquiz/features/question/data/models/question_model.dart';
import 'package:flashcardquiz/features/question/domain/use_cases/create_question.dart';
import 'package:flashcardquiz/features/question/domain/use_cases/delete_question.dart';
import 'package:flashcardquiz/features/question/domain/use_cases/update_question.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/question.dart';
import '../../domain/use_cases/get_questions.dart';

part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  //final QuestionRepository repository;
  final GetQuestions getQuestions;
  final CreateQuestion createQuestion;
  final UpdateQuestion updateQuestion;
  final DeleteQuestion deleteQuestion;

  QuestionBloc({required this.getQuestions,
    required this.createQuestion,
    required this.updateQuestion,
    required this.deleteQuestion})
      : super(QuestionInitial()) {
    on<GetQuestionsEvent>(
          (event, emit) async {
        emit(QuestionLoading());
        //final result = await repository.getQuestions();
        final result = await getQuestions();
        result.fold(
              (failure) => emit(QuestionError("Failed to load questions")),
              (questions) => emit(QuestionLoaded(questions)),
        );
      },
    );


    on<CreateQuestionsEvent>((event, emit) async {
      emit(QuestionLoading());
      final result = await createQuestion(event.data);
      print("result");
      print(result);
      result.fold(
            (failure) => emit(QuestionError("Failed to create question")),
            (question) => emit(QuestionCreated()),
      );
    }

    );
  }
}
