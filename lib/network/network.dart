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

   Future<dynamic> getRequest(String endpoint) async {

     var url = Uri.parse('$_baseUrl$endpoint');
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
       return null;
     }
   }

   Future<dynamic> postRequest({
     required dynamic body,
     required String endpoint,
   }) async {

     var url = Uri.parse('$_baseUrl$endpoint');
     var token = Network().getToken();

     try {
       var response = await http.post(
         url,
         headers: {
           'Content-Type': 'application/json',
           if (token != null ) 'Authorizarion' : 'Bearer $token'
         },
         body: jsonEncode(body),
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
      return null;
     }
   }

   Future<dynamic> patchRequest({
     required dynamic body,
     required String endpoint,
   }) async {

     var url = Uri.parse('$_baseUrl$endpoint');
     var token = Network().getToken();

     try {
       var response = await http.patch(
         url,
         headers: {
           'Content-Type': 'application/json',
           if (token != null ) 'Authorizarion' : 'Bearer $token'
         },
         body: body == null ? null : jsonEncode(body),
       );
       if (response.statusCode == 200 || response.statusCode == 201) {
         return response.body.isEmpty ? true : json.decode(response.body);
       } else {
         print('Error ${response.statusCode}: ${response.body}');
         return null;
       }
     } catch(e) {
       print('Error: $e');
       return null;
     }
   }

   Future<dynamic> deleteRequest(String endpoint) async {
     var url = Uri.parse('$_baseUrl$endpoint');
     var token = await getToken();

     try {
       var response = await http.delete(
         url,
         headers: {
           'Content-Type': 'application/json',
           if (token != null) 'Authorization': 'Bearer $token',
         },
       );

       if (response.statusCode == 200 || response.statusCode == 204) {
         return response.body.isEmpty ? true : json.decode(response.body);
       } else {
         print('Error ${response.statusCode}: ${response.body}');
         return null;
       }
     } catch (e) {
       print('Error: $e');
       return null;
     }
   }
}