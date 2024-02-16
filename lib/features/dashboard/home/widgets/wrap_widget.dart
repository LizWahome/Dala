import 'package:delivery_app/common/extension/theme_colors.dart';
import 'package:delivery_app/features/dashboard/home/details_page.dart';
import 'package:delivery_app/features/dashboard/home/models/models.dart';
import 'package:flutter/material.dart';

class WrapWidget extends StatefulWidget {
  final double? height;
  final double? width;
  final bool isText;
  const WrapWidget({super.key, this.height, this.width, this.isText = false});

  @override
  State<WrapWidget> createState() => _WrapWidgetState();
}

class _WrapWidgetState extends State<WrapWidget> {
  List<SpecialMenu> specialMenu = [
    SpecialMenu(
        image: "assets/images/pasta-329522_1280.jpg", text: "Spaghetti"),
    SpecialMenu(
        image: "assets/images/drinks-7877830_1280.jpg", text: "Mango juice"),
    SpecialMenu(
        image: "assets/images/steak-1445124_1280.jpg", text: "Beef steak"),
  ];
  @override
  Widget build(BuildContext context) {
    return Wrap(
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
                  height: widget.height ?? 100,
                  width: widget.width ?? 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(specialMenu[index].image),
                          fit: BoxFit.cover)),
                ),
              ),
              widget.isText?  SizedBox():Text(
                specialMenu[index].text,
                style: TextStyle(fontSize: 12, color: context.tertially),
              )
              
            ],
          ),
        );
      }),
    );
  }
}
