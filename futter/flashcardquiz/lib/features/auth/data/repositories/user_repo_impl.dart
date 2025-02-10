import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flashcardquiz/core/error/failure.dart';
import 'package:flashcardquiz/core/network/api_service.dart';
import 'package:flashcardquiz/features/auth/data/data_sources/user_remote_data_source.dart';
import 'package:flashcardquiz/features/auth/data/models/login_user_model.dart';
import 'package:flashcardquiz/features/auth/data/models/user_details_model.dart';
import 'package:flashcardquiz/features/auth/data/models/user_model.dart';
import 'package:flashcardquiz/features/auth/domain/entities/login_user.dart';
import 'package:flashcardquiz/features/auth/domain/entities/user.dart';
import 'package:flashcardquiz/features/auth/domain/entities/user_details_entity.dart';
import 'package:flashcardquiz/features/auth/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository{
  final UserRemoteDataSource userRemoteDataSource;
  UserRepositoryImpl(this.userRemoteDataSource);



  @override
  Future<Either<Failure, User>> signUp(User user)async {
    try {
      final signUp= await userRemoteDataSource.signUp(user as UserModel);
      return Right(signUp);
    } catch (e) {
      print("Signup Error: $e");
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, LoginUser>> login(LoginUser user) async{
    try{
      final login= await userRemoteDataSource.login(user as LoginUserModel);
      return Right(login);

    }catch(e){
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserDetailsEntity>> userDetails(UserDetailsEntity user)async {
   try{
     final userDetails= await userRemoteDataSource.userDetails(user as UserDetailsModel);
     return Right(userDetails);
   }catch(e){
     return Left(ServerFailure());
   }
  }
  
}