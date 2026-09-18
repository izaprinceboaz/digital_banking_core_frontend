import 'package:flutter/material.dart';

void main() {
  runApp(const DigitalBankingCore());
}

class DigitalBankingCore extends StatelessWidget {
  const DigitalBankingCore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Image.asset('assets/M.png'),
          title: Text('Meridian'),
        ),
        body: Text(
          'Digital Banking Core'
        ),
      ),
    );
  }
}