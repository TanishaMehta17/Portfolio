import 'package:flutter/material.dart';
import 'navigation_button_list.dart';

class TopNavigationBar extends StatelessWidget {
  const TopNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Move the navbar upwards by adjusting the padding
          // SizedBox(height: -5), // Move up by 20 pixels
          Padding(
            padding: EdgeInsets.only(bottom: 100.0),
            child: NavigationButtonList(),
          ),
        ],
      ),
    );
  }
}
