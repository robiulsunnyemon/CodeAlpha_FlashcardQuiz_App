part of 'question_bloc.dart';

abstract class QuestionEvent extends Equatable{}

class GetQuestionsEvent extends QuestionEvent{
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}


class CreateQuestionsEvent extends QuestionEvent{
  final QuestionModel  data ;
  CreateQuestionsEvent({required this.data});




  @override
  // TODO: implement props
  List<Object?> get props =>[data];
}