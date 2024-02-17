import 'package:delivery_app/common/extension/text_styles.dart';
import 'package:delivery_app/common/extension/theme_colors.dart';
import 'package:delivery_app/features/dashboard/view/discover/tabs/cab/pages/available_cabs.dart';
import 'package:delivery_app/features/dashboard/view/discover/tabs/cab/widgets/column_widget.dart';
import 'package:delivery_app/features/dashboard/view/discover/tabs/cab/widgets/row_widget.dart';
import 'package:flutter/material.dart';

class CabPage extends StatelessWidget {
  const CabPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: context.primary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Text(
                  "Results",
                  style: context.dividerTextLarge
                      ?.copyWith(color: context.scaffoldColor, fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 60.0),
                child: Text(
                  "Check out the cars in your area. Click\nbelow to pick the ride of your choice.",
                  style: TextStyle(color: context.scaffoldColor),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AvailableCabs()));
                },
                child: Image.asset(
                  "assets/images/map.PNG",
                  width: screenSize.width,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(right: 20, left: 20, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "....",
                  style: context.dividerTextLarge?.copyWith(
                      color: context.scaffoldColor,
                      fontSize: 30,
                      letterSpacing: 5),
                ),
                ColumnWidget(),
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: context.scaffoldColor,
          ),
          SizedBox(
            height: 15,
          ),
          CabRowWidget(),
          SizedBox(
            height: 30,
          ),
          CabRowWidget(),
          SizedBox(
            height: 15,
          ),
          Divider(
            thickness: 1,
            color: context.scaffoldColor,
          )
        ],
      ),
    );
  }
}
