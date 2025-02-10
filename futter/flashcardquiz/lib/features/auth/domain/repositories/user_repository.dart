import 'package:dartz/dartz.dart';
import 'package:flashcardquiz/core/error/failure.dart';
import 'package:flashcardquiz/features/auth/domain/entities/login_user.dart';
import 'package:flashcardquiz/features/auth/domain/entities/user.dart';
import 'package:flashcardquiz/features/auth/domain/entities/user_details_entity.dart';

abstract class UserRepository {

  Future<Either<Failure,User>> signUp(User user);
  Future<Either<Failure,LoginUser>> login(LoginUser user);
  Future<Either<Failure,UserDetailsEntity>> userDetails(UserDetailsEntity user);

}