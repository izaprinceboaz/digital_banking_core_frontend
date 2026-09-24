import 'package:digital_banking_core_frontend/screens/accounts.dart';
import 'package:digital_banking_core_frontend/screens/dashboard.dart';
import 'package:digital_banking_core_frontend/screens/sign_in.dart';
import 'package:digital_banking_core_frontend/screens/sign_up.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DigitalBankingCore());
}

class DigitalBankingCore extends StatelessWidget {
  const DigitalBankingCore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          surface: Color.fromARGB(255, 244, 245, 246)
        ),
      ),
      initialRoute: '/sign-in',
      routes: {
        '/sign-in': (context) => const SignIn(),
        '/sign-up': (context) => const SignUp(),
        '/dashboard': (context) => const Dashboard(), 
        '/accounts':(context) => const Accounts(),
      },
    );
  }
}
