import 'package:delivery_app/common/extension/text_styles.dart';
import 'package:delivery_app/common/extension/theme_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            height: screenSize.height * 0.4,
            decoration: BoxDecoration(
              color: context.primary,
            ),
          ),
          Positioned(
            bottom: -40,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: context.tertially,
                      ),
                      const Column(
                        children: [
                          Text("RIMBERIO"),
                          Text("Enjoy your meal")
                        ],
                      ),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.menu_rounded, color: Colors.white,))
                    ],
                  ),
                  // TextField(
                  //   decoration: InputDecoration(
                  //     border: OutlineInputBorder(
                  //       borderSide: BorderSide.none,
                  //     ),
                  //     filled: true,
                  //     fillColor: Colors.white,
                  //     suffixIcon: Icon(Icons.search)
                  //   ),
                  // ),
                  Container(
                    height: screenSize.height * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(image: AssetImage("assets/images/food-6697924_1280.jpg"), fit: BoxFit.cover)
                    ),
                    child: Center(child: Text("Enjoy our most complete meal package service!", style: context.dividerTextLarge?.copyWith(color: context.scaffoldColor, fontWeight: FontWeight.bold, fontSize: 20),)),
                  )
                ],
              ),
            ),
          )
          ],
      ),
    );
  }
}
