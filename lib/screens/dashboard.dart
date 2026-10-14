import 'package:digital_banking_core_frontend/network/network.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text('Good Morning'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Here is Your Account Details'),
          // ListView.builder(itemBuilder: itemBuilder)
          Row(
            children: [
              const Text('No Accounts yet'),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/accounts');
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
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, '/transaction');
                            },
                            child: const Text('See All')
                        )
                      )
                    ]
                  ),
                  const Text('No transaction yet.')
                ],
              ),
            ),
          ),
          const Spacer(),
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
    );
  }
}