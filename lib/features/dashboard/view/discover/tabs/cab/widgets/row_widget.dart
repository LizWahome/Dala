import 'package:delivery_app/common/extension/theme_colors.dart';
import 'package:delivery_app/features/dashboard/view/discover/tabs/cab/widgets/column_widget.dart';
import 'package:flutter/material.dart';

class CabRowWidget extends StatelessWidget {
  const CabRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.location_on_outlined, color: context.cardColor, size: 35,),
        const SizedBox(width: 25,),
        const ColumnWidget(
          height1: 14,
          height2: 14,
        )
      ],
    );
  }
}
