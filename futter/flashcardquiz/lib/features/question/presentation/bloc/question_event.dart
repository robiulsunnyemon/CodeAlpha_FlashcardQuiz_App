part of 'question_bloc.dart';

abstract class QuestionEvent extends Equatable{}

class GetQuestionsEvent extends QuestionEvent{
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}


class CreateQuestionsEvent extends QuestionEvent{

  dynamic data;




  @override
  // TODO: implement props
  List<Object?> get props =>[data];
}