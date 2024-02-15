import 'package:delivery_app/common/extension/text_styles.dart';
import 'package:delivery_app/common/extension/theme_colors.dart';
import 'package:delivery_app/common/widgets/buttons.dart';
import 'package:delivery_app/common/widgets/input_field.dart';
import 'package:delivery_app/router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    dobController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: context.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: screenSize.height * 0.25,
              decoration: BoxDecoration(color: context.primary),
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    left: 10,
                    child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: IconButton(
                          onPressed: () {
                            context.pop();
                          },
                          icon: const Icon(Icons.keyboard_backspace_rounded)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(60))),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                child: Column(
                  children: [
                    Text(
                      "Create new\nAccount",
                      style: context.displaySmall!
                          .copyWith(fontWeight: FontWeight.w900, fontSize: 30),
                    ),
                    const Text("Already Registered? Log in here"),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              InputField(
                                  controller: nameController,
                                  label: "NAME",
                                  hintText: "Jiara Martins"),
                              InputField(
                                  controller: emailController,
                                  label: "EMAIL",
                                  hintText: "hello@reallygreatsite.com"),
                              InputField(
                                  controller: passwordController,
                                  label: "PASSWORD",
                                  hintText: "******"),
                              InputField(
                                  controller: dobController,
                                  label: "DATE OF BIRTH",
                                  hintText: "Select"),
                              FullButton(
                                press: () {
                                  context.pushNamed(AppRoutes.home.name);
                                },
                                text: "Sign up",
                                buttonColor: context.primary,
                              )
                            ],
                          )),
                    )
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
