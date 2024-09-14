import 'package:flutter/material.dart';
import 'package:madhokenterprises/screens/wheelSizeCalculatorScreen.dart';
import 'package:madhokenterprises/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wheel Size Calculator',
 
      initialRoute: "/",
      routes: {
        "/": (context) => SplashScreen(),
        "inputPage": (context) => WheelSizeCalculatorScreen(),
      },
    );
  }
}



