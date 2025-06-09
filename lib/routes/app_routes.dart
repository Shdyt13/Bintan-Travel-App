import 'package:flutter/material.dart';
import '../screens/splash_screen.dart';
import '../screens/login_screen.dart';
import '../screens/home_screen.dart';
import '../screens/register_screen.dart'; // ✅ Tambahkan import ini

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register'; // ✅ Tambahkan ini
  static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case register: // ✅ Tambahkan ini
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Page Not Found'))),
        );
    }
  }
}
