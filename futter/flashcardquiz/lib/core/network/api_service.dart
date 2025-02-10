
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(
      BaseOptions(
        baseUrl: 'http://192.168.0.110:8000/api/',
        headers: {
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer YOUR_TOKEN', // যদি Auth token লাগে
        },
      ),
  );

  Future<Response> getRequest(String endpoint) async {
    return await _dio.get(endpoint);
  }

  Future<Response> postRequest(String endpoint, Map<String, dynamic> data) async {
    return await _dio.post(endpoint, data: data);
  }

  Future<Response> putRequest(String endpoint, Map<String, dynamic> data) async {
    return await _dio.put(endpoint, data: data);
  }

  Future<Response> deleteRequest(String endpoint) async {
    return await _dio.delete(endpoint);
  }
}
