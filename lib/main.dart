import 'package:flutter/material.dart';
import 'config/app_theme.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const BintanTravelApp());
}

class BintanTravelApp extends StatelessWidget {
  const BintanTravelApp({super.key}); // Tambahkan constructor dengan key

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bintan Travel',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
