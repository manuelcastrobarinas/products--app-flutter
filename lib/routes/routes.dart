import 'package:flutter/material.dart';
import 'package:login/screens/home.dart';
import 'package:login/screens/login.dart';

Map<String, Widget Function(BuildContext)> routes = {
  'home'    :  (_) => const HomePage(),
  'login'   :  (_) => const LoginPage(), 
};