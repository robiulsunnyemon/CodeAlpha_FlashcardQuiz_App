import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static setUserDetails({
    required String firstName,
    required String lastName,
    required String country,
    required int phoneNumber,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('firstName', firstName);
    await prefs.setString('lastName', lastName);
    await prefs.setString('country', country);
    await prefs.setInt('phoneNumber', phoneNumber);
  }



  static setUserToken({required String token, required int userId}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setInt('user_id', userId);
  }

  static Future<int> getUserId()async{
    final prefs = await SharedPreferences.getInstance();
    final int? userId = prefs.getInt('user_id');
    return userId!;
  }

  static Future<String> getToken()async{
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    return token ?? "null";
  }

  static Future<String> getFirstName()async{
    final prefs = await SharedPreferences.getInstance();
    final String? firstName = prefs.getString('firstName');
    return firstName ?? "null";
  }


}
