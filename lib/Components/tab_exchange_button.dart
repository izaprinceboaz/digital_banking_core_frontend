

import 'package:flutter/material.dart';

class TabExchangeButton extends StatelessWidget {
  const new({
    super.key,
    required this.onTabChange,
    required this.tabNumber,
    required this.text,
  });

  final void Function(int index) onTabChange;

  final int tabNumber;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          onTabChange(tabNumber);   // Transaction tab
        },
        child: Text(text)
    );
  }
}