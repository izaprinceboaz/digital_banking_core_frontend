
import 'dart:convert';

import 'package:digital_banking_core_frontend/network/network.dart';

class Auth {
  final Network _network = Network();

  Future<Map<String, dynamic>?> RegisterUser( {
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    
    var body = {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'passwordHash': password,
    };

    var response = await _network.postRequest(
        body: body,
        endpoint: '/auth/register'
    );

    if (response != null ){
      return response as Map<String, dynamic>;
    }

    return null;
  }

  Future<Map<String, dynamic>?> SignIn({
    required String email,
    required String password,
  }) async {

    var body = {
      'email': email,
      'passwordHash': password
    };
    
    var response = await _network.postRequest(body: body, endpoint: '/auth/login');

    if (response != null) {
      return response as Map<String, dynamic>;
    }

    return null;
  }
}