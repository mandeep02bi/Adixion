
import 'package:animate_do/animate_do.dart';
import 'package:doctor/Core/helper/image_assets.dart';
import 'package:doctor/core/Theme/color_app.dart';
import 'package:doctor/Presentation/Patient/Patientlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class GridMenu extends StatelessWidget {
  const GridMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      "Patient List",
      // "Adixon patient app",
      "Appointments",
      "My Templates",
      "Send Notifications",
      "View Records",
    ];
    final itemsimage = [
      ImageAssets.patientListIcon,
      ImageAssets.appointmentIcon,
      ImageAssets.templateIcon,
      ImageAssets.notificationIocn,
      ImageAssets.reportIocn,
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.80,
      ),
      itemBuilder: (context, index) {
        return FadeInUp(
          delay: Duration(milliseconds: 100 * index),
          child: GestureDetector(
            onTap: () {
              if (items[index] == "Patient List") {
                Get.to(PatientListScreen());
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: ColorApp.textColor, width: 1),
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // CircleAvatar(radius: 18, backgroundColor: Colors.orange),
                  Image.asset(
                    itemsimage[index],
                    width: 45,
                    height: 42,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 5),
                  Text(
                    items[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Rubik",
                      fontSize: 12.3,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
