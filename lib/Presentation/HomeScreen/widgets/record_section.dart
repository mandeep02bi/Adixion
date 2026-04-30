import 'package:doctor/core/Theme/color_app.dart';
import 'package:doctor/Presentation/HomeScreen/widgets/record_card.dart';
import 'package:doctor/Presentation/MyTemplate/my_template.dart';
import 'package:doctor/Presentation/Patient/add_patient_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class RecordSection extends StatelessWidget {
  const RecordSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Record",
              style: TextStyle(
                fontSize: 18,
                fontFamily: "Rubik",
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Text(
              "See all",
              style: TextStyle(color: ColorApp.textColor, fontFamily: "Rubik"),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => Get.to(MyTemplate()),
                child: RecordCard(
                  items: "assets/Icons/temp.png",
                  itemname: "My Template",
                  subitemname: 'Your saved templates',
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: GestureDetector(
                onTap: () => Get.to(AddPatientScreen()),
                child: RecordCard(
                  items: "assets/Icons/patient2.png",
                  itemname: "Add Patient",
                  subitemname: 'All patient records',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
