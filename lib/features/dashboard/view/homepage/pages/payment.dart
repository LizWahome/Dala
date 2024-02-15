import 'package:delivery_app/common/extension/text_styles.dart';
import 'package:delivery_app/common/extension/theme_colors.dart';
import 'package:delivery_app/features/dashboard/view/homepage/models/checkout_model.dart';
import 'package:delivery_app/router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final List<Payments> payments = [
    Payments(
        sText: "Lipa na Mpesa",
        image: "assets/images/mpesa-removebg-preview.png",
        bText: "Mpesa paybill"),
    Payments(
        sText: "My Card",
        image: "assets/images/visa-2623015_1280.png",
        bText: "Visa Card"),
    Payments(
        sText: "Mpesa express",
        image: "assets/images/mpesa-removebg-preview.png",
        bText: "Mpesa express")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text("Payments"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  context.pushNamed(AppRoutes.success.name);
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: context.scaffoldColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        payments[index].sText,
                        style: context.bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 30,
                              backgroundImage:
                                  AssetImage(payments[index].image),
                            ),
                            Text(
                              payments[index].bText,
                              style: context.headlineMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 20,
              );
            },
            itemCount: payments.length),
      ),
    );
  }
}
