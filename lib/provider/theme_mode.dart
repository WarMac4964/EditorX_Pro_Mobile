import 'package:flutter/material.dart';

class Thememode with ChangeNotifier {
  Color primaryColor;
  Color textColor;
  Color secondaryColor = Colors.grey;
  bool state = true;

  void toggleMode() {
    if (state) {
      state = !state;
      primaryColor = Color.fromRGBO(30, 27, 31, 1);
      textColor = Colors.white;
    } else {
      state = !state;
      primaryColor = Colors.white;
      textColor = Colors.black;
    }
    notifyListeners();
  }
}
