import 'package:flutter/material.dart';
import 'package:tms/presentation/screens/login_screen.dart';
import 'package:tms/presentation/screens/sheet_select_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/select':
        return MaterialPageRoute(
          builder: (_) => const SheetSelectScreen(),
        );
      case '/':
      default:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
    }
  }
}
