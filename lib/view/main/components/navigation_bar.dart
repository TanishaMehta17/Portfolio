// import 'package:flutter/material.dart';
// import 'navigation_button_list.dart';

// class TopNavigationBar extends StatelessWidget {
//   const TopNavigationBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 40),
//       child: const Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           // Move the navbar upwards by adjusting the padding
//           // SizedBox(height: -5), // Move up by 20 pixels
//           Padding(
//             padding: EdgeInsets.only(bottom: 100.0),
//             child: NavigationButtonList(),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view%20model/responsive.dart';
import '../../../res/constants.dart';
import 'navigation_button_list.dart';
class TopNavigationBar extends StatelessWidget {
  const TopNavigationBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
         const Padding(
            padding: const EdgeInsets.all(defaultPadding),
           // child:!Responsive.isLargeMobile(context)? Image.asset('assets/images/triange_icon.png') : MenuButton(onTap: () => Scaffold.of(context).openDrawer(),),
          ),
          // if(Responsive.isLargeMobile(context)) MenuButton(),
          const Spacer(flex: 2,),
          if(!Responsive.isLargeMobile(context))  const NavigationButtonList(),
          const Spacer(flex: 2,),
         
          const Spacer(),
        ],
      ),
    );
  }
}
