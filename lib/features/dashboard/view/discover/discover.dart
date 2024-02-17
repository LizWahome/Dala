import 'package:delivery_app/common/extension/theme_colors.dart';
import 'package:delivery_app/common/widgets/appbar.dart';
import 'package:delivery_app/features/dashboard/view/discover/tabs/cab/cab.dart';
import 'package:delivery_app/features/dashboard/view/discover/tabs/drinks/drinks.dart';
import 'package:delivery_app/features/dashboard/view/discover/tabs/hotel/hotel.dart';
import 'package:flutter/material.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const AppBarWidget(title: "Discover"),
      body: DefaultTabController(
        length: 4,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TabBar(
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                indicatorColor: context.secondary,
                unselectedLabelColor: context.tertially,
                labelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.label,
                dividerColor: Colors.transparent,
                tabs: const [
                  Tab(
                    child: Text(" Hotel "),
                  ),
                  Tab(
                    child: Text(" Cab "),
                  ),
                  Tab(
                    child: Text(" Food "),
                  ),
                  Tab(
                    child: Text(" Drinks "),
                  ),
                ],
              ),
              SizedBox(
                height: screenSize.height,
                child: const Column(
                  children: [
                    Expanded(
                      child: TabBarView(
                        children: [
                          HotelPage(),
                          CabPage(),
                          Text("Drinks"),
                          DrinksPage(),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
