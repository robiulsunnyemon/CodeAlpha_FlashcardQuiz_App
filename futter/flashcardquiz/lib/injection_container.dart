import 'package:flashcardquiz/features/auth/data/data_sources/user_remote_data_source.dart';
import 'package:flashcardquiz/features/auth/data/repositories/user_repo_impl.dart';
import 'package:flashcardquiz/features/auth/domain/use_cases/user_details.dart';
import 'package:flashcardquiz/features/auth/features/signup/bloc/signup_bloc.dart';
import 'package:flashcardquiz/features/auth/features/user_details/bloc/user_details_bloc.dart';
import 'package:flashcardquiz/features/community/data/data_sources/blog_data_source.dart';
import 'package:flashcardquiz/features/community/data/repositories/blog_repository_impl.dart';
import 'package:flashcardquiz/features/community/domain/repositories/blog_repository.dart';
import 'package:flashcardquiz/features/community/domain/use_cases/create_blog_use_cases.dart';
import 'package:flashcardquiz/features/community/domain/use_cases/get_blog_use_cases.dart';
import 'package:flashcardquiz/features/community/presentation/bloc/blog_bloc.dart';
import 'package:flashcardquiz/features/leaderboard/data/data_sources/leader_board_data_source.dart';
import 'package:flashcardquiz/features/leaderboard/domain/repositories/leader_board_repository.dart';
import 'package:flashcardquiz/features/leaderboard/domain/use_cases/get_leader_board.dart';
import 'package:flashcardquiz/features/leaderboard/presentation/bloc/leader_board_bloc.dart';
import 'package:flashcardquiz/features/question/domain/use_cases/create_answer_question.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

// Core
import 'core/network/api_service.dart';

// Question Feature
import 'features/auth/domain/repositories/user_repository.dart';
import 'features/auth/domain/use_cases/log_in.dart';
import 'features/auth/domain/use_cases/sign_up.dart';
import 'features/auth/features/sign_in/bloc/login_bloc.dart';
import 'features/bottom_navbar/presentation/bloc/bottom_navbar_bloc.dart';
import 'features/leaderboard/data/repositories/leader_repository_impl.dart';
import 'features/question/data/data_sources/question_remote_data_source.dart';
import 'features/question/data/repositories/question_repository_impl.dart';
import 'features/question/domain/repositories/question_repository.dart';
import 'features/question/domain/use_cases/create_question.dart';
import 'features/question/domain/use_cases/get_questions.dart';
import 'features/question/domain/use_cases/update_question.dart';
import 'features/question/domain/use_cases/delete_question.dart';
import 'features/question/presentation/bloc/question_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Core
  sl.registerLazySingleton(() => ApiService());



  //! Features - Question

  // Data sources
  sl.registerLazySingleton<QuestionRemoteDataSource>(
    () => QuestionRemoteDataSource(sl()),
  );

  sl.registerLazySingleton<LeaderBoardRemoteDataSource>(
        () => LeaderBoardRemoteDataSource(sl()),
  );

  sl.registerLazySingleton<UserRemoteDataSource>(
          ()=> UserRemoteDataSource(sl())
  );

  sl.registerLazySingleton<BlogRemoteDataSource>(
          ()=> BlogRemoteDataSource(sl())
  );



  // Repositories
  sl.registerLazySingleton<QuestionRepository>(
    () => QuestionRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<LeaderboardRepository>(
        () => LeaderRepositoryImpl(sl()),
  );
  
  sl.registerLazySingleton<UserRepository>(
          ()=>UserRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<BlogRepository>(
        ()=>BlogRepositoryImpl(sl()),
  );


  // Use cases
  sl.registerLazySingleton(() => GetQuestions(sl()));
  sl.registerLazySingleton(() => CreateQuestion(sl()));
  sl.registerLazySingleton(() => UpdateQuestion(sl()));
  sl.registerLazySingleton(() => DeleteQuestion(sl()));
  sl.registerLazySingleton(() => CreateAnswerQuestion(sl()));
  sl.registerLazySingleton(() => GetLeaderBoard(sl()));
  sl.registerLazySingleton(() => SignUp(sl()));
  sl.registerLazySingleton(() => Login(sl()));
  sl.registerLazySingleton(() => GetUserDetails(sl()));
  sl.registerLazySingleton(() => GetBlogData(sl()));
  sl.registerLazySingleton(() => CreateBlogData(sl()));


  // Bloc
  sl.registerFactory(
    () => QuestionBloc(
      getQuestions: sl(),
      createQuestion: sl(),
      updateQuestion: sl(),
      deleteQuestion: sl(),
      createAnswerQuestion: sl()
    ),
  );

  sl.registerFactory(
        () => BottomNavbarBloc(),
  );

  sl.registerFactory(
        () => LeaderBoardBloc(
            getLeaderBoard: sl(),
        ),
  );
  
  sl.registerFactory(
          ()=>SignupBloc(
            signUp: sl()
          ),
  );

  sl.registerFactory(
        ()=>LoginBloc(
        logIn: sl()
    ),
  );

  sl.registerFactory(
        ()=>UserDetailsBloc(
        getUserDetails: sl()
    ),
  );

  sl.registerFactory(
        ()=>BlogBloc(
        getBlogData: sl(),
        createBlogData: sl()
    ),
  );



}

