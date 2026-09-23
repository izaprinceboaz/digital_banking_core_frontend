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
          surface: Colors.white,
        ),
      ),
      initialRoute: '/sign-in',
      routes: {
        '/sign-in': (context) => const SignIn(),
        '/sign-up': (context) => const SignUp(),
      },
    );
  }
}
