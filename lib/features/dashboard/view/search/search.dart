import 'package:delivery_app/common/extension/text_styles.dart';
import 'package:delivery_app/common/extension/theme_colors.dart';
import 'package:delivery_app/common/widgets/circular_wrap.dart';
import 'package:delivery_app/common/widgets/horizontal_list.dart';
import 'package:delivery_app/features/dashboard/view/discover/tabs/cab/cab.dart';
import 'package:delivery_app/features/dashboard/view/discover/tabs/drinks/drinks.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primary,
      appBar: AppBar(
        backgroundColor: context.primary,
        title: Row(
          children: [
            Icon(
              Icons.location_on,
              color: context.tertially,
            ),
            Text(
              "Lampung, Indonesia",
              style: context.titleSmall,
            ),
            DropdownButton(items: [], onChanged: (value) {})
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_none_rounded,
                color: Colors.blue.shade900,
              ))
        ],
      ),
      body: ListView(
        children: [
          Stack(clipBehavior: Clip.none, children: [
            Image.asset("assets/images/beach-666122_1280.jpg"),
            Positioned(
                left: 0,
                right: 0,
                bottom: -30,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: context.scaffoldColor,
                      borderRadius: BorderRadius.circular(7)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Explore now",
                        style: context.bodyLarge,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CabPage()));
                          },
                          icon: Icon(
                            Icons.search,
                            color: Colors.blue.shade900,
                            size: 35,
                          ))
                    ],
                  ),
                )),
            Positioned(
                left: 0,
                right: 0,
                bottom: 70,
                child: Text(
                  "Where do you want to go?",
                  textAlign: TextAlign.center,
                  style: context.titleLarge?.copyWith(
                      color: context.scaffoldColor,
                      fontWeight: FontWeight.bold),
                ))
          ]),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircularWrap(color: context.tertially),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 8),
                  child: Text(
                    "Popular Destinations",
                    style: context.bodyLarge,
                  ),
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DrinksPage()));
                    },
                    child: const HorizontalList(
                      boxHeight: 120,
                      height: 100,
                      width: 110,
                      widget: SizedBox(),
                      isText: true,
                      borderRadius: 20,
                    )),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    "Explore the world again",
                    style: context.bodyLarge,
                  ),
                ),
                const HorizontalList(
                  boxHeight: 120,
                  height: 100,
                  width: 110,
                  widget: SizedBox(),
                  isText: true,
                  borderRadius: 20,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
