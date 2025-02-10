import 'package:dartz/dartz.dart';
import 'package:flashcardquiz/core/error/failure.dart';
import 'package:flashcardquiz/features/auth/domain/entities/login_user.dart';
import 'package:flashcardquiz/features/auth/domain/repositories/user_repository.dart';

import '../entities/user.dart';

class Login {
  final UserRepository repository;
  Login(this.repository);

  Future<Either<Failure, LoginUser>> call(LoginUser user)async{
    return await repository.login(user);
  }

}