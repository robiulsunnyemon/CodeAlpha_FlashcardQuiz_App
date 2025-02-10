import 'package:flashcardquiz/core/network/api_service.dart';
import 'package:flashcardquiz/features/auth/data/models/login_user_model.dart';
import 'package:flashcardquiz/features/auth/data/models/user_details_model.dart';
import 'package:flashcardquiz/features/auth/data/models/user_model.dart';

class UserRemoteDataSource{
  final ApiService apiService;
  UserRemoteDataSource(this.apiService);

  Future<UserModel> signUp(UserModel user)async{
    final response=await apiService.postRequest("auth/signup/", user.toJson());
    return UserModel.fromJson(response.data);
  }



  Future<UserDetailsModel> userDetails(UserDetailsModel user)async{
    final response=await apiService.postRequest("user_details/", user.toJson());
    print("user details response code:${response.statusCode} ");
    print("user details response data:${response.data} ");
    return UserDetailsModel.fromJson(response.data);
  }



  Future<LoginUserModel> login(LoginUserModel user)async{
    final response=await apiService.postRequest("auth/login/", user.toJson());
    return LoginUserModel.fromJson(response.data);
  }


}