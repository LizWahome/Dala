import 'package:delivery_app/common/extension/theme_colors.dart';
import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {
  final double? height1;
  final double? height2;
  const ColumnWidget({super.key, this.height1, this.height2});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: screenSize.width * 0.6,
          height: height1?? 20,
          color: context.scaffoldColor,
        ),
        SizedBox(height: 10,),
        Container(
          width: screenSize.width * 0.5,
          height: height2 ?? 15,
          color: context.scaffoldColor,
        ),
      ],
    );
  }
}
