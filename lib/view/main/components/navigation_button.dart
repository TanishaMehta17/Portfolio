// import 'package:flutter/material.dart';

// class NavigationTextButton extends StatelessWidget {
//   final VoidCallback onTap;
//   final String text;

//   const NavigationTextButton(
//       {super.key, required this.onTap, required this.text});

//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//         onPressed: onTap,
//         child: Text(
//           text,
//           style: Theme.of(context)
//               .textTheme
//               .labelMedium!
//               .copyWith(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
//         ));
//   }
// }
import 'package:flutter/material.dart';

class NavigationTextButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool isActive; // Flag to determine if this button is active

  const NavigationTextButton(
      {super.key, required this.onTap, required this.text, required this.isActive});

  @override
  Widget build(BuildContext context) {
    // Determine screen size
    final isDesktopOrLaptop = MediaQuery.of(context).size.width >= 1024;

    return TextButton(
      onPressed: onTap,
      child: isActive
          ? ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [Colors.pink, Colors.blue.shade900], // Apply gradient to the text color
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(
                Rect.fromLTWH(0, 0, bounds.width, bounds.height),
              ),
              child: Text(
                text,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: isDesktopOrLaptop ? 20 : null, // Change font size based on screen width
                      color: Colors.white, // Color will be overridden by gradient
                    ),
              ),
            )
          : Text(
              text,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: isDesktopOrLaptop ? 20 : null, // Change font size based on screen width
                    color: Colors.white, // Inactive state color
                  ),
            ),
    );
  }
}
