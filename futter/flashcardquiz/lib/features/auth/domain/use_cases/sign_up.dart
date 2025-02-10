import 'package:dartz/dartz.dart';
import 'package:flashcardquiz/core/error/failure.dart';
import 'package:flashcardquiz/features/auth/domain/repositories/user_repository.dart';

import '../entities/user.dart';

class SignUp {
  final UserRepository repository;
  SignUp(this.repository);

  Future<Either<Failure,User>> call(User user)async{
    return await repository.signUp(user);
  }

}