// entity/user.dart

import 'package:equatable/equatable.dart';

class LoginUser extends Equatable{
  final String username;
  final String password;

  const LoginUser({
    required this.username,
    required this.password,
  });

  // Map<String, dynamic> toJson() {
  //   return {
  //     "username": username,
  //     "password": password,
  //   };
  // }

  @override
  // TODO: implement props
  List<Object?> get props => [username,password];




}
