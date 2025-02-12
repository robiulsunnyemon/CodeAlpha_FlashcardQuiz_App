

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/leader_board.dart';
import '../../domain/use_cases/get_leader_board.dart';

part 'leader_board_event.dart';
part 'leader_board_state.dart';

class LeaderBoardBloc extends Bloc<LeaderBoardEvent, LeaderBoardState> {
  final GetLeaderBoard getLeaderBoard;

  LeaderBoardBloc({
    required this.getLeaderBoard
  }) : super(LeaderBoardInitial()) {

    on<GetLeaderEvent>((event, emit) async {
      emit(LeaderBoardLoading());
      final result = await getLeaderBoard();
      result.fold(
            (failure) => emit(LeaderError("Failed to load LeaderBoards")),
            (leaderBoards) => emit(LeaderBoardLoaded(leaderBoards: leaderBoards)),
      );
    });

  }
}


