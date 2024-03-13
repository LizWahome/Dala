import 'package:delivery_app/common/extension/text_styles.dart';
import 'package:delivery_app/common/loader/custom_loader.dart';
import 'package:delivery_app/common/mixin/input_validation.dart';
import 'package:delivery_app/common/widgets/buttons/buttons.dart';
import 'package:delivery_app/common/widgets/input_field.dart';
import 'package:delivery_app/features/data/dto/login_request.dart';
import 'package:delivery_app/features/presentation/controller/login_controller.dart';
import 'package:delivery_app/router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen>
    with InputValidationMixin {
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loading = ref.watch(loginControllerProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
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
                  margin:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          InputField(
                            controller: emailController,
                            label: "EMAIL",
                            hintText: "jiara@martins.com",
                            validator: combine([
                              withMessage('field is empty', isTextEmpty),
                            ]),
                          ),
                          InputField(
                            controller: passwordController,
                            label: "PASSWORD",
                            hintText: "*****",
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                              icon: Icon(
                                isPasswordVisible
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: Colors.black54,
                              ),
                            ),
                            validator: combine([
                              withMessage('password is empty', isTextEmpty),
                              // withMessage(
                              //     'password is invalid', isPasswordInvalid)
                            ]),
                          ),
                          FullButton(
                              press: () {
                                bool isValidated = validateSave();
                                if (isValidated) {
                                  final LoginRequest loginRequest =
                                      LoginRequest(
                                          emailOrPhoneOrUsername:
                                              emailController.text.trim(),
                                          password:
                                              passwordController.text.trim());
                                  ref
                                      .read(loginControllerProvider.notifier)
                                      .login(
                                          context: context,
                                          loginRequest: loginRequest,
                                          userID: ref.read(userIdProvider));
                                }
                              },
                              text: "Log in"),
                          TextButton(
                              onPressed: () {
                                context.pushNamed(AppRoutes.register.name);
                              },
                              child: Text("Sign up instead"))
                        ],
                      )),
                )
              ],
            ),
          ),
          loading ? const CustomLoader() : const SizedBox.shrink(),
        ],
      ),
    );
  }

  bool validateSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
