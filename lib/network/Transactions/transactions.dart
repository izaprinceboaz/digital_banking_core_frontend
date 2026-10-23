import 'package:digital_banking_core_frontend/network/network.dart';

class Transactions {
  final Network _network = Network();

  Future<List<dynamic>?> getTransactionHistory(String accountNumber) async {

    var response = await _network.getRequest('/transactions/my-transactions/$accountNumber');

    if (response != null) {
      return response as List<dynamic>;
    }

    return null;
  }

  Future<Map<String, dynamic>?> getTransactionById({
    required String id
  }) async {

    var response = await _network.getRequest('/transactions/$id');

    if (response != null) {
      return response as Map<String, dynamic>;
    }
    return null;
  }

  // check result['status'] — a transfer can come back as 'FAILED' with a 'failureReason'
  Future<Map<String, dynamic>?> transfer({
    required String senderAccountNumber,
    required String receiverAccountNumber,
    required num amount,
    required String description,
    required String type,       // 'TRANSFER' or 'PAYMENT'
    required String currency,   // 'RWF', 'USD' or 'EUR'
  }) async {

    var body = {
      'senderAccountNumber': senderAccountNumber,
      'receiverAccountNumber': receiverAccountNumber,
      'amount': amount,
      'description': description,
      'type': type,
      'currency': currency,
    };

    var response = await _network.postRequest(
        body: body,
        endpoint: '/transactions/transfer'
    );

    if (response != null) {
      return response as Map<String, dynamic>;
    }
    return null;
  }

  Future<Map<String, dynamic>?> getTransferLimits({
    required String accountNumber
  }) async {

    var response = await _network.getRequest('/transfer-limits/account/$accountNumber');

    if (response != null) {
      return response as Map<String, dynamic>;
    }
    return null;
  }

  Future<Map<String, dynamic>?> setTransferLimits({
    required String accountNumber,
    required num dailyLimit,
    required num perTxnLimit,
  }) async {

    var body = {
      'dailyLimit': dailyLimit,
      'perTxnLimit': perTxnLimit,
    };

    var response = await _network.putRequest(
        body: body,
        endpoint: '/transfer-limits/account/$accountNumber'
    );

    if (response != null) {
      return response as Map<String, dynamic>;
    }
    return null;
  }
}
