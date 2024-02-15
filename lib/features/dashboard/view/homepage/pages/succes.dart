import 'package:delivery_app/common/extension/text_styles.dart';
import 'package:delivery_app/common/extension/theme_colors.dart';
import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50,
            right: -150,
            child: Container(
              height: 250,
              width: 200,
            decoration: BoxDecoration(
              color: context.primary,
              borderRadius: BorderRadius.circular(200)
            ),
          )),
          Positioned(
            bottom: 150,
            left: -150,
            child: Container(
              height: 200,
              width: 200,
            decoration: BoxDecoration(
              color: context.primary,
              borderRadius: BorderRadius.circular(150)
            ),
          )),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.secondary
                  ),
                  child: Icon(Icons.check_rounded, color: context.scaffoldColor,size: 150,),
                ),
                SizedBox(height: 50,),
                Text("PAYMENT SUCCESS", style: context.dividerTextLarge?.copyWith(fontSize: 20, fontWeight: FontWeight.bold),),
                 SizedBox(height: 40,),
                Text("Your payment was received", style: context.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                Text("successfully. Thank you for the", style: context.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                Text("continous support", style: context.titleMedium?.copyWith(fontWeight: FontWeight.bold))
              ],
            ),
          ),
        ],
      ),
    );
  }
}