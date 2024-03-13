import 'package:delivery_app/common/extension/text_styles.dart';
import 'package:delivery_app/common/extension/theme_colors.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final bool obscureText;
  const InputField(
      {super.key,
      required this.controller,
      required this.label,
      required this.hintText,
      this.validator,
      this.suffixIcon,
      this.obscureText = false,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.titleSmall
              ?.copyWith(color: context.tertially, letterSpacing: 1),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              filled: true,
              hintText: hintText,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20),
              ),
              fillColor: Colors.grey.withOpacity(0.5),
              suffixIcon: suffixIcon,
            ),
            onChanged: onChanged,
            validator: validator,
          ),
        ),
      ],
    );
  }
}
