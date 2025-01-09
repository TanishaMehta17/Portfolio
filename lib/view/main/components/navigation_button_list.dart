// import 'package:flutter/material.dart';
// import 'package:flutter_portfolio/view%20model/controller.dart';
// import 'navigation_button.dart';

// class NavigationButtonList extends StatelessWidget {
//   const NavigationButtonList({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return  TweenAnimationBuilder(tween: Tween(begin: 0.0,end: 1.0), duration: const Duration(milliseconds: 200), builder: (context, value, child) {
//       return Transform.scale(
//         scale: value,
//         child: Row(
//           children: [
//             NavigationTextButton(onTap: () {controller.animateToPage(0, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);}, text: 'Home'),
       
//             NavigationTextButton(onTap: () {controller.animateToPage(1, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);}, text: 'Projects'),
//             NavigationTextButton(onTap: () {controller.animateToPage(2, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);}, text: 'Certifications'),
//                         NavigationTextButton(onTap: () {controller.animateToPage(3, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);}, text: 'Experience'),
//             NavigationTextButton(onTap: () {controller.animateToPage(4, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);}, text: 'Contacts'),
//           ],
//         ),
//       );
//     },);
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view%20model/controller.dart';
import 'package:flutter_portfolio/view%20model/responsive.dart';
import 'navigation_button.dart';

class NavigationButtonList extends StatefulWidget {
  const NavigationButtonList({super.key});

  @override
  _NavigationButtonListState createState() => _NavigationButtonListState();
}

class _NavigationButtonListState extends State<NavigationButtonList> {
  int _activeIndex = 0; // Tracks the currently active button

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Row(
            children: [
              NavigationTextButton(
                onTap: () {
                  setState(() {
                    _activeIndex = 0; // Set active button index
                  });
                  controller.animateToPage(0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                text: 'Home',
                isActive: _activeIndex == 0, // Activate if current index is 0
              ),
              if(!Responsive.isLargeMobile(context))
              NavigationTextButton(
                onTap: () {
                  setState(() {
                    _activeIndex = 1;
                  });
                  controller.animateToPage(1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                text: 'Projects',
                isActive: _activeIndex == 1,
              ),
              NavigationTextButton(
                onTap: () {
                  setState(() {
                    _activeIndex = 2;
                  });
                  controller.animateToPage(2,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                text: 'Certifications',
                isActive: _activeIndex == 2,
              ),
              NavigationTextButton(
                onTap: () {
                  setState(() {
                    _activeIndex = 3;
                  });
                  controller.animateToPage(3,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                text: 'Experience',
                isActive: _activeIndex == 3,
              ),
              NavigationTextButton(
                onTap: () {
                  setState(() {
                    _activeIndex = 4;
                  });
                  controller.animateToPage(4,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                text: 'Contacts',
                isActive: _activeIndex == 4,
              ),
            ],
          ),
        );
      },
    );
  }
}

