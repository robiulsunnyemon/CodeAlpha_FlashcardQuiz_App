part of 'question_bloc.dart';


abstract class QuestionState extends Equatable {
  @override
  List<Object> get props => [];
}

// Initial State
class QuestionInitial extends QuestionState {}

// Loading State
class QuestionLoading extends QuestionState {}

// Loaded State
class QuestionLoaded extends QuestionState {
  final List<Question> questions;

  QuestionLoaded(this.questions);

  @override
  List<Object> get props => [questions];
}

// Created State
class QuestionCreated extends QuestionState {}

// Updated State
class QuestionUpdated extends QuestionState {}

// Deleted State
class QuestionDeleted extends QuestionState {}

// Error State
class QuestionError extends QuestionState {
  final String message;

  QuestionError(this.message);

  @override
  List<Object> get props => [message];
}

