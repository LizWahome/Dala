import 'package:delivery_app/common/extension/text_styles.dart';
import 'package:delivery_app/common/extension/theme_colors.dart';
import 'package:delivery_app/common/widgets/horizontal_list.dart';
import 'package:delivery_app/common/widgets/one_line_row.dart';
import 'package:delivery_app/features/dashboard/home/models/models.dart';
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
                                  "assets/images/model-1814202_1280.jpg"),
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
                        OneLineRow(text: "Categories", widget:  IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.keyboard_control))),
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
                      OneLineRow(text: "Recommended", widget: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.keyboard_control))),
                      HorizontalList(),
                       OneLineRow(text: "Nearby", widget:  IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.keyboard_control))),
                       HorizontalList()
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


