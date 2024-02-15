import 'package:delivery_app/common/extension/text_styles.dart';
import 'package:delivery_app/common/extension/theme_colors.dart';
import 'package:flutter/material.dart';

class FullButton extends StatelessWidget {
  final Color? buttonColor;
  final VoidCallback press;
  final String text;
  const FullButton({super.key, required this.press, required this.text, this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor ?? context.secondary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          onPressed: press,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              text,
              style: context.titleLarge!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )),
    );
  }
}
