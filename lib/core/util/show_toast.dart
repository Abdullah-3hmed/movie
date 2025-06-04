import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> showToast({
  required String message,
  required ToastStates state,
}) => Fluttertoast.showToast(
  msg: message,
  toastLength: Toast.LENGTH_LONG,
  gravity: ToastGravity.BOTTOM,
  timeInSecForIosWeb: 5,
  backgroundColor: chooseToastColor(state: state),
  fontSize: 18.0,
);

enum ToastStates { success, error, warning }

Color chooseToastColor({required ToastStates state}) {
  switch (state) {
    case ToastStates.success:
      return Colors.green;

    case ToastStates.error:
      return Colors.red;

    case ToastStates.warning:
      return Colors.amberAccent;
  }
}
