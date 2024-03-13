import 'package:delivery_app/common/extension/pop_ups.dart';
import 'package:delivery_app/common/extension/text_styles.dart';
import 'package:delivery_app/common/extension/theme_colors.dart';
import 'package:delivery_app/common/loader/custom_loader.dart';
import 'package:delivery_app/common/styles/dimens.dart';
import 'package:delivery_app/common/widgets/buttons/buttons.dart';
import 'package:delivery_app/common/widgets/input_field.dart';
import 'package:delivery_app/features/data/dto/client_request.dart';
import 'package:delivery_app/features/presentation/controller/addclient_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:delivery_app/common/mixin/input_validation.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen>
    with InputValidationMixin {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  bool obscureText = true;

  bool hasCharacter = false;
  bool satisfiesLenght = false;
  bool hasNumber = false;
  List gender = ["Male", "Female", "Rather not say"];
  String select = "Male";
  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    emailController.dispose();
    lastNameController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    confirmPassController.dispose();
    roleController.dispose();
    idController.dispose();
    dobController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loading = ref.watch(registerControllerProvider);
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: context.primary,
      body: Stack(
        children: [
          SingleChildScrollView(
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
                              icon:
                                  const Icon(Icons.keyboard_backspace_rounded)),
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
                    margin: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 30),
                    child: Column(
                      children: [
                        Text(
                          "Create new\nAccount",
                          style: context.displaySmall!.copyWith(
                              fontWeight: FontWeight.w900, fontSize: 30),
                        ),
                        const Text("Already Registered? Log in here"),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Form(
                              key: ref.read(registerGlobalKey),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: InputField(
                                          controller: firstNameController,
                                          label: "FIRST NAME",
                                          hintText: "Jiara",
                                          validator: combine([
                                            withMessage("first name is empty",
                                                isTextEmpty)
                                          ]),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Expanded(
                                        child: InputField(
                                          controller: lastNameController,
                                          label: "LAST NAME",
                                          hintText: "Martins",
                                          validator: combine([
                                            withMessage("last name is empty",
                                                isTextEmpty)
                                          ]),
                                        ),
                                      ),
                                    ],
                                  ),
                                  InputField(
                                    controller: usernameController,
                                    label: "USERNAME",
                                    hintText: "Martins",
                                    validator: combine([
                                      withMessage(
                                          "username is empty", isTextEmpty)
                                    ]),
                                  ),
                                  InputField(
                                    controller: emailController,
                                    label: "EMAIL",
                                    hintText: "hello@reallygreatsite.com",
                                    validator: combine([
                                      withMessage(
                                          'email is empty', isTextEmpty),
                                      withMessage(
                                          'email is invalid', isInvalidEmail),
                                    ]),
                                  ),
                                  InputField(
                                    controller: phoneController,
                                    label: "PHONE NUMBER",
                                    hintText: "0752000000",
                                    // validator: combine([
                                    //   withMessage("number is empty", isNumber)
                                    // ]),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Gender"),
                                      Row(
                                        children: <Widget>[
                                          addRadioButton(0, 'Male', context),
                                          addRadioButton(1, 'Female', context),
                                          addRadioButton(2, 'Others', context),
                                        ],
                                      ),
                                    ],
                                  ),
                                  InputField(
                                    controller: passwordController,
                                    label: "PASSWORD",
                                    hintText: "******",
                                    obscureText: obscureText,
                                    onChanged: (p0) {
                                      checkPasswordStrength(
                                          passwordController.text.trim());
                                      ref
                                          .read(registerControllerProvider
                                              .notifier)
                                          .validateSave();
                                    },
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          obscureText = !obscureText;
                                        });
                                      },
                                      icon: Icon(
                                        obscureText
                                            ? Icons.visibility_off_outlined
                                            : Icons.visibility_outlined,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    validator: combine([
                                      withMessage(
                                          'password is empty', isTextEmpty),
                                      withMessage('password is invalid',
                                          isPasswordInvalid)
                                    ]),
                                  ),
                                  passwordController.text.isEmpty
                                      ? const SizedBox.shrink()
                                      : passwordStrength(context),
                                  const SizedBox(
                                    height: kSmall,
                                  ),
                                  InputField(
                                    controller: confirmPassController,
                                    label: "CONFIRM PASSWORD",
                                    obscureText: obscureText,
                                    hintText: "******",
                                    onChanged: (p0) {
                                      ref
                                          .read(registerControllerProvider
                                              .notifier)
                                          .validateSave();
                                    },
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          obscureText = !obscureText;
                                        });
                                      },
                                      icon: Icon(
                                        obscureText
                                            ? Icons.visibility_off_outlined
                                            : Icons.visibility_outlined,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    validator: combine([
                                      withMessage(
                                          'password is empty', isTextEmpty),
                                      withMessage('password is invalid',
                                          isPasswordInvalid),
                                      withMessage('Password did not match',
                                          (confirmPassword) {
                                        final password =
                                            passwordController.text;
                                        if (confirmPassword != password) {
                                          return ValidateFailResult
                                              .passwordNotMatch;
                                        }
                                        return null;
                                      })
                                    ]),
                                  ),
                                  InputField(
                                      controller: roleController,
                                      label: "ROLE",
                                      hintText: "client/driver/"),
                                  InputField(
                                    controller: dobController,
                                    label: "DATE OF BIRTH",
                                    hintText: "yyyy-m-dd",
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          _selectDate(context);
                                        },
                                        icon:
                                            Icon(Icons.calendar_month_rounded)),
                                    validator: combine([
                                      withMessage('DOB is empty', isTextEmpty),
                                    ]),
                                  ),
                                  InputField(
                                    controller: idController,
                                    label: "ID NUMBER",
                                    hintText: "23658***",
                                    // validator: combine([
                                    //   withMessage("number is empty", isNumber)
                                    // ]),
                                  ),
                                  FullButton(
                                    press: () {
                                      if (ref
                                          .read(registerControllerProvider
                                              .notifier)
                                          .validateSave()) {
                                        final ClientRequest request =
                                            ClientRequest(
                                                email:
                                                    emailController.text.trim(),
                                                username: usernameController.text.trim(),
                                                firstName: firstNameController.text.trim(),
                                                lastName: lastNameController.text.trim(),
                                                phone:
                                                    phoneController.text.trim(),
                                                role:
                                                    roleController.text.trim(),
                                                password: passwordController
                                                    .text
                                                    .trim(),
                                                confirmPassword:
                                                    confirmPassController.text
                                                        .trim(),
                                                idNumber:
                                                    idController.text.trim(),
                                                gender: select);

                                        ref
                                            .read(registerControllerProvider
                                                .notifier)
                                            .addClient(
                                                context: context,
                                                clientRequest: request);
                                      } else {
                                        context.showSnackBar(
                                            "Ensure all input fields are correct to continue",
                                            color: context.errorColor);
                                      }
                                    },
                                    text: "Sign up",
                                    buttonColor: context.primary,
                                  )
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          loading ? const CustomLoader() : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Row addRadioButton(int btnValue, String title, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: gender[btnValue],
          groupValue: select,
          onChanged: (value) {
            setState(() {
              print(value);
              select = value;
            });
          },
        ),
        Text(title)
      ],
    );
  }

  _selectDate(BuildContext context) async {
    var selected = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      initialDatePickerMode: DatePickerMode.year,
      initialEntryMode: DatePickerEntryMode.calendar,
      firstDate: DateTime(1960),
      helpText: "Select Date of birth",
      lastDate: DateTime.now(),
    );
    if (selected != null && selected != DateTime.now()) {
      setState(() {
        dobController.text =
            "${selected.year}-${selected.month}-${selected.day}";
      });
    }
  }

  checkPasswordStrength(String value) {
    if (hasCharacterRegEx.hasMatch(value)) {
      setState(() {
        hasCharacter = true;
      });
    }
    if (hasNumberRegEx.hasMatch(value)) {
      setState(() {
        hasNumber = true;
      });
    }
    if (value.length >= 8) {
      setState(() {
        satisfiesLenght = true;
      });
    }
    if (value.length < 8) {
      setState(() {
        satisfiesLenght = false;
      });
    }
    if (!hasNumberRegEx.hasMatch(value)) {
      setState(() {
        hasNumber = false;
      });
    }
    if (!hasCharacterRegEx.hasMatch(value)) {
      setState(() {
        hasCharacter = false;
      });
    }
  }

  Row passwordStrength(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            hasCharacter
                ? const SizedBox.shrink()
                : Row(
                    children: [
                      Icon(
                        hasCharacter ? Icons.check : Icons.cancel,
                        size: kMedium,
                        color: hasCharacter
                            ? context.primaryColor
                            : context.errorColor,
                      ),
                      const SizedBox(
                        width: kSmall,
                      ),
                      Text(
                        "at least 1 character (a-z)",
                        style: context.bodySmall!.copyWith(
                            color: hasCharacter
                                ? context.primaryColor
                                : context.errorColor),
                      ),
                    ],
                  ),
            hasNumber
                ? const SizedBox.shrink()
                : Row(
                    children: [
                      Icon(
                        hasNumber ? Icons.check : Icons.cancel,
                        size: kMedium,
                        color: hasNumber
                            ? context.primaryColor
                            : context.errorColor,
                      ),
                      const SizedBox(
                        width: kSmall,
                      ),
                      Text(
                        "at least 1 number (0-9)",
                        style: context.bodySmall!.copyWith(
                            color: hasNumber
                                ? context.primaryColor
                                : context.errorColor),
                      ),
                    ],
                  ),
            satisfiesLenght
                ? const SizedBox.shrink()
                : Row(
                    children: [
                      Icon(
                        satisfiesLenght ? Icons.check : Icons.cancel,
                        size: kMedium,
                        color: satisfiesLenght
                            ? context.primaryColor
                            : context.errorColor,
                      ),
                      const SizedBox(
                        width: kSmall,
                      ),
                      Text(
                        "satisfies length of 8",
                        style: context.bodySmall!.copyWith(
                            color: satisfiesLenght
                                ? context.primaryColor
                                : context.errorColor),
                      ),
                    ],
                  ),
          ],
        )
      ],
    );
  }
}
