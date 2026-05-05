
import 'package:doctor/core/Theme/color_app.dart';
import 'package:doctor/Core/helper/image_assets.dart';
import 'package:doctor/Presentation/Reminder/widgets/custom_header_reminder.dart';
import 'package:doctor/Presentation/Reminder/widgets/date_reminder_picker.dart';
import 'package:doctor/widgets/Add_patient/custom_section_title.dart';
import 'package:doctor/widgets/Add_patient/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              SizedBox(height: 10.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 70.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 8.r,
                                offset: Offset(0, 2.h),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: Row(
                              children: [
                                Image.asset(
                                  ImageAssets.at,
                                  width: 40.w,
                                  height: 38.h,
                                ),
                                SizedBox(width: 12.w),
                                Expanded(
                                  child: Text(
                                    'Rishabh Singh',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF1A1A2E),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        CustomSectionTitle(
                          icon: ImageAssets.drugs,
                          title: 'Reminder',
                          widthIcon: 18.w,
                          heightIcon: 18.h,
                        ),
                        SizedBox(height: 10.h),
                        CustomFormField(
                          label: 'TITLE',
                          hint: 'Select Blood Group',
                          hintStyle: TextStyle(
                            fontSize: 11.sp,
                            color: ColorApp.labelTextColor,
                          ),
                          fieldFillColor: ColorApp.scaffoldColor,
                          icon: ImageAssets.blood,
                          heightIcon: 18.h,
                          widthIcon: 18.w,
                        ),
                        SizedBox(height: 10.h),
                        CustomFormField(
                          label: 'DESCRIPTION',
                          hint: 'e.g. Penicillin, Peanuts, Latex...',
                          hintStyle: TextStyle(
                            fontSize: 11.sp,
                            color: ColorApp.labelTextColor,
                          ),
                          fieldFillColor: ColorApp.scaffoldColor,
                          keyboardType: TextInputType.multiline,
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          'Select Date',
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: const Color(0xFF2C2C2C),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 15.h),
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

