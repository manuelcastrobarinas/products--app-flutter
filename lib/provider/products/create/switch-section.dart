// ignore_for_file: file_names
import 'package:flutter/material.dart';

class SwitchSectionProvider extends ChangeNotifier {

  bool _isAtributesProductActive    = false;
  bool _isGarantiaProductActive     = false;
  bool _isVariacionesProductActive  = false;

  bool get isAtributesProductActive => _isAtributesProductActive;

  set isAtributesProductActive(bool value) {
    _isAtributesProductActive = value;
    notifyListeners();
  }

  bool get isGarantiaProductActive => _isGarantiaProductActive;

  set isGarantiaProductActive(bool value) {
    _isGarantiaProductActive = value;
    notifyListeners();
  }

 bool get isVariacionesProductActive => _isVariacionesProductActive;

 set isVariacionesProductActive(bool value) {
  _isVariacionesProductActive = value;
  notifyListeners();
 }



}