


import 'package:flashcardquiz/features/auth/domain/entities/login_user.dart';

class LoginUserModel extends LoginUser{
  final int userId;
  final String token;

  const LoginUserModel({
    required super.username,
    required super.password,
    required this.userId,
    required this.token,
  });


  factory LoginUserModel.fromJson(Map<String, dynamic> json) {
    return LoginUserModel(
      username: json['username'],
      password: "",
      userId: json['user_id'],
      token: json['token'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": password,
    };
  }

}


