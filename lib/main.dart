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
        body: Center(
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 200,),
                  Image.asset(
                    'assets/M.png',
                    width: 35,
                    height: 35,
                  ),
                  const SizedBox(width: 8,),
                  const Text('Meridian')
                ],
              ),
              // Container(

              // )
            ],
          ),
        ),
      ),
    );
  }
}