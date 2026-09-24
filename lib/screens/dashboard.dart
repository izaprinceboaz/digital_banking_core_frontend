import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text('Welcome Back'),        
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Here is Your Account Details'),
          Row(
            children: [
              const Text('No Accounts yet'),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/accounts');
                }, 
                child: const Text('Open one')
              ),
            ]
          ),
          Padding(
            padding: const EdgeInsetsGeometry.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  width: 2
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Recent Transactions'),
                      TextButton(
                        onPressed: () {
                          print('See all Transaction');
                        }, 
                        child: const Text('See all')
                      )
                    ]
                  ),
                  const Text('No transaction yet.')
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/sign-in');
            }, 
            child: const Text('Log Out')
          ),
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
    );
  }
}