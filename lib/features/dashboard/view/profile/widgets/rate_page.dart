import 'package:delivery_app/common/extension/text_styles.dart';
import 'package:delivery_app/common/extension/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatePage extends StatelessWidget {
  const RatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello Otieno", style: context.displaySmall?.copyWith(fontSize: 25, fontWeight: FontWeight.bold),),
                Text("Thank you for trusting us with your\norder"),

              ],
            ),
            SizedBox(height: 50,),
           Center(
             child: Column(
              children: [

                 Image.asset("assets/images/rate.PNG"),
                 SizedBox(height: 50,),
              Text("RATE OUR SERVICE", style: context.displaySmall?.copyWith(fontSize: 20, fontWeight: FontWeight.bold),),
              SizedBox(height: 15,),
               RatingBar.builder(
                            initialRating: 5,
                            itemSize: 40,
                            maxRating: 1,
                            allowHalfRating: true,
                            itemBuilder: (context, index) => Icon(
                                  Icons.star,
                                  color: context.secondary,
                                ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            }),
                            SizedBox(height: 100,),
                            Text("We are glad to serve you", style: context.displaySmall?.copyWith(fontSize: 20, fontWeight: FontWeight.bold, color: context.secondary),)
              ],
             ),
           )
          ],
        ),
      ),
    );
  }
}
