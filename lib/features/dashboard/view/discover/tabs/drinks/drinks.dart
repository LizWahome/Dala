import 'package:delivery_app/common/extension/text_styles.dart';
import 'package:delivery_app/common/extension/theme_colors.dart';
import 'package:delivery_app/common/widgets/buttons/small_button.dart';
import 'package:delivery_app/common/widgets/circular_wrap.dart';
import 'package:delivery_app/features/dashboard/view/discover/tabs/drinks/details.dart';
import 'package:flutter/material.dart';

class DrinksPage extends StatefulWidget {
  const DrinksPage({super.key});

  @override
  State<DrinksPage> createState() => _DrinksPageState();
}

class _DrinksPageState extends State<DrinksPage> {
  final List<Drinks> drinks = [
    Drinks(
        image: "assets/images/beer-1998293_1280-removebg-preview.png",
        name: "beer"),
    Drinks(image: "assets/images/wine-8346641_1280.jpg", name: "gin,vodka"),
    Drinks(image: "assets/images/drink-4188629_1280.jpg", name: "cocktails")
  ];
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: context.primary,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                  height: screenSize.height * 0.34,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color(0xFFFFE5B4),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(150),
                          bottomRight: Radius.circular(150))),
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.menu,
                          color: Colors.brown,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Welcome,",
                                  style: context.dividerTextLarge,
                                ),
                                Text(
                                  "Bar corner",
                                  style: context.headlineMedium
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: screenSize.width * 0.25,
                                      top: 5,
                                      bottom: 5,
                                      right: 5),
                                  decoration: BoxDecoration(
                                      color: context.cardColor,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "My Wallet",
                                        style: TextStyle(
                                            color: Colors.brown.shade500),
                                      ),
                                      Text("\$ 159.00",
                                          style: TextStyle(
                                              color: Colors.brown.shade500))
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const CircleAvatar(
                              backgroundImage: AssetImage(
                                  "assets/images/model-1814202_1280.jpg"),
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
              Positioned(
                  right: 0,
                  left: 0,
                  bottom: -30,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                        color: context.secondary,
                        borderRadius: BorderRadius.circular(20)),
                    child: FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/images/ai-generated-8206499_1280-removebg-preview.png",
                            width: 100,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Free Delivery',
                                style: context.headlineMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: context.scaffoldColor),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                'Order!',
                                style: context.headlineMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: context.scaffoldColor),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Available 1 December - 30 December 2025",
                                style: TextStyle(
                                    color: context.scaffoldColor, fontSize: 7),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SmallButton(
                                  btnColor: context.scaffoldColor,
                                  text: "Order Now")
                            ],
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          CircularWrap(color: context.secondary),
          Expanded(
              child: ListView.builder(
                  itemCount: drinks.length,
                  itemBuilder: (context, index) {
                    final drink = drinks[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 15),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 12),
                            decoration: const BoxDecoration(
                                color: Color(0xFFFFE5B4),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(70),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(70),
                                    bottomRight: Radius.circular(10))),
                            child: FittedBox(
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 70,
                                    backgroundImage: AssetImage(drink.image),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                drink.name,
                                                style: context.headlineMedium
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                              const Text(
                                                  "The neutrality of the\nwhite lends a softness."),
                                            ],
                                          ),
                                          SizedBox(
                                            width: screenSize.width * 0.45,
                                          ),
                                          Icon(
                                            Icons.favorite,
                                            color: Colors.red.shade900,
                                            size: 35,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          OutlinedButton(
                                              style: OutlinedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  side: BorderSide(
                                                      color: Colors
                                                          .brown.shade700),
                                                  shape:
                                                      const BeveledRectangleBorder()),
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            DrinksDetails(
                                                                drinks:
                                                                    drink)));
                                              },
                                              child: const Text(
                                                "Medium Size",
                                                style: TextStyle(
                                                    color: Colors.brown),
                                              )),
                                          const SizedBox(
                                            width: 7,
                                          ),
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.brown.shade700,
                                                  shape:
                                                      const BeveledRectangleBorder()),
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            DrinksDetails(
                                                                drinks:
                                                                    drink)));
                                              },
                                              child: const Text("Large Size",
                                                  style: TextStyle(
                                                      color: Colors.white))),
                                          SizedBox(
                                            width: screenSize.width * 0.2,
                                          ),
                                          Icon(
                                            Icons.shopping_cart,
                                            color: Colors.red.shade900,
                                            size: 35,
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}

class Drinks {
  final String image;
  final String name;
  Drinks({required this.image, required this.name});
}
