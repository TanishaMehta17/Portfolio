import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:flutter_portfolio/view%20model/responsive.dart';
import 'package:flutter_portfolio/view/contact/contact.dart';
import 'package:flutter_portfolio/view/projects/components/title_text.dart';

class ContactView extends StatelessWidget {
  ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isLargeMobile(context))
            const SizedBox(
              height: defaultPadding,
            ),
          const TitleText(prefix: ' Reach ', title: 'Me'),
          const SizedBox(
            height: defaultPadding,
          ),
          Expanded(child: ContactForm())
        ],
      ),
    );
  }
}
