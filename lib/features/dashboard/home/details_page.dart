import 'package:delivery_app/common/extension/text_styles.dart';
import 'package:delivery_app/common/extension/theme_colors.dart';
import 'package:delivery_app/common/widgets/buttons/buttons.dart';
import 'package:delivery_app/common/widgets/buttons/small_button.dart';
import 'package:delivery_app/features/dashboard/home/models/models.dart';
import 'package:delivery_app/features/dashboard/home/widgets/row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailsPage extends StatefulWidget {
  final SpecialMenu menu;
  const DetailsPage({super.key, required this.menu});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: context.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: screenSize.height * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.menu.image), fit: BoxFit.cover)),
            ),
            Container(
              decoration: BoxDecoration(
                  color: context.scaffoldColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Container(
                height: screenSize.height,
                margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                       SmallButton(btnColor: Colors.grey.shade300, text: "see all")
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.menu.text,
                              style: context.headlineMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            Column(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite,
                                      color: context.secondary,
                                      size: 50,
                                    )),
                                const Text("4.4k")
                              ],
                            )
                          ],
                        ),
                        Text(
                          "Available",
                          style: context.dividerTextLarge
                              ?.copyWith(letterSpacing: 1.5),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                         RatingBar.builder(
                          initialRating: 2,
                          itemSize: 30,
                          maxRating: 1,
                          allowHalfRating: true,
                          itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: context.secondary,
                              ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          }),
                          SizedBox(height: 20,),
                        const Text(
                          "Provides various types of sizes,\nSuitable for relaxing time,\nself healing, etc.",
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Select type"),
                            SizedBox(
                                width: screenSize.width * 0.4, child: const TextField())
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        RowWidget(text: "plate of 6", btnColor: context.secondary, text2: "plate of 3", btnColor2: context.primaryColorLight),
                        const SizedBox(
                          height: 10,
                        ),
                        RowWidget(text: "single portion", btnColor: context.primaryColorLight, text2: "plate of two", btnColor2: context.primaryColorLight),
                        const SizedBox(height: 40,),
                        FullButton(
                          press: () {},
                          width: screenSize.width,
                          widget: FittedBox(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.shopping_cart_rounded,
                                  color: context.scaffoldColor,
                                ),
                                SizedBox(width: 10,),
                                Text(
                                  "Order Now",
                                  style: context.headlineMedium?.copyWith(color: context.scaffoldColor, fontWeight: FontWeight.bold, fontSize: 23),
                                ),
                                SizedBox(width: 20,),
                                Text("|", style: context.headlineMedium?.copyWith(color: context.scaffoldColor),),
                                 SizedBox(width: 20,),
                                Text("\$25", style: TextStyle(color: context.scaffoldColor),)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
