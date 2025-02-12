import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flashcardquiz/config/local_storage/local_storage.dart';
import 'package:flashcardquiz/features/auth/data/models/user_details_model.dart';
import 'package:flashcardquiz/features/auth/domain/use_cases/user_details.dart';

part 'user_details_event.dart';
part 'user_details_state.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  final GetUserDetails getUserDetails;
  UserDetailsBloc({required this.getUserDetails}) : super(UserDetailsInitial()) {
    on<CreateUserDetailsEvent>((event, emit) async{

      final result=await getUserDetails(event.data);


      result.fold(
          (failure){
            emit(UserDetailsCreatedError(message: failure.toString()));
          },
          (user){

            emit(UserDetailsCreated());
          }
      );

    });
  }
}
