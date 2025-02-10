
import 'package:equatable/equatable.dart';
import 'package:flashcardquiz/features/auth/data/models/login_user_model.dart';
import 'package:flashcardquiz/features/auth/domain/repositories/user_repository.dart';
import 'package:flashcardquiz/features/auth/domain/use_cases/log_in.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginEvent extends Equatable {}

class LoginSubmitted extends LoginEvent {

  final LoginUserModel loginData;

  LoginSubmitted({required this.loginData});


  @override
  // TODO: implement props
  List<Object?> get props => [loginData];

}

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

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Login logIn;
  LoginBloc({required this.logIn}) : super(LoginInitial()) {

    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());
      
      final result = await logIn(event.loginData);
      print("result");
      print(result);

      result.fold(
            (failure) {
              print("Login failed: ${failure.toString()}");
              return emit(LoginFailure( message: failure.toString()));
            },
            (user) {
              print("Login successful: $user");
              return emit(LoginSuccess());
            },
      );

    });
  }
}
