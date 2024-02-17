import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  final Color btnColor;
  final String text;
  const SmallButton({super.key, required this.btnColor, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: btnColor,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(text),
        ),
      ),
    );
  }
}
