part of 'signup_bloc.dart';

abstract class SignupState extends Equatable {}

class SignupInitial extends SignupState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserCreated extends SignupState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserCreatedError extends SignupState {
  final String message;
  UserCreatedError({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
