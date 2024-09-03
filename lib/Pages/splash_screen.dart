import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'home_page.dart'; // Import the HomePage widget

class BallBounceIndex extends StatefulWidget {
  const BallBounceIndex({super.key});

  @override
  State<BallBounceIndex> createState() => _BallBounceIndexState();
}

class _BallBounceIndexState extends State<BallBounceIndex> {
  @override
  void initState() {
    super.initState();
    // Navigate to HomePage after animation duration
    Future.delayed(const Duration(seconds: 9), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          // Linear Gradient Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF00008B), // Deep Blue
                  Color(0xFF800080), // Purple
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 130),
              child: const CircleAvatar(
                backgroundColor: Color.fromARGB(255, 66, 8, 141),
              )
                  .animate()
                  .slideY(begin: -0.5, end: 0.2, duration: 0.9.seconds)
                  .then(delay: 200.milliseconds)
                  .slideY(end: -0.3, duration: 0.9.seconds)
                  .then(delay: 200.milliseconds)
                  .slideY(end: 0.1, duration: 0.5.seconds)
                  .then(delay: 1.seconds)
                  .scaleXY(end: 20, duration: 2.seconds)
                  .then(delay: 2.seconds),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: FlutterLogo(
              size: 80,
            )
                .animate()
                .fadeIn(delay: 4.seconds, duration: 900.milliseconds)
                .slideX(begin: 3, duration: 0.5.seconds),
          ),
        ],
      ),
    );
  }
}
