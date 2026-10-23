import 'package:digital_banking_core_frontend/Components/account_list.dart';
import 'package:digital_banking_core_frontend/providers/account_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Accounts extends StatefulWidget {
  const Accounts({super.key});

  @override
  State<Accounts> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {

  @override
  void initState() {
    // Provider.of<AccountProvider>(context,listen:false).loadAccounts(context);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AccountProvider>(context, listen: false).loadAccounts(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final accounts = Provider.of<AccountProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: AccountList(loading: accounts.loading, accounts: accounts.accounts),
      ),
    );
  }
}