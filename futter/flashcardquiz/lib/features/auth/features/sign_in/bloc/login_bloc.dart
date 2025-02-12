import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flashcardquiz/config/local_storage/local_storage.dart';
import 'package:meta/meta.dart';

import '../../../data/models/login_user_model.dart';
import '../../../domain/use_cases/log_in.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Login logIn;
  LoginBloc({required this.logIn}) : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());

      final result = await logIn(event.loginData);

      result.fold(
        (failure) {
          return emit(LoginFailure(message: failure.toString()));
        },
        (result) {
          return emit(LoginSuccess());
        },
      );
    });
  }
}
