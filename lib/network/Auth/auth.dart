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

  Future<bool> logout() async {

    var refreshToken = await _network.getRefreshToken();
    if (refreshToken == null) return false;

    var body = {
      'refreshToken': refreshToken,
    };

    var response = await _network.postRequest(body: body, endpoint: '/auth/logout');

    return response != null;
  }

  Future<bool> updatePassword({
    required String currentPassword,
    required String newPassword,
  }) async {

    var body = {
      'currentPassword': currentPassword,
      'newPassword': newPassword,
    };

    var response = await _network.postRequest(body: body, endpoint: '/auth/update-password');

    return response != null;
  }
}