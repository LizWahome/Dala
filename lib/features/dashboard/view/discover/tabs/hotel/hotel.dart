import 'package:delivery_app/common/extension/text_styles.dart';
import 'package:delivery_app/common/extension/theme_colors.dart';
import 'package:delivery_app/features/dashboard/view/discover/models/models.dart';
import 'package:delivery_app/features/dashboard/view/discover/tabs/hotel/details.dart';
import 'package:flutter/material.dart';

class HotelPage extends StatefulWidget {
  const HotelPage({super.key});

  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.maxScrollExtent == _controller.offset) {
        fetch();
      }
    });
  }

  Future fetch() async {
    setState(() {
      hotels.add(Hotels(
          image: "assets/images/steak-1445124_1280.jpg",
          name: "Steak",
          loc: "dhuaidh",
          rating: "Very Good"));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final List<Hotels> hotels = [
    Hotels(
        image: "assets/images/water-165219_1280.jpg",
        name: "MovenPick Hotel & Resort",
        loc: "Nairobi, Kenya",
        rating: "Excellent"),
    Hotels(
        image: "assets/images/inner-space-1026449_1280.jpg",
        name: "Liceria Hotel & Resort",
        loc: "Jakarta, Indonesia",
        rating: "Very Good"),
    Hotels(
        image: "assets/images/hotel-1979406_1280.jpg",
        name: "Borcelle Hotel & Resort",
        loc: "Jakarta, Indonesia",
        rating: "Very Good"),
  ];
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return ListView.builder(
        controller: _controller,
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          final hotel = hotels[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  hotel.image,
                  height: screenSize.height * 0.25,
                  width: screenSize.width,
                  fit: BoxFit.cover,
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(hotel.name,
                          style: context.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                hotel.loc,
                                style: context.bodySmall,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.amber,
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: const Text("4.9"),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(hotel.rating)
                                ],
                              )
                            ],
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: context.secondary,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5)))),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            HotelDetailsPage(hotel: hotel)));
                              },
                              child: Text(
                                "View Details",
                                style: TextStyle(color: context.scaffoldColor),
                              ))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
