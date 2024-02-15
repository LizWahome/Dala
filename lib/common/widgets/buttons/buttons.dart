import 'package:delivery_app/common/extension/text_styles.dart';
import 'package:delivery_app/common/extension/theme_colors.dart';
import 'package:flutter/material.dart';

class FullButton extends StatelessWidget {
  final Color? buttonColor;
  final double? width;
  final double? height;
  final VoidCallback press;
  final TextStyle? textStyle;
  final String? text;
  final Widget? widget;
  const FullButton(
      {super.key,
      required this.press,
      this.text,
      this.buttonColor,
      this.width,
      this.textStyle,
      this.widget,
      this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor ?? context.secondary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          onPressed: press,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: widget?? Text(
              text ?? '',
              style: textStyle ??
                  context.titleLarge!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )),
    );
  }
}
