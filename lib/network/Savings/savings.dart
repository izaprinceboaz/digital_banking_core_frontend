import 'package:digital_banking_core_frontend/network/network.dart';

class Savings {
  final Network _network = Network();

  Future<List<dynamic>?> getMySavingsPlans({
    required String accountNumber
  }) async {

    var response = await _network.getRequest('/savings-plans/my-savings-plans/$accountNumber');

    if (response != null) {
      return response as List<dynamic>;
    }
    return null;
  }

  Future<Map<String, dynamic>?> createSavingsPlan({
    required String accountNumber,
    required String planName,
    required String compounding,   // 'DAILY', 'MONTHLY' or 'ANNUALLY'
    required num principalAmount,
    String? maturityDate,          // optional, like '2027-06-30'
  }) async {

    var body = {
      'accountNumber': accountNumber,
      'planName': planName,
      'compounding': compounding,
      'principalAmount': principalAmount,
      'maturityDate': maturityDate,
    };

    var response = await _network.postRequest(
        body: body,
        endpoint: '/savings-plans'
    );

    if (response != null) {
      return response as Map<String, dynamic>;
    }
    return null;
  }

  Future<Map<String, dynamic>?> deposit({
    required String savingsPlanId,
    required String accountNumber,
    required num amount,
  }) async {

    var body = {
      'savingsPlanId': savingsPlanId,
      'accountNumber': accountNumber,
      'amount': amount,
    };

    var response = await _network.postRequest(
        body: body,
        endpoint: '/savings-plans/deposit'
    );

    if (response != null) {
      return response as Map<String, dynamic>;
    }
    return null;
  }

  Future<Map<String, dynamic>?> withdraw({
    required String savingsPlanId,
    required String accountNumber,
    required num amount,
  }) async {

    var body = {
      'savingsPlanId': savingsPlanId,
      'accountNumber': accountNumber,
      'amount': amount,
    };

    var response = await _network.postRequest(
        body: body,
        endpoint: '/savings-plans/withdraw'
    );

    if (response != null) {
      return response as Map<String, dynamic>;
    }
    return null;
  }

  Future<bool> deleteSavingsPlan({
    required String id
  }) async {

    var response = await _network.deleteRequest('/savings-plans/$id');

    return response != null;
  }

  Future<List<dynamic>?> getInterestRecords() async {

    var response = await _network.getRequest('/interest-records');

    if (response != null) {
      return response as List<dynamic>;
    }
    return null;
  }
}
