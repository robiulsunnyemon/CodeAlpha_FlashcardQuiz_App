import '../../domain/entities/user.dart';

class UserModel extends User{
  const UserModel({
    required super.username,
    required super.email,
    super.password,
  });


  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      email: json['email'],
      password: '',
    );
  }


  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "email": email,
      "password": password,
    };
  }

}