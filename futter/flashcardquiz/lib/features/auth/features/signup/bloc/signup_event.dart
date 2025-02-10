part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {}

class CreateUserEvent extends SignupEvent{
  final UserModel data;
  CreateUserEvent({required this.data});
  @override
  // TODO: implement props
  List<Object?> get props => [data];

}
