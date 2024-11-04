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

// 2

// import 'package:flutter/material.dart';
// import 'package:madhokenterprises/screens/wheelSizeCalculatorScreen.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with TickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();

//     // Initialize animation controller
//     _controller = AnimationController(
//       duration: const Duration(seconds: 2), // Animation duration
//       vsync: this,
//     );

//     // Define the animation
//     _animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeInOut,
//     );

//     // Start the animation
//     _controller.forward();

//     // Navigate to the main screen after 3 seconds
//     Future.delayed(Duration(seconds: 3), () {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(
//           builder: (context) =>
//               WheelSizeCalculatorScreen(), // The main screen after the splash
//         ),
//       );
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose(); // Dispose of the controller to free resources
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueAccent, // Set background color
//       body: Center(
//         child: FadeTransition(
//           opacity: _animation,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [

//               Image.asset('assets/logo.png' // Path to your logo image

//               ),
//               const SizedBox(height: 20), // Spacing between logo and text
//               const Text(
//                 'Wheel Size Calculator', // App name text
//                 style: TextStyle(
//                   fontSize: 24,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


//   3

import 'package:flutter/material.dart';
import 'package:madhokenterprises/main.dart';
import 'package:madhokenterprises/screens/wheelSizeCalculatorScreen.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late VideoPlayerController _controller;
  late AnimationController _textAnimationController;
  late Animation<double> _textAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize video controller
    _controller = VideoPlayerController.asset('assets/animation.mp4')
      ..initialize().then((_) {
        setState(
            () {}); // To ensure the video is displayed after initialization
        _controller.setLooping(false); // Video will not loop
        _controller.setVolume(0.0); // Mute the video
        _controller.play(); // Start playing the video

        // Listen to video completion to navigate after it finishes
        _controller.addListener(() {
          if (_controller.value.position == _controller.value.duration) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => WheelSizeCalculatorScreen()),
            );
          }
        });
      });

    // Initialize text animation controller (for blinking effect)
    _textAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // One blink duration
    )..repeat(reverse: true); // Blinking animation repeats

    _textAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _textAnimationController, curve: Curves.easeIn),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _textAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Video player with controlled size
            if (_controller.value.isInitialized)
              SizedBox(
                width: 200, // Adjust the width of the video
                height: 200, // Adjust the height of the video
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
              )
            else
              CircularProgressIndicator(), // Loading indicator if video is not ready

            const SizedBox(height: 10), // Space between video and text

            // Blinking text animation
            FadeTransition(
              opacity: _textAnimation,
              child: const Text(
                'SPINNING THE NUMBERS',
                style: TextStyle(
                  fontSize: 25,
                  color: Color.fromRGBO(8, 98, 234, 1),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}