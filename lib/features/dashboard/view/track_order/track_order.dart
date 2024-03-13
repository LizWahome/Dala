import 'package:delivery_app/common/extension/text_styles.dart';
import 'package:delivery_app/common/extension/theme_colors.dart';
import 'package:flutter/material.dart';

class TrackOrder extends StatefulWidget {
  const TrackOrder({super.key});

  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.primary,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.track_changes_rounded)),
        title: Text("Track Order"),
        actions: [
          TextButton(onPressed: (){}, child: Text("CANCEL", style: context.bodyLarge?.copyWith(color: Colors.white),))
        ],
      ),
      body: Column(
        children: [
          Card(
            color: Colors.white.withOpacity(0.5),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("ESTIMATED TIME"),
                      Text("30 minutes")
                    ],
                  ),
                  Column(
                    children: [
                      Text("ORDER NUMBER"),
                      Text("#24675841")
                    ],
                  )
                ],
              ),
            )),
            Stepper(
              
              steps: getSteps())
        ],
      )
    );
  }

   List<Step> getSteps() => [
        Step(
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
            title: Divider(),
            label: Text("Kitty"),
            content: Text("Order Placed"),
            isActive: currentStep >= 0),
        Step(
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            title: Divider(),
            label: Text("Financial"),
            content: Text("Order Confirmed"),
            isActive: currentStep >= 1),
        Step(
            state: currentStep == 2 ? StepState.complete : StepState.indexed,
            title: Divider(),
            label: Text("Complete"),
            content: Text("Order Processed"),
            isActive: currentStep >= 2),
      ];
}