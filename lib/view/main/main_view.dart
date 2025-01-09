import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view%20model/controller.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:flutter_portfolio/view/main/components/navigation_bar.dart';
import '../../view model/responsive.dart';
import 'components/navigation_button_list.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class MainView extends StatelessWidget {
  const MainView({super.key, required this.pages});
  final List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    // Check if the view is mobile
    final isMobile = Responsive.isMobile(context);

    // Conditionally create the PageController
    final PageController? pageController = !isMobile ? controller : null;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            kIsWeb && !isMobile
                ? const SizedBox(height: defaultPadding * 2)
                : const SizedBox(height: defaultPadding / 2),

            // Navigation Bar visible on Desktop
            if (!isMobile) // Show navigation bar only on non-mobile views
              const SizedBox(
                height: 180,
                child: TopNavigationBar(),
              ),

            Expanded(
              flex: 9,
              child: PageView(
                scrollDirection: Axis.vertical,

                // // Adjust scroll physics based on screen size
                // physics: isMobile
                //     ? const AlwaysScrollableScrollPhysics() // Allow scrolling on mobile
                //     : const AlwaysScrollableScrollPhysics(), // Disable scrolling on desktop

                controller:
                    pageController, // Use the controller only if it's not a mobile view
                children: [...pages],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
