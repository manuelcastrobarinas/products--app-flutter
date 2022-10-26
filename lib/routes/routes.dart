import 'package:flutter/material.dart';
import 'package:login/screens/despriction-product.dart';
import 'package:login/screens/products.dart';
import 'package:login/screens/login.dart';
import 'package:login/screens/new-product.dart';

Map<String, Widget Function(BuildContext)> routes = {
  'products'        :  (_) => const ProductsPage(),
  'login'           :  (_) => const LoginPage(), 
  'newProduct'      :  (_) => const NewProductsPage(),
  'description'     :  (_) => const DescriptionProductPage(),
};