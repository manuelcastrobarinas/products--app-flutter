import 'package:flutter/material.dart';
import 'package:login/provider/products/create/switch-section.dart';
import 'package:login/provider/products/create/tag-selector.dart';
import 'package:login/routes/routes.dart';
import 'package:provider/provider.dart';
void main() => runApp(const AppProviderState());

class AppProviderState extends StatelessWidget {
  const AppProviderState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SwitchSectionProvider(), lazy: false),
        ChangeNotifierProvider(create: (_) => TagSelectorProvider(), lazy: false),
      ],
      child: const MyApp(),
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner : false,
      routes : routes,
      initialRoute : 'products',
      theme : ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[50],
      ),
    );
  }
}