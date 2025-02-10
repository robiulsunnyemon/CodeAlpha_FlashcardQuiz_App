part of 'leader_board_bloc.dart';


abstract class LeaderBoardState extends Equatable {
  const LeaderBoardState();

  @override
  List<Object> get props => [];
}

// Initial State
class LeaderBoardInitial extends LeaderBoardState {
  const LeaderBoardInitial();
}

// Loading State
class LeaderBoardLoading extends LeaderBoardState {
  const LeaderBoardLoading();
}

// Loaded State
class LeaderBoardLoaded extends LeaderBoardState {
  final List<LeaderboardEntry> leaderBoards;
  final int selectedIndex;

  const LeaderBoardLoaded({
    required this.leaderBoards,
    this.selectedIndex = -1,
  });

  @override
  List<Object> get props => [leaderBoards, selectedIndex];
}


// Error State
class LeaderError extends LeaderBoardState {
  final String message;

  const LeaderError(this.message);

  @override
  List<Object> get props => [message];
}

