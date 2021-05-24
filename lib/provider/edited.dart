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
