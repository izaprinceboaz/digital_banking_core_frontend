import 'package:digital_banking_core_frontend/Components/logout_button.dart';
import 'package:digital_banking_core_frontend/network/network.dart';
import 'package:flutter/material.dart';



class AccountList extends StatelessWidget {
  const new({
    super.key,
    required this.loading,
    required this.accounts,
  });

  final bool loading;
  final List<dynamic> accounts;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
            children: [
              if (loading)
                const CircularProgressIndicator()
              else if(accounts.isEmpty)
                const Text('No accounts yet.')
              else
                for (final account in accounts)
                  ListTile(
                    title: Text(account['accountNumber']),
                    subtitle: Text('${account['accountType']} · ${account['currency']}'),
                    trailing: Text('${account['balance']} ${account['currency']}'),
                  ),
            ]
        ),
        const Center(
          child: LogOutButton(),
        )
      ],
    );
  }
}
