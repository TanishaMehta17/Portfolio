import 'package:flutter/material.dart';
import 'dart:async'; // For the typewriter effect

class MyPortfolioText extends StatefulWidget {
  const MyPortfolioText({super.key, required this.start, required this.end});
  final double start;
  final double end;

  @override
  _MyPortfolioTextState createState() => _MyPortfolioTextState();
}

class _MyPortfolioTextState extends State<MyPortfolioText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  String _displayedText = '';
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration:
          const Duration(seconds: 5), // Duration for the gradient animation
    )..repeat(); // Repeat the animation continuously

    _startTyping(); // Start the typewriter effect
  }

  void _startTyping() {
    const String fullText = 'Hi I am Tanisha Mehta';
    const Duration typingDuration = Duration(milliseconds: 150);

    _timer = Timer.periodic(typingDuration, (timer) {
      if (_currentIndex < fullText.length) {
        setState(() {
          _displayedText += fullText[_currentIndex];
          _currentIndex++;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: widget.start, end: widget.end),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return Row(
          mainAxisSize: MainAxisSize
              .min, // Ensure the Row only takes up as much space as needed
          children: [
            ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(
                  colors: const [
                    Color(0xFF7be728), // Green
                    Color(0xFFf3265f), // Red/Pink
                    Color(0xFF7f40ac), // Purple
                    Color(0xFF7be728), // Green
                  ],
                  begin: Alignment(
                      -1 + 2 * _controller.value, 0), // Animate gradient
                  end: Alignment(1 + 2 * _controller.value, 0),
                  tileMode: TileMode.mirror,
                ).createShader(bounds);
              },
              child: Text(
                _displayedText, // This now holds the animated text
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontWeight: FontWeight.w900,
                      fontSize: value,
                      color: Colors
                          .white, // Default color to override the gradient
                    ),
              ),
            ),
          ],
        );
      },
    );
  }
}
