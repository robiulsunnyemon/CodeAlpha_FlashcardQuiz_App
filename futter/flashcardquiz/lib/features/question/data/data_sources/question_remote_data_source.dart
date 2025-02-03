import 'package:dio/dio.dart';
import '../../../../core/network/api_service.dart';
import '../models/question_model.dart';

class QuestionRemoteDataSource {
  final ApiService apiService;
  QuestionRemoteDataSource(this.apiService);

  Future<List<QuestionModel>> getQuestions() async {
    final response = await apiService.getRequest('questions/');
    return (response.data as List).map((e) => QuestionModel.fromJson(e)).toList();
  }

  Future<QuestionModel> createQuestion(QuestionModel question) async {
    final response = await apiService.postRequest('/question/', question.toJson());
    return QuestionModel.fromJson(response.data);
  }

  Future<QuestionModel> updateQuestion(QuestionModel question) async {
    final response = await apiService.putRequest('/question/${question.id}/', question.toJson());
    return QuestionModel.fromJson(response.data);
  }

  Future<void> deleteQuestion(int id) async {
    await apiService.deleteRequest('/question/$id/');
  }
}
