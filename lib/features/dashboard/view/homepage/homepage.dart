import 'package:delivery_app/common/extension/text_styles.dart';
import 'package:delivery_app/common/extension/theme_colors.dart';
import 'package:delivery_app/common/widgets/buttons/outline_button.dart';
import 'package:delivery_app/features/dashboard/view/homepage/models/checkout_model.dart';
import 'package:delivery_app/router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<CheckOut> foods = [
    CheckOut(
        image: "assets/images/food-6697924_1280.jpg",
        text: "Omelette",
        amount: "\$ 25.00"),
    CheckOut(
        image: "assets/images/macaroon-4090598_1280.jpg",
        text: "macaroon",
        amount: "\$ 15.00"),
    CheckOut(
        image: "assets/images/drinks-7877830_1280.jpg",
        text: "Beverage",
        amount: "\$ 10.00")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primary,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: context.scaffoldColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.amber)),
                    child: IconButton(
                        onPressed: () {
                          context.pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.amber,
                        )),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "For most delicious",
                        style: context.bodyLarge?.copyWith(
                            color: context.scaffoldColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Text("recipes",
                          style: context.bodyLarge
                              ?.copyWith(color: context.scaffoldColor))
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: foods.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: context.scaffoldColor,
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  foods[index].image,
                                  width: 70,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    foods[index].text,
                                    style: context.dividerTextLarge
                                        ?.copyWith(fontSize: 17),
                                  ),
                                  Text(foods[index].amount)
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 16),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.amber),
                                child: Icon(
                                  Icons.add,
                                  color: context.scaffoldColor,
                                ),
                              ),
                              Text(
                                "1",
                                style: context.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 16),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.amber),
                                child: Icon(
                                  Icons.add,
                                  color: context.scaffoldColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                    color: context.scaffoldColor,
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Text(
                          "Payment Details",
                          style: context.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("Sub Total"), Text("\$50.00")],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("Delivery Fee"), Text("\$10.00")],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: context.bodyLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "\$60.00",
                            style: context.bodyLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
             OutlineButton(press: (){
              context.pushNamed(AppRoutes.payments.name);
             }, text: "CHECKOUT")
            ],
          ),
        ),
      ),
    );
  }
}
