
import 'package:delivery_app/common/extension/text_styles.dart';
import 'package:delivery_app/common/extension/theme_colors.dart';
import 'package:delivery_app/common/styles/dimens.dart';
import 'package:flutter/material.dart';

class RouteErrorScreen extends StatefulWidget {
  final String errorMsg;
  const RouteErrorScreen({super.key, required this.errorMsg});

  @override
  State<RouteErrorScreen> createState() => _RouteErrorScreenState();
}

class _RouteErrorScreenState extends State<RouteErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Route Error'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(kMedium),
          child: Column(
            children: [
              //  Lottie.asset('assets/lottie/2.json', animate: true),
              const SizedBox(
                height: kXLMedium,
              ),
              Text(
                widget.errorMsg,
                textAlign: TextAlign.center,
                style: context.labelLarge!
                    .copyWith(color: context.errorColor, fontSize: kMedium),
              ),
              const SizedBox(
                height: kXLMedium,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(kSmall)),
                      backgroundColor: context.primary),
                  onPressed: () {},
                  child: Text('Back Home',
                      style: context.titleSmall!
                          .copyWith(color: context.onPrimary)))
            ],
          ),
        ),
      ),
    );
  }
}
