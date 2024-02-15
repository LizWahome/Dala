import 'package:delivery_app/common/extension/text_styles.dart';
import 'package:delivery_app/common/widgets/buttons.dart';
import 'package:delivery_app/common/widgets/input_field.dart';
import 'package:delivery_app/router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/login2.PNG"),
            Text(
              "Login",
              style: context.loginTextLarge,
            ),
            Text(
              "Sign in to continue",
              style: context.bodyExtraSmall!.copyWith(fontSize: 15),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: Form(
                  child: Column(
                children: [
                  InputField(
                      controller: nameController,
                      label: "NAME",
                      hintText: "Jiara Martins"),
                  InputField(
                      controller: passwordController,
                      label: "PASSWORD",
                      hintText: "*****"),
                  FullButton(
                      press: () {
                        context.pushNamed(AppRoutes.register.name);
                      },
                      text: "Log in")
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
