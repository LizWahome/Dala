import 'package:delivery_app/features/dashboard/home/models/models.dart';
import 'package:flutter/material.dart';

class CircularWrap extends StatefulWidget {
  final Color color;
  const CircularWrap({super.key, required this.color});

  @override
  State<CircularWrap> createState() => _CircularWrapState();
}

class _CircularWrapState extends State<CircularWrap> {
  final List<Categories> categories = [
    Categories(icon: Icons.business_rounded, text: "Hotel"),
    Categories(icon: Icons.map_outlined, text: "Destination"),
    Categories(icon: Icons.food_bank_rounded, text: "Food"),
    Categories(icon: Icons.shopping_cart, text: "Shopping"),
    Categories(icon: Icons.maps_home_work_rounded, text: "rental"),
  ];
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(categories.length, (index) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: widget.color,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    categories[index].icon,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Text(categories[index].text)
          ],
        );
      }),
    );
  }
}
