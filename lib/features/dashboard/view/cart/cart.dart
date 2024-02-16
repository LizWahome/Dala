import 'package:delivery_app/features/dashboard/view/homepage/homepage.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HomePage(text: "My Checkout Items", isText: true,);
  }
}
