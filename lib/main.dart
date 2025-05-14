import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ECR App',
      theme: ThemeData(
        primaryColor: const Color(0xFF2196F3), // Blue from logo
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2196F3),
          primary: const Color(0xFF2196F3),
          secondary: const Color(0xFF03A9F4), // Lighter blue accent
        ),
        fontFamily: 'Cairo',
        textTheme: TextTheme(
          bodyLarge: const TextStyle(fontFamily: 'Cairo'),
          bodyMedium: const TextStyle(fontFamily: 'Cairo'),
          bodySmall: const TextStyle(fontFamily: 'Cairo'),
          displayLarge: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.bold),
          displayMedium: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.bold),
          displaySmall: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.bold),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2196F3)),
            ),
          ],
        ),
      ),
    );
  }
}
