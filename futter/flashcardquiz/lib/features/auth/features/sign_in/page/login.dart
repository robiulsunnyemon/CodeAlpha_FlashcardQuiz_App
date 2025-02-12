
import 'package:flashcardquiz/config/local_storage/local_storage.dart';
import 'package:flashcardquiz/features/auth/data/models/login_user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/routes/routes_name.dart';
import '../../signup/bloc/signup_bloc.dart';
import '../bloc/login_bloc.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xff12CBC4),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) async {
          if (state is LoginSuccess) {
            final firstName=await SharedPrefsHelper.getFirstName();
            if(context.mounted){
              if(firstName!="null"){
                Navigator.pushReplacementNamed(context, RoutesName.questionView);
              }else{
                Navigator.pushReplacementNamed(context, RoutesName.userDetailsView);
              }
            }

          } else if (state is LoginFailure) {


            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Login failed. Please try again.'),
            ),);
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 60),
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 30),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _userNameController,
                        decoration: InputDecoration(
                          hintText: 'Username',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 25),
                      SizedBox(
                        width: double.infinity,
                        child: BlocBuilder<SignupBloc, SignupState>(
                          builder: (context, state) {
                            return ElevatedButton(
                              onPressed: () {

                                if (_formKey.currentState!.validate()) {
                                  final loginData= LoginUserModel(
                                      username: _userNameController.text.trim(),
                                      password: _passwordController.text.trim(),
                                      token: '',
                                      userId: 1
                                  );

                                  context.read<LoginBloc>().add(LoginSubmitted(loginData: loginData));
                                }


                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(vertical: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff12CBC4),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'If you have not account?',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    TextButton(onPressed: (){
                      Navigator.pushNamed(context, RoutesName.signUpView);
                    }, child: Text("Signup",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


