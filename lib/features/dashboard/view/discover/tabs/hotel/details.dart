import 'package:delivery_app/common/extension/text_styles.dart';
import 'package:delivery_app/common/widgets/buttons/buttons.dart';
import 'package:delivery_app/common/widgets/one_line_row.dart';
import 'package:delivery_app/features/dashboard/home/widgets/row_widget.dart';
import 'package:delivery_app/features/dashboard/home/widgets/wrap_widget.dart';
import 'package:delivery_app/features/dashboard/view/discover/models/models.dart';
import 'package:delivery_app/router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';

class HotelDetailsPage extends StatefulWidget {
  final Hotels hotel;
  const HotelDetailsPage({super.key, required this.hotel});

  @override
  State<HotelDetailsPage> createState() => _HotelDetailsPageState();
}

class _HotelDetailsPageState extends State<HotelDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(widget.hotel.image),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              color: Colors.grey.shade200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RatingBar.builder(
                          initialRating: 5,
                          itemSize: 20,
                          maxRating: 1,
                          allowHalfRating: true,
                          itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          }),
                      const Text("5.0 Rating (200)")
                    ],
                  ),
                  const Row(
                    children: [
                      Icon(Icons.air_rounded),
                      Icon(Icons.wifi),
                      Icon(Icons.wifi_tethering),
                      Icon(Icons.health_and_safety_rounded)
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "About Our Hotel",
                      style: context.dividerTextLarge,
                    ),
                  ),
                  const IconRowWidget(
                      icon: Icons.star,
                      description:
                          "Experience a seamless blend of luxury and comfort at our exquite hotel where every moment is designed to have you with lasting memories"),
                  const IconRowWidget(
                      icon: Icons.egg_alt,
                      description:
                          "Whether it's a gourmet breakfast, a leisurely lunch, or a sumptous dinner, our dining experience is a celebration of culinary excellence."),
                  const IconRowWidget(
                      icon: Icons.celebration_rounded,
                      description:
                          "Planning an event? Our versatile and well-equipped event spaces are the perfect canvas for your celebrations, be it weddings or conferences."),
                  OneLineRow(
                    text: "More Image",
                    widget: TextButton(
                        onPressed: () {}, child: const Text("See All")),
                    padding: 0,
                  ),
                  WrapWidget(
                    height: 70,
                    width: 70,
                    isText: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: FullButton(
                      press: () {
                        context.pushNamed(AppRoutes.payments.name);
                      },
                      text: "Book Now",
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
