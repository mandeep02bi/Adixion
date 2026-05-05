
import 'package:doctor/core/Theme/color_app.dart';
import 'package:doctor/Core/helper/image_assets.dart';
import 'package:doctor/Presentation/Reminder/widgets/custom_header_reminder.dart';
import 'package:doctor/Presentation/Reminder/widgets/reminder_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Reminder extends StatefulWidget {
  final bool isExpanded;

  const Reminder({super.key, this.isExpanded = false});

  @override
  State<Reminder> createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.scaffoldColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageAssets.backgroundImagePath2),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const CustomHeaderReminder(title: 'Set Reminder'),
              SizedBox(height: 10.h),
              const Expanded(
                child: ReminderListView(
                  users: [
                    {'name': 'Rishabh Singh', 'image': ImageAssets.at},
                    {'name': 'Rishabh Singh', 'image': ImageAssets.at},
                    {'name': 'Rishabh Singh', 'image': ImageAssets.at},
                    {'name': 'Rishabh Singh', 'image': ImageAssets.at},
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

