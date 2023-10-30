import 'package:flutter/material.dart';
import 'package:portfolio_cv_assessment/initialize_singletons.dart';
import 'package:portfolio_cv_assessment/views/screens/login_screen.dart';
import 'package:portfolio_cv_assessment/views/themes/app_theme.dart';

// Define a GlobalKey for the ScaffoldMessengerState
GlobalKey<ScaffoldMessengerState> scaff = GlobalKey<ScaffoldMessengerState>();

// Define a GlobalKey for the NavigatorState
GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();

// The entry point of the Flutter app
void main() {
  runApp(const MyApp());
  initializeSingletons(); // Initialize any singletons required for the app
}

// Define the main application widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey:
          scaff, // Assign the GlobalKey to the ScaffoldMessenger
      navigatorKey: navigatorKey, // Assign the GlobalKey to the Navigator
      title: 'Adetoyese Matthew',
      debugShowCheckedModeBanner: false,
      theme:
          AppThemeData().darkAppTheme, // Set the app theme using AppThemeData
      home: const SignIN(), // Set the initial screen to SignIN widget
    );
  }
}
