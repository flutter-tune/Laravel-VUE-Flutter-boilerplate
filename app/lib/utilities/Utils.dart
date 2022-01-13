import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  void showToast(String message, bool isError) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: isError ? Colors.red[900] : Colors.grey[700],
        textColor: Colors.white,
        fontSize: 16.0);
  }

  showMessage(BuildContext context, String msg, Color color) {
    final snackBar = SnackBar(
      content: Text(
        msg,
      ),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  unFocusKeyBoard() {
    var focusManager = WidgetsBinding.instance;
    if (focusManager != null) {
      if (focusManager.focusManager.primaryFocus != null) {
        focusManager.focusManager.primaryFocus!.unfocus();
      }
    }
  }

  validateResponse(BuildContext context, data) {
    print(data);
    if (data.containsKey("errors")) {
      int i = 0;
      data["errors"].forEach((error, msg) {
        if (i == 0) {
          showMessage(context, msg[0], Colors.red);
        }
        i++;
      });
    } else {
      return true;
    }
    return false;
  }
}
