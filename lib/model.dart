import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class imageModel with ChangeNotifier {
  String _imageurl = '';
  File? _image;

  String _finalimageurl = '';

  String get imageUrl => _imageurl;
  File? get image => _image;

  String get finalimageurl => _finalimageurl;
  // print(image);

  void setImageurl(String imageurl) {
    _imageurl = imageurl;
    print(imageurl);
    notifyListeners();
  }

  void finalImageurl(String imageurl) {
    _finalimageurl = imageurl;
    print(_finalimageurl);
    notifyListeners();
  }

  void setImage(File image) {
    _image = image;
    notifyListeners();
  }
}
