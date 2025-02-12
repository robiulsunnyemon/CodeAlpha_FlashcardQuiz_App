part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {}

class LoginSubmitted extends LoginEvent {

  final LoginUserModel loginData;

  LoginSubmitted({required this.loginData});


  @override
  // TODO: implement props
  List<Object?> get props => [loginData];

}