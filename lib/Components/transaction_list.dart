import 'package:flutter/material.dart';



class TransactionList extends StatelessWidget {
  const new({
    super.key,
    required this.loading,
    required this.transactions,
  });

  final bool loading;
  final List<dynamic> transactions;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            if(loading)
              const CircularProgressIndicator()
            else if(transactions.isEmpty)
              const Text('No transactions')
            else
              for(final transaction in transactions)
                ListTile(
                  title: Text('Description: ${transaction['description']}'),
                  subtitle: Text('Status: ${transaction['status']}'),
                  trailing: Text('${transaction['amount']} ${transaction['currency']}'),
                )
          ],
        )
      ],
    );
  }
}
