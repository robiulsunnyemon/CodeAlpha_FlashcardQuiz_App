import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flashcardquiz/features/auth/domain/use_cases/sign_up.dart';

import '../../../data/models/user_model.dart';


part 'signup_state.dart';
part 'signup_event.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignUp signUp;
  SignupBloc({required this.signUp}) : super(SignupInitial()) {
    on<CreateUserEvent>((event, emit) async{
      // TODO: implement event handler

      final result= await signUp(event.data);

      result.fold(
          (failure){
            return emit(UserCreatedError(message: failure.toString()));
          },
          (user) {
            return emit(UserCreated());
          },
      );

    });
  }
}
