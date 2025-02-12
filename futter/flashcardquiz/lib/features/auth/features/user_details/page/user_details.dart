
import 'package:flashcardquiz/config/local_storage/local_storage.dart';
import 'package:flashcardquiz/features/auth/data/models/user_details_model.dart';
import 'package:flashcardquiz/features/auth/features/user_details/bloc/user_details_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/routes/routes_name.dart';
import '../../../data/models/user_model.dart';
import '../../signup/bloc/signup_bloc.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  UserDetailsScreenState createState() => UserDetailsScreenState();
}

class UserDetailsScreenState extends State<UserDetails> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firsName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _country = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff12CBC4),
      body: BlocListener<UserDetailsBloc, UserDetailsState>(
        listener: (context, state) {
          if (state is UserDetailsCreated) {

            Navigator.pushReplacementNamed(context, RoutesName.questionView);
          } else if (state is UserDetailsCreatedError) {


            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('UserDetails failed. Please try again.'),
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
                  'Update Account',
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
                        controller: _firsName,
                        decoration: InputDecoration(
                          hintText: 'First Name',
                          prefixIcon: Icon(Icons.text_fields_sharp),
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your First Name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: _lastName,
                        decoration: InputDecoration(
                          hintText: 'Last Name',
                          prefixIcon: Icon(Icons.text_fields_sharp),
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: (value) {
                          if (value!.isEmpty ) {
                            return 'Please enter a Last Name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: _country,
                        decoration: InputDecoration(
                          hintText: 'Country',
                          prefixIcon: Icon(Icons.text_fields_sharp),
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Country';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: _phoneNumber,
                        decoration: InputDecoration(
                          hintText: 'Phone Number',
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Phone Number';
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
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  final userId = await SharedPrefsHelper.getUserId();

                                  if (!context.mounted) return;

                                  final data = UserDetailsModel(
                                    id: 1,
                                    userId: userId,
                                    firstName: _firsName.text,
                                    lastName: _lastName.text,
                                    country: _country.text,
                                    phoneNumber: int.tryParse(_phoneNumber.text) ?? 0,
                                  );

                                  context.read<UserDetailsBloc>().add(CreateUserDetailsEvent(data: data));
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
                                'Next',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
