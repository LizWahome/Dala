import 'package:flutter/material.dart';

class OneLineRow extends StatelessWidget {
  final String text;
  final Widget widget;
  final double? padding;
  const OneLineRow({super.key, required this.text, required this.widget, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding ?? 16.0),
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
