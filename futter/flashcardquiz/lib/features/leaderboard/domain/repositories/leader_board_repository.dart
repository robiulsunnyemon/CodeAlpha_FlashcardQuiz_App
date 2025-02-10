import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/leader_board.dart';

abstract class LeaderboardRepository {
  Future<Either<Failure, List<LeaderboardEntry>>> getLeaderboard();
}
