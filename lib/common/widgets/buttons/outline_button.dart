import 'package:delivery_app/common/extension/text_styles.dart';
import 'package:flutter/material.dart';

class OutlineButton extends StatelessWidget {
  final VoidCallback press;
  final String text;
  const OutlineButton({super.key, required this.press, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white.withOpacity(0.9),
              side: const BorderSide(color: Colors.black, width: 2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          onPressed: press,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: context.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          )),
    );
  }
}
