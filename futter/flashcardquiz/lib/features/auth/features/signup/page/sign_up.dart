// import 'package:flashcardquiz/features/auth/data/models/user_model.dart';
// import 'package:flashcardquiz/features/auth/signup/bloc/signup_bloc.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class RegistrationScreen extends StatefulWidget {
//   const RegistrationScreen({super.key});
//
//   @override
//   _RegistrationScreenState createState() => _RegistrationScreenState();
// }
//
// class _RegistrationScreenState extends State<RegistrationScreen> {
//   final _formKey = GlobalKey<FormState>();
//
//
//   final TextEditingController  _userNameController=TextEditingController();
//   final TextEditingController  _emailController=TextEditingController();
//   final TextEditingController  _passwordController=TextEditingController();
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor:Color(0xff12CBC4),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(30.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(height: 60),
//               Text(
//                 'Create Account',
//                 style: TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               SizedBox(height: 30),
//               Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       controller:_userNameController,
//                       decoration: InputDecoration(
//                         hintText: 'Username',
//                         prefixIcon: Icon(Icons.person),
//                         border: OutlineInputBorder(
//                               borderSide: BorderSide.none
//                           ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide.none
//                         ),
//                         filled: true,
//                         fillColor: Colors.white
//                       ),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Please enter your username';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 15),
//                     TextFormField(
//                       controller: _emailController,
//                       decoration: InputDecoration(
//                         hintText: 'Email',
//                         prefixIcon: Icon(Icons.email),
//                         border: OutlineInputBorder(
//                               borderSide: BorderSide.none
//                           ),
//                         focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide.none
//                           ),
//                         filled: true,
//                         fillColor: Colors.white
//                       ),
//                       validator: (value) {
//                         if (value!.isEmpty || !value.contains('@')) {
//                           return 'Please enter a valid email';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 15),
//                     TextFormField(
//                       controller: _passwordController,
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         hintText: 'Password',
//                         prefixIcon: Icon(Icons.lock),
//                         border: OutlineInputBorder(
//                               borderSide: BorderSide.none
//                           ),
//                         focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide.none
//                           ),
//                         filled: true,
//                         fillColor: Colors.white
//                       ),
//                       validator: (value) {
//                         if (value!.isEmpty || value.length < 6) {
//                           return 'Password must be at least 6 characters';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 25),
//                     SizedBox(
//                       width: double.infinity,
//                       child: BlocBuilder<SignupBloc,SignupState>(
//                         builder: (context, state) {
//                           return ElevatedButton(
//                             onPressed: () {
//                               if (_formKey.currentState!.validate()) {
//
//                                 final userData=UserModel(
//                                     username: _userNameController.text,
//                                     email: _emailController.text,
//                                     password: _passwordController.text,
//                                     token:""
//                                 );
//
//                                 context.read<SignupBloc>().add(CreateUserEvent(data: userData));
//
//
//                               }
//
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.white,
//                               padding: EdgeInsets.symmetric(vertical: 8,),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                             child: Text(
//                               'Signup',
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color(0xff12CBC4),
//                               ),
//                             ),
//                           );
//                         },
//                       )
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 30),
//               Text(
//                 'Already have an account? Login',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.white,
//                   decoration: TextDecoration.underline,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:flashcardquiz/config/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashcardquiz/features/auth/data/models/user_model.dart';
import 'package:flashcardquiz/features/auth/features/signup/bloc/signup_bloc.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  RegistrationScreenState createState() => RegistrationScreenState();
}

class RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff12CBC4),
      body: BlocListener<SignupBloc, SignupState>(
        listener: (context, state) {
          if (state is UserCreated) {
            // UserCreated state আসলে Login screen-এ navigate করুন
            Navigator.pushReplacementNamed(context, RoutesName.loginView);
          } else if (state is UserCreatedError) {
            // Signup error হলে SnackBar দিয়ে মেসেজ দেখান
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Signup failed. Please try again.'),
            ));
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
                  'Create Account',
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
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
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
                                  final userData = UserModel(
                                    username: _userNameController.text,
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  );

                                  context.read<SignupBloc>().add(CreateUserEvent(data: userData));
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
                                'Signup',
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
                Text(
                  'Already have an account? Login',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
