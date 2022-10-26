// ignore_for_file: file_names
import 'package:flutter/material.dart';

class TagSelectorProvider extends ChangeNotifier {

  bool _isMarca     = false;
  bool _isYear      = false;
  bool _isMaterial  = false;

  bool get isMarca   => _isMarca;
  bool get isYear    => _isYear;
  bool get isMaterial => _isMaterial;


  set isMarca(bool value){
    _isMarca = value;
    notifyListeners();
  }
  set isYear(bool value){
    _isYear = value;
    notifyListeners();
  }
  set isMaterial(bool value){
    _isMaterial = value;
    notifyListeners();
  }
}
