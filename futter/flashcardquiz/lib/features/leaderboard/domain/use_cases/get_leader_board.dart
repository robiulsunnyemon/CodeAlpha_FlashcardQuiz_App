

import 'package:dartz/dartz.dart';
import 'package:flashcardquiz/features/leaderboard/domain/entities/leader_board.dart';
import 'package:flashcardquiz/features/leaderboard/domain/repositories/leader_board_repository.dart';

import '../../../../core/error/failure.dart';

class GetLeaderBoard {
  final LeaderboardRepository repository;
  GetLeaderBoard(this.repository);

  Future<Either<Failure, List<LeaderboardEntry>>> call() async {
    return await repository.getLeaderboard();
  }
}