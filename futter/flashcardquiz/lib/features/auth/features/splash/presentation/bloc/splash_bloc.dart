
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_event.dart';
part 'splash_state.dart';


// Bloc
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<StartSplash>((event, emit) async {
      await Future.delayed(Duration(seconds: 3)); // ৩ সেকেন্ড অপেক্ষা করবে
      emit(SplashLoaded());
    });
  }
}
