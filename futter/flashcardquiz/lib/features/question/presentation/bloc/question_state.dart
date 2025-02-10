part of 'question_bloc.dart';

abstract class QuestionState extends Equatable {
  const QuestionState();

  @override
  List<Object> get props => [];
}

// Initial State
class QuestionInitial extends QuestionState {
  const QuestionInitial();
}

// Loading State
class QuestionLoading extends QuestionState {
  const QuestionLoading();
}

// Loaded State
class QuestionLoaded extends QuestionState {
  final List<Question> questions;
  final int selectedIndex;

  const QuestionLoaded({
    required this.questions,
    this.selectedIndex = -1,
  });

  @override
  List<Object> get props => [questions, selectedIndex];
}

// Created State
class QuestionCreated extends QuestionState {
  const QuestionCreated();
}

// Updated State
class QuestionUpdated extends QuestionState {
  const QuestionUpdated();
}

// Deleted State
class QuestionDeleted extends QuestionState {
  const QuestionDeleted();
}

// Error State
class QuestionError extends QuestionState {
  final String message;

  const QuestionError(this.message);

  @override
  List<Object> get props => [message];
}

// Answer Created State
class QuestionAnswerCreated extends QuestionState {
  const QuestionAnswerCreated();
}
