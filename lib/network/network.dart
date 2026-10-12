import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http ;

class Network {
   static const String _baseUrl = 'http://10.0.2.2:8080/api';


   Future<void> saveSession(Map<String, dynamic> data) async {
     final prefs = await SharedPreferences.getInstance();
     await prefs.setString('accessToken', data['accessToken']);
     await prefs.setString('refreshToken', data['refreshToken']);
     await prefs.setString('user', jsonEncode(data['user']));
   }


  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('accessToken');
  }


  Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('accessToken');
    await prefs.remove('refreshToken');
    await prefs.remove('user');
  }

   Future<Map<String, dynamic>?> RegisterUser( {
     required String firstName,
     required String lastName,
     required String email,
     required String phoneNumber,
     required String password,
   }) async {
     var url = Uri.parse('$_baseUrl/auth/register');

     try{
       var response = await http.post(
         url,
         headers: {'Content-Type': 'application/json'},
         body: jsonEncode({
           'firstName': firstName,
           'lastName': lastName,
           'email': email,
           'phoneNumber': phoneNumber,
           'passwordHash': password,
         }),
       );

       if (response.statusCode == 200 || response.statusCode == 201) {
         var data = json.decode(response.body);
         return data;
       } else {
         print('Error ${response.statusCode}: ${response.body}');
         return null;
       }
     } catch(e) {
       print('Error: $e');
     }

   }

   Future<Map<String, dynamic>?> SignIn({
     required String email,
     required String password,
   }) async {
     var url = Uri.parse('$_baseUrl/auth/login');

     try {
       var response = await http.post(
           url,
           headers: {'Content-Type': 'application/json'},
           body: jsonEncode({
             'email': email,
             'passwordHash': password
           })
       );

       if (response.statusCode == 200 || response.statusCode == 201) {
         var data = json.decode(response.body);
         print(data);
         return data;
       } else {
         print('Error ${response.statusCode}: ${response.body}');
         return null;
       }
     } catch(e) {
       print('Error: $e');
     }
   }

   Future<List<dynamic>?> getMyAccounts() async {
     var url = Uri.parse('$_baseUrl/accounts/my-accounts');
     var token = await getToken();

     try {
       var response = await http.get(
         url,
         headers: {
           'Content-Type': 'application/json',
           'Authorization': 'Bearer $token',
         }
       );

       if (response.statusCode == 200) {
         return json.decode(response.body);
       } else {
         print('Error ${response.statusCode}: ${response.body}');
         return null;
       }
     } catch(e) {
       print('Error: $e');
     }
   }
}