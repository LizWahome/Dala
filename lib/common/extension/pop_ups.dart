import 'package:another_flushbar/flushbar.dart';
import 'package:delivery_app/common/extension/device_size.dart';
import 'package:delivery_app/common/extension/theme_colors.dart';
import 'package:delivery_app/common/styles/dimens.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

extension BuildContextExtension<T> on BuildContext {
  Future<T?> showBottomSheet(Widget child,
      {bool isScrollControlled = true,
      Color? backgroundColor,
      Color? barrierColor}) {
    return showModalBottomSheet(
        context: this,
        barrierColor: barrierColor,
        backgroundColor: backgroundColor,
        isScrollControlled: isScrollControlled,
        builder: (context) => Wrap(
              children: [child],
            ));
  }

  showSnackBar(
    String message, {
    String? title,
    Color? color,
  }) {
    return Flushbar(
      title: title,
      message: message,
      maxWidth: width * 0.8,
      backgroundColor: color ?? primaryColor,
      flushbarPosition: FlushbarPosition.TOP,
      isDismissible: true,
      margin: const EdgeInsets.only(top: kSmall),
      duration: const Duration(seconds: 5),
      borderRadius: BorderRadius.circular(kSmall),
      flushbarStyle: FlushbarStyle.FLOATING,
      forwardAnimationCurve: Curves.decelerate,
      reverseAnimationCurve: Curves.easeOut,
      icon: Icon(
        Icons.info_outline,
        size: 28,
        color: onPrimary,
      ),
      leftBarIndicatorColor: primaryColorLight,
    )..show(this);
  }

  Future<bool?> showToast(String message, {Color? color}) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: color ?? primary,
        textColor: onPrimary);
  }
}
