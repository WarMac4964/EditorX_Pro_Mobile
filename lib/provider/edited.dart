import 'dart:io';
import 'package:flutter/material.dart';

class Edited with ChangeNotifier {
  File _image;

  void update(File img) {
    _image = img;
    notifyListeners();
  }

  File get image {
    return _image;
  }
}

class ColorMode with ChangeNotifier {
  Color bgColor = Colors.black;
  Color textColor = Colors.white;

  void update() {
    if (bgColor == Colors.black) {
      bgColor = Colors.white;
      textColor = Colors.black;
    } else {
      bgColor = Colors.black;
      textColor = Colors.white;
    }
    notifyListeners();
  }
}
