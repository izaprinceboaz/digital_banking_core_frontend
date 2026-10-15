import 'package:digital_banking_core_frontend/network/network.dart';
import 'package:digital_banking_core_frontend/providers/account_provider.dart';
import 'package:digital_banking_core_frontend/screens/home_page.dart';
import 'package:digital_banking_core_frontend/screens/sign_in.dart';
import 'package:digital_banking_core_frontend/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final token = await Network().getToken();
  runApp(
      ChangeNotifierProvider(
        create: (context) =>AccountProvider(),
          child: DigitalBankingCore(signedIn: token != null)
      )
  );
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
        '/homepage':(context) => const HomePage(),
      },
    );
  }
}
