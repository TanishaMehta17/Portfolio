import 'package:flutter/material.dart';

class NavigationTextButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool isActive;

  const NavigationTextButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: ShaderMask(
        shaderCallback: (bounds) {
          return isActive
              ? const LinearGradient(
                  colors: [Colors.pinkAccent, Colors.blue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds)
              : const LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white
                  ], // Fallback gradient for non-active state
                ).createShader(bounds);
        },
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20, // Increase the font size here
                color: Colors.white, // Default text color
              ),
        ),
      ),
    );
  }
}

