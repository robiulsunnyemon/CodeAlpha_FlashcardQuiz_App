import 'package:dartz/dartz.dart';
import 'package:flashcardquiz/features/auth/domain/entities/user_details_entity.dart';
import 'package:flashcardquiz/features/auth/domain/repositories/user_repository.dart';

import '../../../../core/error/failure.dart';

class GetUserDetails{
  final UserRepository repository;
  GetUserDetails(this.repository);

  Future<Either<Failure,UserDetailsEntity>> call(UserDetailsEntity user)async{
    return await repository.userDetails(user);
  }

}