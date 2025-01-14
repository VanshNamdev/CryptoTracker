import 'package:cryptotracker/views/compare_view.dart';
import 'package:cryptotracker/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:cryptotracker/views/dashboard_view.dart';

class AppRoutes {
  static const String dashboard = '/dashboard';
  static const String home = '/home'; // Example route for another page
  static const String compare = '/compare'; // Example route for another page

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case dashboard:
        return MaterialPageRoute(builder: (_) =>  DashboardView());
      case compare:
        return MaterialPageRoute(builder: (_) =>  CompareScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      default:
        return MaterialPageRoute(builder: (_) => const HomeView()
        );
    }
  }
}
