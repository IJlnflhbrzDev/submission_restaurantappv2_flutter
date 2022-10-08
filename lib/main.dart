import 'package:flutter/material.dart';
import 'package:submission_restaurantappv1/pages/home.dart';
import 'package:submission_restaurantappv1/splash_screen.dart';
import 'package:submission_restaurantappv1/theme/text_theme.dart';

import 'theme/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App V1',
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryColor,
              onPrimary: Colors.black,
            ),
        textTheme: textTheme,
        appBarTheme: AppBarTheme(
          backgroundColor: primaryColor,
          elevation: 0.0,
        ),
      ),
      routes: {
        Home.routeName: (context) => const Home(),
      },
      home: const Splash(),
    );
  }
}
