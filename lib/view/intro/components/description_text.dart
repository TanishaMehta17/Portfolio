import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/constants.dart';

import '../../../view model/responsive.dart';

class AnimatedDescriptionText extends StatelessWidget {
  const AnimatedDescriptionText(
      {super.key, required this.start, required this.end});
  final double start;
  final double end;

  @override
  Widget build(BuildContext context) {
    // Getting screen size using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Adjusting font size based on screen width
    double responsiveFontSize = screenWidth * 0.045;

    return TweenAnimationBuilder(
      tween: Tween(begin: start, end: end),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return Container(
          width: screenWidth * 0.34, // Container takes 90% of screen width
          height: screenHeight * 0.38, // Fixed height, can adjust as needed
          padding: const EdgeInsets.all(16.0), // Add padding for better spacing
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12.0), // Rounded corners
          ),
          child: const Text(
            "Versatile Full Stack Developer specializing in Flutter, Spring Boot, and NodeJS."
            "I excel in building and optimizing RESTful APIs, managing scalable databases"
            "and delivering seamless, high-performance applications through impactful"
            "projects and internships. I bring a dynamic blend of technical prowess"
            "and creative problem-solving to the forefront of every endeavor.",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20, // Adjust font size dynamically
              wordSpacing: 2,
            ),
            softWrap: true, // Allow text to wrap to the next line
          ),
        );
      },
    );
  }
}
