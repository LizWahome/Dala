import 'package:delivery_app/common/extension/text_styles.dart';
import 'package:delivery_app/common/extension/theme_colors.dart';
import 'package:delivery_app/common/widgets/buttons/buttons.dart';
import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  final String text;
  final Color btnColor;
  final String text2;
  final Color btnColor2;
  const RowWidget(
      {super.key,
      required this.text,
      required this.btnColor,
      required this.text2,
      required this.btnColor2});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FullButton(
          press: () {},
          text: text,
          height: 35,
          buttonColor: btnColor,
          textStyle:
              context.dividerTextSmall?.copyWith(color: context.scaffoldColor),
          width: screenSize.width * 0.4,
        ),
        FullButton(
          press: () {},
          text: text2,
          height: 35,
          buttonColor: btnColor2,
          textStyle:
              context.dividerTextSmall?.copyWith(color: context.scaffoldColor),
          width: screenSize.width * 0.4,
        ),
      ],
    );
  }
}

class IconRowWidget extends StatelessWidget {
  final IconData icon;
  final String description;
  const IconRowWidget(
      {super.key, required this.icon, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              icon,
              color: Colors.amber,
            ),
          ),
          Expanded(
              child: Text(
            description,
            style: TextStyle(color: Colors.grey.withOpacity(1)),
          ))
        ],
      ),
    );
  }
}
