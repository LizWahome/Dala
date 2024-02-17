import 'package:delivery_app/common/extension/text_styles.dart';
import 'package:delivery_app/common/widgets/appbar.dart';
import 'package:delivery_app/features/dashboard/view/profile/widgets/rate_page.dart';
import 'package:delivery_app/features/dashboard/view/profile/widgets/row_widgets.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<ProfileItems> items = [
    ProfileItems(icon: Icons.blur_circular, name: "News"),
    ProfileItems(icon: Icons.not_listed_location_rounded, name: "About"),
    ProfileItems(icon: Icons.new_releases_outlined, name: "Terms & Conditions"),
    ProfileItems(icon: Icons.lock, name: "Privacy Policy"),
    ProfileItems(icon: Icons.star, name: "Rate This App"),
    ProfileItems(icon: Icons.share, name: "Share This App")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Profile"),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage("assets/images/model-1814202_1280.jpg"),
            ),
            Text(
              "Jonathan Patterson",
              style: context.dividerTextSmall
                  ?.copyWith(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const Text("hello@reallygreatsite.com"),
            const ProfileRowWidget(text: "Edit Profile", icon: Icons.edit),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "General Settings",
                style: context.dividerTextLarge,
              ),
            ),
            ProfileRowWidget(
              text: "Mode\nDark & Light",
              icon: Icons.brightness_4_rounded,
              widget: Switch(
                  activeColor: Colors.blue,
                  value: true,
                  onChanged: (value) {
                    setState(() {
                      value = !value;
                    });
                  }),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const RatePage()));
                          },
                          child: ProfileRowWidget(
                              text: item.name, icon: item.icon));
                    }))
          ],
        ),
      ),
    );
  }
}

class ProfileItems {
  final IconData icon;
  final String name;
  ProfileItems({required this.icon, required this.name});
}
