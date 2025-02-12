
import 'package:flashcardquiz/core/network/api_service.dart';
import 'package:flashcardquiz/features/community/data/models/blog_model.dart';

class BlogRemoteDataSource{
  final ApiService apiService;
  BlogRemoteDataSource(this.apiService);
  
  Future<List<BlogModel>> getBlogData() async {
    final response = await apiService.getRequest('blogs/');
    return(response.data as List).map((e) => BlogModel.fromJson(e)).toList();

  }

  Future<BlogModel> createBlogData(BlogModel blog) async {
    final response = await apiService.postRequest('blogs/', blog.toJson());
    return BlogModel.fromJson(response.data);
  }
  
}