import 'package:dartz/dartz.dart';
import 'package:flashcardquiz/features/leaderboard/data/data_sources/leader_board_data_source.dart';
import 'package:flashcardquiz/features/leaderboard/domain/entities/leader_board.dart';
import 'package:flashcardquiz/features/leaderboard/domain/repositories/leader_board_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../question/domain/entities/question.dart';

class LeaderRepositoryImpl implements LeaderboardRepository {
  final LeaderBoardRemoteDataSource remoteDataSource;

  LeaderRepositoryImpl(this.remoteDataSource);



  @override
  Future<Either<Failure, List<LeaderboardEntry>>> getLeaderboard() async {
    try {
      final leaderBoard = await remoteDataSource.getLeaderBoard();
      return Right(leaderBoard);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}