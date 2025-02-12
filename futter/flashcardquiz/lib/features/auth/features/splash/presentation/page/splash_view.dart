import 'package:flashcardquiz/config/local_storage/local_storage.dart';
import 'package:flashcardquiz/config/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) async {
        if (state is SplashLoaded) {
          final token=await SharedPrefsHelper.getToken();
          if (!context.mounted) return;
          if(token!="null"){
            Navigator.pushReplacementNamed(context, RoutesName.bottomNavBar);
          }else{
            Navigator.pushReplacementNamed(context, RoutesName.loginView);
          }
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xff12CBC4),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.flash_on, size: 80, color: Colors.white),
              SizedBox(height: 20),
              Text(
                "FlashCard Quiz",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              CircularProgressIndicator(color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}


