import 'package:delivery_app/common/extension/theme_colors.dart';
import 'package:flutter/material.dart';

class ProfileRowWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final Widget? widget;
  const ProfileRowWidget({super.key, required this.text, required this.icon, this.widget});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: context.secondary,
                child: IconButton(onPressed: () {}, icon: Icon(icon)),
              ),
              SizedBox(
                width: 15,
              ),
              Text(text),
            ],
          ),
        ),
        widget ?? IconButton(
            onPressed: () {}, icon: Icon(Icons.keyboard_arrow_right_rounded))
      ],
    );
  }
}
