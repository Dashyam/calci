// import 'package:flutter/material.dart';
//
// class SplashScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Future.delayed(const Duration(seconds: 1), () {
//       Navigator.pushReplacementNamed(context, "inputPage");
//     });
//
//     return const Scaffold(
//       backgroundColor: Colors.blueAccent,
//       body: Center(
//         child: Text(
//           'Wheel Size Calculator',
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:madhokenterprises/screens/wheelSizeCalculatorScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Animation duration
      vsync: this,
    );

    // Define the animation
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    // Start the animation
    _controller.forward();

    // Navigate to the main screen after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>
              WheelSizeCalculatorScreen(), // The main screen after the splash
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the controller to free resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent, // Set background color
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.asset('assets/logo.png' // Path to your logo image

              ),
              const SizedBox(height: 20), // Spacing between logo and text
              const Text(
                'Wheel Size Calculator', // App name text
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}