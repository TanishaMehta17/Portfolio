import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/model/experience_model.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../res/constants.dart';
import '../../../view model/getx_controllers/experience_controller.dart';

class ExperienceStack extends StatelessWidget {
  final controller = Get.put(ExperienceController());
  final int index;

  ExperienceStack({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        controller.onHover(index, value);
      },
      onTap: () {},
      borderRadius: BorderRadius.circular(30),
      child: Container(
        // width: 800,
        padding: const EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: bgColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // The content is now scrollable if it overflows
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Experience Name
                    Text(
                      experienceList[index].name,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: defaultPadding),

                    // Role and Date
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          experienceList[index].role,
                          style: const TextStyle(color: Colors.amber),
                        ),
                        Text(
                          experienceList[index].date,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(height: defaultPadding / 2),

                    // Skills and Contributions
                    Text.rich(
                      TextSpan(
                        text: 'Contribution: ',
                        style: const TextStyle(color: Colors.white),
                        children: [
                          TextSpan(
                            text: experienceList[index].description,
                            style: const TextStyle(
                              color: Colors.grey,
                              // overflow: TextOverflow.ellipsis
                            ),
                          ),
                        ],
                      ),
                      // maxLines: 8, // Adjust max lines as needed
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: defaultPadding),

            // Credential Button should be inside the container
            Center(
              child: InkWell(
                onTap: () {
                  launchUrl(Uri.parse(experienceList[index].link));
                },
                child: Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      colors: [Colors.pink, Colors.blue.shade900],
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.blue,
                        offset: Offset(0, -1),
                        blurRadius: 5,
                      ),
                      BoxShadow(
                        color: Colors.red,
                        offset: Offset(0, 1),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Credentials',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        CupertinoIcons.arrow_turn_up_right,
                        color: Colors.white,
                        size: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
