import 'package:equatable/equatable.dart';

class User extends Equatable{
  final String username;
  final String email;
  final String password;

  // Constructor to initialize the User object
  const User({
    required this.username,
    required this.email,
    this.password='',
  });

  @override
  // TODO: implement props
  List<Object?> get props => [username,email,password];


}