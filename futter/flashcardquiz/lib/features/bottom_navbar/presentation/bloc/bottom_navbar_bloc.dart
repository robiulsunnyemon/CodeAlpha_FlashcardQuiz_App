// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
//
// part 'bottom_navbar_event.dart';
// part 'bottom_navbar_state.dart';
//
// class BottomNavbarBloc extends Bloc<BottomNavBarEvent, BottomNavBarState> {
//   BottomNavbarBloc() : super(BottomNavBarState(index: 0)) {
//     on<NavBarItemTapped>((event, emit) {
//
//       (event, emit)async{
//         emit(BottomNavBarState(index: event.index));
//       };
//
//     });
//   }
// }



import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navbar_event.dart';
part 'bottom_navbar_state.dart';

class BottomNavbarBloc extends Bloc<BottomNavBarEvent, BottomNavBarState> {
  BottomNavbarBloc() : super(BottomNavBarState(index: 0)) {
    on<NavBarItemTapped>((event, emit) {
      emit(BottomNavBarState(index: event.index)); // ✅ ঠিক করা হয়েছে
    });
  }
}
