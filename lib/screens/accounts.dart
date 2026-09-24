import 'package:flutter/material.dart';

class Accounts extends StatelessWidget {
  const Accounts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Accounts'),
                ElevatedButton(
                  onPressed: () {
                    
                  }, 
                  child: const Text('+ New Account')
                ),
              ],
            ),
          const Text('No Accounts yet'),
          const Spacer(),
          Center(
            child: ElevatedButton(
              onPressed: () {
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
