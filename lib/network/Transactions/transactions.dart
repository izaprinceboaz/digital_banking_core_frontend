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
}