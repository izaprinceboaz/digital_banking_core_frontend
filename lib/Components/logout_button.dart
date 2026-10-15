import 'package:digital_banking_core_frontend/network/network.dart';
import 'package:flutter/material.dart';

class LogOutButton extends StatelessWidget {
  const new({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          await Network().clearSession();
          if (!context.mounted) return;
          Navigator.pushReplacementNamed(context, '/sign-in');
        },
        child: const Text('Log out')
    );
  }
}