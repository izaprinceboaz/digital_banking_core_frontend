import 'package:digital_banking_core_frontend/Components/transaction_list.dart';
import 'package:digital_banking_core_frontend/network/network.dart';
import 'package:flutter/material.dart';

class Transaction extends StatefulWidget {
  const Transaction({super.key});

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  List<dynamic> transactions = [];
  bool loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadTransactions();
  }
  Future<void> loadTransactions() async {
    final data = await Network().getTransactionHistory('ACC-20000009');

    if(!mounted) return;

    setState(() {
      transactions = data ?? [];
      loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction'),
      ),
      body: SingleChildScrollView(
          child: TransactionList(loading: loading, transactions: transactions)
      ),
    );
  }
}