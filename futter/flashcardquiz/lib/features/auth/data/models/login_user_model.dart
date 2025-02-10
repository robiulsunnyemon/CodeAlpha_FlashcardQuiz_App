


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

  /// API Response থেকে JSON ডাটা নিয়ে UserModel তৈরি করবে
  factory LoginUserModel.fromJson(Map<String, dynamic> json) {
    return LoginUserModel(
      username: json['username'],
      password: "", // Password API response-এ আসে না, তাই খালি রাখা হয়েছে
      userId: json['user_id'],
      token: json['token'],
    );
  }

  /// JSON-এ রূপান্তর করবে, যা API-তে পাঠানো হবে
  @override
  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": password,
    };
  }

}


