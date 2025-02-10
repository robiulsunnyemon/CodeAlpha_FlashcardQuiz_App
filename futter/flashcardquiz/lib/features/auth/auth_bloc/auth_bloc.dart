// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
//
// part 'auth_event.dart';
// part 'auth_state.dart';
//
// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   AuthBloc() : super(AuthInitial()) {
//     on<AuthEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Events
abstract class AuthEvent {}

class CheckAuth extends AuthEvent {}

class LoginUser extends AuthEvent {}

class LogoutUser extends AuthEvent {}

// States
abstract class AuthState {}

class AuthInitial extends AuthState {}

class Authenticated extends AuthState {}

class Unauthenticated extends AuthState {}

// Bloc
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    _checkLoginStatus();

    on<CheckAuth>((event, emit) async {
      await _checkLoginStatus();
    });

    on<LoginUser>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      emit(Authenticated());
    });

    on<LogoutUser>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', false);
      emit(Unauthenticated());
    });
  }

  Future<void> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(Unauthenticated());
    }
  }
}

