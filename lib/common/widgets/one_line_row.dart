import 'package:flutter/material.dart';

class OneLineRow extends StatelessWidget {
  final String text;
  final Widget widget;
  const OneLineRow({super.key, required this.text, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Text(text),
          widget,
        ],
      ),
    );
  }
}
