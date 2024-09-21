import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view%20model/controller.dart';
import 'package:flutter_portfolio/view%20model/responsive.dart';
import 'navigation_button.dart';

class NavigationButtonList extends StatefulWidget {
  const NavigationButtonList({Key? key}) : super(key: key);

  @override
  _NavigationButtonListState createState() => _NavigationButtonListState();
}

class _NavigationButtonListState extends State<NavigationButtonList> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = controller;
    _pageController.addListener(_onPageChanged);
  }

  void _onPageChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _pageController.removeListener(_onPageChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      top: 0,
      child: TweenAnimationBuilder(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 200),
        builder: (context, value, child) {
          return Transform.scale(
            scale: value,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NavigationTextButton(
                  onTap: () {
                    controller.animateToPage(0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                  text: 'Home',
                  isActive: controller.page == 0, // Check if active
                ),
                if (!Responsive.isLargeMobile(context))
                  NavigationTextButton(
                    onTap: () {
                      controller.animateToPage(1,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    text: 'Projects',
                    isActive: controller.page == 1,
                  ),
                NavigationTextButton(
                  onTap: () {
                    controller.animateToPage(2,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                  text: 'Certifications',
                  isActive: controller.page == 2,
                ),
                NavigationTextButton(
                  onTap: () {
                    controller.animateToPage(3,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                  text: 'Experience',
                  isActive: controller.page == 3,
                ),
                NavigationTextButton(
                  onTap: () {
                    controller.animateToPage(4,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                  text: 'Contacts',
                  isActive: controller.page == 4,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
