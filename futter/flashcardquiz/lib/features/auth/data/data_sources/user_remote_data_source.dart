import 'package:flashcardquiz/config/local_storage/local_storage.dart';
import 'package:flashcardquiz/core/network/api_service.dart';
import 'package:flashcardquiz/features/auth/data/models/login_user_model.dart';
import 'package:flashcardquiz/features/auth/data/models/user_details_model.dart';
import 'package:flashcardquiz/features/auth/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRemoteDataSource{
  final ApiService apiService;
  UserRemoteDataSource(this.apiService);

  Future<UserModel> signUp(UserModel user)async{
    final response=await apiService.postRequest("auth/signup/", user.toJson());
    return UserModel.fromJson(response.data);
  }



  Future<UserDetailsModel> userDetails(UserDetailsModel user)async{
    final response=await apiService.postRequest("user_details/", user.toJson());
    final data=UserDetailsModel.fromJson(response.data);
    SharedPrefsHelper.setUserDetails(
        firstName: data.firstName,
        lastName: data.lastName,
        country: data.country ??"Null",
        phoneNumber: data.phoneNumber ?? 0
    );

    return UserDetailsModel.fromJson(response.data);
  }



  Future<LoginUserModel> login(LoginUserModel user)async{
    final response=await apiService.postRequest("auth/login/", user.toJson());
    final data=LoginUserModel.fromJson(response.data);
    SharedPrefsHelper.setUserToken(token: data.token,userId: data.userId);
    return LoginUserModel.fromJson(response.data);
  }


}