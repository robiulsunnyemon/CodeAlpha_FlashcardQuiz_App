


import 'package:flashcardquiz/features/auth/features/signup/bloc/signup_bloc.dart';
import 'package:flashcardquiz/features/auth/features/user_details/bloc/user_details_bloc.dart';
import 'package:flashcardquiz/features/community/presentation/bloc/blog_bloc.dart';
import 'package:flashcardquiz/features/leaderboard/presentation/bloc/leader_board_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/routes/routes.dart';
import 'config/routes/routes_name.dart';
import 'features/auth/auth_bloc/auth_bloc.dart';
import 'features/auth/features/sign_in/bloc/login_bloc.dart';
import 'features/auth/features/signup/page/sign_up.dart';
import 'features/auth/features/splash/presentation/bloc/splash_bloc.dart';
import 'features/bottom_navbar/presentation/bloc/bottom_navbar_bloc.dart';
import 'injection_container.dart' as di;
import 'features/question/presentation/bloc/question_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<QuestionBloc>()),
        BlocProvider(create: (context) => BottomNavbarBloc()),
        BlocProvider(create: (context) => di.sl<LeaderBoardBloc>()),
        BlocProvider(create: (context) => di.sl<SignupBloc>()),
        BlocProvider(create: (context) => di.sl<LoginBloc>()),
        BlocProvider(create: (context) => di.sl<UserDetailsBloc>()),
        BlocProvider(create: (context) => di.sl<BlogBloc>()),
        BlocProvider(create: (context) => SplashBloc()..add(StartSplash())),
        BlocProvider(create: (context) => AuthBloc()..add(CheckAuth())),
      ],
      child: MaterialApp(
        title: 'Flutter Clean Architecture',
        theme: ThemeData(primarySwatch: Colors.blue),
        debugShowCheckedModeBanner: false,
        home: RegistrationScreen(),
        initialRoute: RoutesName.blogView,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
