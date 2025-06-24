import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';
import 'app_color.dart';


// Function to show default toast
void showToast({
  required String message,
  Color backgroundColor = AppColor.primaryToastBackground,
  Color textColor = AppColor.primaryToastText,
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: backgroundColor,
    textColor: textColor,
    fontSize: 16.0,
  );
}

// Function to show error toast
void showErrorToast({
  required String message,
  Color backgroundColor = AppColor.errorToastBackground,
  Color textColor = AppColor.errorToastText,
}) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: backgroundColor,
    textColor: textColor,
    fontSize: 16.0,
  );
}