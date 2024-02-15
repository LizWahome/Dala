import 'package:delivery_app/common/extension/text_styles.dart';
import 'package:delivery_app/common/extension/theme_colors.dart';
import 'package:delivery_app/common/widgets/one_line_row.dart';
import 'package:delivery_app/features/dashboard/home/details_page.dart';
import 'package:delivery_app/features/dashboard/home/models/models.dart';
import 'package:delivery_app/router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  List<SpecialMenu> specialMenu = [
    SpecialMenu(
        image: "assets/images/pasta-329522_1280.jpg", text: "Spaghetti"),
    SpecialMenu(
        image: "assets/images/drinks-7877830_1280.jpg", text: "Mango juice"),
    SpecialMenu(
        image: "assets/images/steak-1445124_1280.jpg", text: "Beef steak")
  ];
  PageController controller = PageController();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Stack(
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
                top: 20,
                bottom: -50,
                left: 0,
                right: 0,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: context.tertially,
                            backgroundImage: const AssetImage(
                                "assets/images/blank-profile-picture-973460_1280.png"),
                          ),
                          Column(
                            children: [
                              Text(
                                "RIMBERIO",
                                style: TextStyle(
                                    color: context.scaffoldColor,
                                    fontWeight: FontWeight.w900),
                              ),
                              Text(
                                "Enjoy your meal",
                                style: TextStyle(color: context.scaffoldColor),
                              )
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.menu_rounded,
                                color: Colors.white,
                                size: 35,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.9),
                              suffixIcon: Icon(
                                Icons.search,
                                color: context.tertially,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.21,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Container(
                              height: screenSize.height * 0.2,
                              width: screenSize.width * 0.85,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/images/food-6697924_1280.jpg"),
                                      fit: BoxFit.cover)),
                              child: Center(
                                  child: Text(
                                "Enjoy our most complete\nmeal package service!",
                                style: context.dividerTextLarge?.copyWith(
                                    color: context.scaffoldColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              width: 10,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: controller,
                  count: 4,
                  axisDirection: Axis.horizontal,
                  effect: const SlideEffect(
                      spacing: 6.0,
                      radius: 16.0,
                      dotWidth: 10.0,
                      dotHeight: 10.0,
                      paintStyle: PaintingStyle.stroke,
                      strokeWidth: 1.5,
                      dotColor: Colors.grey,
                      activeDotColor: Colors.amber),
                ),
                OneLineRow(text: "Special Menu", widget: TextButton(onPressed: (){}, child: const Text("See All"))),
                Wrap(
                  children: List.generate(specialMenu.length, (index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailsPage(menu: specialMenu[index])));
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image:
                                          AssetImage(specialMenu[index].image),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Text(
                            specialMenu[index].text,
                            style: TextStyle(
                                fontSize: 12, color: context.tertially),
                          )
                        ],
                      ),
                    );
                  }),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: context.secondary,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Free Delivery\nOrder!",
                            style: context.headlineLarge?.copyWith(
                                color: Colors.white.withOpacity(0.9),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "For purchaces over \$100!",
                            style: context.dividerTextSmall?.copyWith(
                                color: Colors.white.withOpacity(0.8)),
                          )
                        ],
                      ),
                      Image.asset(
                        "assets/images/food-delivery-5217579_1280-removebg-preview.png",
                        height: 70,
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(AppRoutes.dashboard.name);
        },
        child: const Icon(Icons.arrow_right_alt_rounded),
      ),
    );
  }
}
