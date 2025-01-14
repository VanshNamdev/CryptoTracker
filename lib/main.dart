import 'package:cryptotracker/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:cryptotracker/themes/color_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CryptoTracker',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.home, 
      onGenerateRoute: AppRoutes.generateRoute, 
    );
  }
}
