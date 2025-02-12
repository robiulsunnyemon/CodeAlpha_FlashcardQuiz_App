part of 'login_bloc.dart';

abstract class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginLoading extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginSuccess extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginFailure extends LoginState {
  final String message;
  LoginFailure({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}