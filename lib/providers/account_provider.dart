import 'package:digital_banking_core_frontend/network/network.dart';
import 'package:flutter/material.dart';

class AccountProvider extends ChangeNotifier {
  List<dynamic> _accounts = [];
  bool _loading = false;

  List<dynamic> get accounts => _accounts;
  bool get loading => _loading;

  Future<void> loadAccounts(BuildContext context)  async {
    _loading = true;
    notifyListeners();

    final data = await Network().getMyAccounts();
    _accounts = data ?? [];
    _loading = false;
    notifyListeners();
  }
}