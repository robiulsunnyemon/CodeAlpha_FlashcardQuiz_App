

import '../../domain/entities/leader_board.dart';

class LeaderboardModel extends LeaderboardEntry {
  LeaderboardModel({required super.userId, required super.totalScore});

  factory LeaderboardModel.fromJson(Map<String, dynamic> json) {
    return LeaderboardModel(
      userId: json['user'],
      totalScore: json['total_score'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': userId,
      'total_score': totalScore,
    };
  }
}
