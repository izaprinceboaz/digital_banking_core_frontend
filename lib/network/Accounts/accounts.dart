import 'package:digital_banking_core_frontend/network/network.dart';

class Accounts {
  final Network _network = Network();

  Future<List<dynamic>?> getMyAccounts() async {
    var response = await _network.getRequest('/accounts/my-accounts');

    if (response != null) {
      return response as List<dynamic>;
    }

    return null;
  }

  Future<Map<String, dynamic>?> getAccount({
    required String accountNumber
  }) async {
    var response = await _network.getRequest('/accounts/$accountNumber');

    if (response != null) {
      return response as Map<String, dynamic>;
    }
    return null;
  }

  Future<Map<String, dynamic>?> createAccount({
    required String accountType,
    required String currency,
    required num balance,
  }) async {
    var body = {
      'accountType': accountType,
      'currency': currency,
      'balance': balance,
    };

    var response = await _network.postRequest(
        body: body, endpoint: '/accounts/create');

    if (response != null) {
      return response as Map<String, dynamic>;
    }
    return null;
  }

  Future<Map<String, dynamic>?> updateBalance({
    required String accountNumber,
    required num newBalance,
  }) async {

    var response = await _network.postRequest(
        body: newBalance, endpoint: '/accounts/$accountNumber/update-balance');

    if (response != null) {
      return response as Map<String, dynamic>;
    }
    return null;
  }

  Future<List<dynamic>?> getMyStatements({
    required String accountNumber
  }) async {

    var response = await _network.getRequest('/statements/my-statements/$accountNumber');

    if ( response != null ) {
      return response as List<dynamic>;
    }
    return null;
  }


  Future<Map<String, dynamic>?> debit({
    required String accountNumber,
    required num amount,
    required String description,
  }) async {

    var body = {
      'amount': amount,
      'description': description,
    };

    var response = await _network.postRequest(
        body: body,
        endpoint: '/accounts/$accountNumber/debit'
    );

    if ( response != null ) {
      return response as Map<String, dynamic>;
    }
    return null;
  }

  Future<Map<String, dynamic>?> credit({
    required String accountNumber,
    required num amount,
    required String description,
  }) async {

    var body = {
      'amount': amount,
      'description': description,
    };

    var response = await _network.postRequest(
        body: body,
        endpoint: '/accounts/$accountNumber/credit'
    );

    if ( response != null ) {
      return response as Map<String, dynamic>;
    }
    return null;
  }


  Future<Map<String, dynamic>?> updateAccountStatus({
    required String accountNumber,
    required String status,
  }) async {
    
    var response = await _network.patchRequest(
        body: status,
        endpoint: '/accounts/$accountNumber/status',
        plainText: true
    );

    if ( response != null ) {
      return response as Map<String,dynamic>;
    }
    return null;
  }

  Future<Map<String, dynamic>?> deleteAccount({
    required String accountNumber,
  }) async {

    var response = await _network.deleteRequest('/accounts/$accountNumber');

    if ( response != null ) {
      return response as Map<String,dynamic>;
    }
    return null;
  }
}