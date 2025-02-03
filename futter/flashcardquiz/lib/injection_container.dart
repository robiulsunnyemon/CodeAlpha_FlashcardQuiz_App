import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

// Core
import 'core/network/api_service.dart';

// Question Feature
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

  // Repositories
  sl.registerLazySingleton<QuestionRepository>(
    () => QuestionRepositoryImpl(sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetQuestions(sl()));
  sl.registerLazySingleton(() => CreateQuestion(sl()));
  sl.registerLazySingleton(() => UpdateQuestion(sl()));
  sl.registerLazySingleton(() => DeleteQuestion(sl()));

  // Bloc
  sl.registerFactory(
    () => QuestionBloc(
      getQuestions: sl(),
      createQuestion: sl(),
      updateQuestion: sl(),
      deleteQuestion: sl(),
    ),
  );
}

