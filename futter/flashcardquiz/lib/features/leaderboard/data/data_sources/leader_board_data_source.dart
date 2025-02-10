import 'package:flashcardquiz/features/leaderboard/data/models/leader_board_model.dart';

import '../../../../core/network/api_service.dart';

class LeaderBoardRemoteDataSource {
  final ApiService apiService;
  LeaderBoardRemoteDataSource(this.apiService);

  Future<List<LeaderboardModel>> getLeaderBoard() async {
    final response = await apiService.getRequest('student_leaderboard/');
    return (response.data as List).map((e) => LeaderboardModel.fromJson(e)).toList();
  }


}
