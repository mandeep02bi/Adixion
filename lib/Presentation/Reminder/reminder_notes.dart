
import 'package:doctor/core/Theme/color_app.dart';
import 'package:doctor/Core/helper/image_assets.dart';
import 'package:doctor/Presentation/Reminder/widgets/custom_header_reminder.dart';
import 'package:doctor/Presentation/Reminder/widgets/date_reminder_picker.dart';
import 'package:doctor/widgets/Add_patient/custom_section_title.dart';
import 'package:doctor/widgets/Add_patient/custom_text_field.dart';
import 'package:flutter/material.dart';

class ReminderNotes extends StatelessWidget {
  const ReminderNotes({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomHeaderReminder(title: 'Set Reminder'),
              const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              children: [
                                Image.asset(
                                  ImageAssets.at,
                                  width: 40.51,
                                  height: 38.51,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    'Rishabh Singh',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF1A1A2E),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        const CustomSectionTitle(
                          icon: ImageAssets.drugs,
                          title: 'Reminder',
                          widthIcon: 18,
                          heightIcon: 18,
                        ),
                        SizedBox(height: 10),
                         CustomFormField(
                          label: 'TITLE',
                          hint: 'Select Blood Group',
                          hintStyle: TextStyle(
                            fontSize: 11,
                            color: ColorApp.labelTextColor,
                          ),
                          fieldFillColor: ColorApp.scaffoldColor,
                          icon: ImageAssets.blood,
                          heightIcon: 18,
                          widthIcon: 18,
                        ),
                        SizedBox(height: 10),
                         CustomFormField(
                          label: 'DESCRIPTION',
                          hint: 'e.g. Penicillin, Peanuts, Latex...',
                          hintStyle: TextStyle(
                            fontSize: 11,
                            color: ColorApp.labelTextColor,
                          ),
                          fieldFillColor: ColorApp.scaffoldColor,
                          keyboardType: TextInputType.multiline,
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'Select Date',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF2C2C2C),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 15),
                        const DateReminderPicker(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
