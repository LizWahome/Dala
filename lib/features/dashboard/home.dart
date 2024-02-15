import 'package:delivery_app/common/extension/text_styles.dart';
import 'package:delivery_app/common/extension/theme_colors.dart';
import 'package:delivery_app/router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Categories> categories = [
    Categories(icon: Icons.business_rounded, text: "food and\nbeverages"),
    Categories(icon: Icons.add_business_rounded, text: "Lodge"),
    Categories(icon: Icons.houseboat, text: "Drinks"),
    Categories(icon: Icons.beach_access_rounded, text: "Resort"),
    Categories(icon: Icons.maps_home_work_rounded, text: "cab"),
    Categories(icon: Icons.store, text: "Villa"),
    Categories(icon: Icons.houseboat, text: "Apartment"),
    Categories(icon: Icons.border_all_rounded, text: "See All"),
  ];
  List<Recommended> recommended = [
    Recommended(
        image: "assets/images/hotel-1979406_1280.jpg",
        text: "Fauget Apartment",
        rate: "5.0 (770k)",
        distance: "5km"),
    Recommended(
        image: "assets/images/water-165219_1280.jpg",
        text: "Borcelle Resort",
        rate: "4.5 (770k)",
        distance: "7km"),
    Recommended(
        image: "assets/images/inner-space-1026449_1280.jpg",
        text: "Guinea Riff",
        rate: "4.7 (770k)",
        distance: "3km")
  ];
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        child: Stack(
          children: [
            Stack(
              children: [
                Container(
                  width: screenSize.width,
                  height: screenSize.height * 0.3,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: screenSize.width,
                  height: screenSize.height * 0.3,
                  decoration: BoxDecoration(
                      color: context.primary,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(70))),
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 20, bottom: 35, right: 20, top: 40),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.space_dashboard_rounded,
                              color: Colors.white,
                              size: 40,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 45,
                                child: TextField(
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: "Search",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide.none),
                                      suffixIcon: const Icon(Icons.search)),
                                ),
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hello, Charles Otieno",
                                  style: context.dividerTextLarge?.copyWith(
                                      color: Colors.white, fontSize: 22),
                                ),
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "Kilimani",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                )
                              ],
                            ),
                            const CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                  "assets/images/macaroon-4090598_1280.jpg"),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: screenSize.width,
                height: screenSize.height * 0.7,
                decoration: BoxDecoration(
                  color: context.secondary,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: screenSize.width,
                height: screenSize.height * 0.7,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(70))),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Categories"),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.keyboard_control))
                          ],
                        ),
                        Wrap(
                          children: List.generate(categories.length, (index) {
                            return Column(
                              children: [
                                Card(
                                  color: context.secondary,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Icon(
                                      categories[index].icon,
                                      size: 60,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Text(categories[index].text)
                              ],
                            );
                          }),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Recommended"),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.keyboard_control))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 200,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Container(
                                      width: 160,
                                      height: 160,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  recommended[index].image))),
                                    ),
                                    Text(
                                      recommended[index].text,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: context.primary,
                                          size: 15,
                                        ),
                                        Text(recommended[index].rate),
                                        const Icon(
                                          Icons.location_on_sharp,
                                          color: Colors.grey,
                                          size: 15,
                                        ),
                                        Text(
                                          recommended[index].distance,
                                        )
                                      ],
                                    )
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(width: 15);
                              },
                              itemCount: recommended.length),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Nearby"),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.keyboard_control))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 200,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Container(
                                      width: 160,
                                      height: 160,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  recommended[index].image))),
                                    ),
                                    Text(
                                      recommended[index].text,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: context.primary,
                                          size: 15,
                                        ),
                                        Text(recommended[index].rate),
                                        const Icon(
                                          Icons.location_on_sharp,
                                          color: Colors.grey,
                                          size: 15,
                                        ),
                                        Text(
                                          recommended[index].distance,
                                        )
                                      ],
                                    )
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(width: 15);
                              },
                              itemCount: recommended.length),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(AppRoutes.home2.name);
        },
        child: Icon(Icons.arrow_right_alt_rounded),
      ),
    );
  }
}

class Categories {
  final IconData icon;
  final String text;
  Categories({required this.icon, required this.text});
}

class Recommended {
  final String image;
  final String text;
  final String rate;
  final String distance;
  Recommended(
      {required this.image,
      required this.text,
      required this.rate,
      required this.distance});
}
