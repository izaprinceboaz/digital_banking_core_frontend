import 'package:digital_banking_core_frontend/screens/saving.dart';
import 'package:digital_banking_core_frontend/screens/transaction.dart';
import 'package:flutter/material.dart';

import 'accounts.dart';
import 'dashboard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget>   _screen = [
    const Dashboard(),
    const Accounts(),
    const Transaction(),
    const Saving()
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Meridian'),
      ),
      body: _screen[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon : Icon(Icons.dashboard),
            label: 'Dashboard'
          ),
          BottomNavigationBarItem(
            icon : Icon(Icons.credit_card),
            label: 'Account'
          ),
          BottomNavigationBarItem(
              icon : Icon(Icons.currency_exchange),
              label: 'Transaction'
          ),
          BottomNavigationBarItem(
              icon : Icon(Icons.savings),
              label: 'Saving'
          ),
        ],
        selectedItemColor: Theme.of(context).colorScheme.onPrimary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}
