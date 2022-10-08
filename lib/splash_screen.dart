import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:submission_restaurantappv1/pages/home.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: double.infinity,
      duration: 1500,
      splash: 'assets/splash.png',
      backgroundColor: const Color.fromARGB(255, 237, 235, 235),
      nextScreen: const Home(),
      splashTransition: SplashTransition.sizeTransition,
    );
  }
}
