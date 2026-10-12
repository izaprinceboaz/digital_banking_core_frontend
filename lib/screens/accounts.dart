import 'package:digital_banking_core_frontend/network/network.dart';
import 'package:flutter/material.dart';

class Accounts extends StatefulWidget {
  const Accounts({super.key});

  @override
  State<Accounts> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  List<dynamic> accounts = [];
  bool loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAccounts();
  }

  Future<void> loadAccounts() async {
    final data = await Network().getMyAccounts();   // await is allowed here

    if (!mounted) return;

    setState(() {
      accounts = data ?? [];       // data is null if the request failed
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
            Center(
              child: ElevatedButton(
                  onPressed: () async {
                    await Network().clearSession();
                    if (!context.mounted) return;
                    Navigator.pushReplacementNamed(context, '/sign-in');
                  },
                  child: const Text('Log out')
              ),
            )
          ],
        ),
      ),
    );
  }
}
