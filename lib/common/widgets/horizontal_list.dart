import 'package:delivery_app/common/extension/theme_colors.dart';
import 'package:delivery_app/features/dashboard/home/models/models.dart';
import 'package:flutter/material.dart';

class HorizontalList extends StatefulWidget {
  const HorizontalList(
      {super.key});

  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
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
    return SizedBox(
      height: 200,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final recomend = recommended[index];
            return Column(
              children: [
                Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(recomend.image))),
                ),
                Text(
                  recomend.text,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: context.primary,
                      size: 15,
                    ),
                    Text(recomend.rate),
                    const Icon(
                      Icons.location_on_sharp,
                      color: Colors.grey,
                      size: 15,
                    ),
                    Text(
                      recomend.distance,
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
    );
  }
}
