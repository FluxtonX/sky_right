import 'package:flutter/material.dart';
import 'package:sky_rightz_360/view/forgot_password_screen.dart';
import 'package:sky_rightz_360/view/sign_in_screen.dart';
import 'package:sky_rightz_360/view/sign_up_screen.dart';
import 'view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sky Rightz 360',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2962FF)),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
