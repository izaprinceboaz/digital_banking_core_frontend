import 'package:digital_banking_core_frontend/network/network.dart';
import 'package:digital_banking_core_frontend/screens/accounts.dart';
import 'package:digital_banking_core_frontend/screens/dashboard.dart';
import 'package:digital_banking_core_frontend/screens/home_page.dart';
import 'package:digital_banking_core_frontend/screens/saving.dart';
import 'package:digital_banking_core_frontend/screens/sign_in.dart';
import 'package:digital_banking_core_frontend/screens/sign_up.dart';
import 'package:digital_banking_core_frontend/screens/transaction.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final token = await Network().getToken();
  runApp(DigitalBankingCore(signedIn: token != null));
}

class DigitalBankingCore extends StatelessWidget {
  final bool signedIn;
  const DigitalBankingCore({super.key, required this.signedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          surface: Color.fromARGB(255, 244, 245, 246)
        ),
      ),
      initialRoute: signedIn ? '/homepage' : '/sign-in',
      routes: {
        '/sign-in': (context) => const SignIn(),
        '/sign-up': (context) => const SignUp(),
        '/dashboard': (context) => const Dashboard(),
        '/accounts':(context) => const Accounts(),
        '/homepage':(context) => const HomePage(),
        '/saving':(context) => const Saving(),
        '/transaction':(context) => const Transaction()
      },
    );
  }
}
