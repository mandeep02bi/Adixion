import 'package:doctor/Core/widgets/custom_button.dart';
import 'package:doctor/Presentation/Prescription/AddprescriptionthiDr.dart';
import 'package:doctor/Presentation/Prescription/widgets/custom_hader_preview.dart';
import 'package:doctor/core/Theme/color_app.dart';
import 'package:doctor/Core/helper/image_assets.dart';
import 'package:doctor/Presentation/Prescription/AddperscriprionsecDr.dart';
import 'package:doctor/widgets/Add_patient/custom_text_field.dart';
import 'package:doctor/Presentation/Prescription/widgets/Patien_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Addperscriptionfirstdr extends StatefulWidget {
  const Addperscriptionfirstdr({super.key});

  @override
  State<Addperscriptionfirstdr> createState() => _AddperscriptionfirstdrState();
}

class _AddperscriptionfirstdrState extends State<Addperscriptionfirstdr>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.scaffoldColor,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background/05_Home screen.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomHaderPreview(title: "Write a Prescription"),
              OrientationBuilder(
                builder: (context, orientation) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: TabBar(
                      controller: _tabController,
                      labelColor: ColorApp.hintColor,
                      unselectedLabelColor: const Color(0xFF808080),
                      labelStyle: TextStyle(
                        fontSize: orientation == Orientation.portrait ? 11.sp : 9.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      unselectedLabelStyle: TextStyle(
                        fontSize: orientation == Orientation.portrait ? 11.sp : 9.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      indicatorColor: ColorApp.hintColor,
                      indicatorWeight: 1.h,
                      indicatorSize: TabBarIndicatorSize.label,
                      dividerColor: const Color(0xFFE0E0E0),
                      tabs: const [
                        Tab(text: 'Case History'),
                        Tab(text: 'Medical'),
                        Tab(text: 'Lab Test'),
                      ],
                    ),
                  );
                },
              ),

              SizedBox(height: 12.h),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildCaseHistoryTab(),
                    const Addperscriprionsecdr(),
                    const Addperscriptionthirddr(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCaseHistoryTab() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PATIENT',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF808080),
                letterSpacing: 1.w,
              ),
            ),
            SizedBox(height: 12.h),
            const PatientWidgets(),
            SizedBox(height: 12.h),
            CustomFormField(
              label: 'DIAGNOSIS By Staff',
              hint: 'Viral Fever & Throat Infection',
              fieldFillColor: const Color(0xFFF9FCFF),
              icon: ImageAssets.stethoscope,
              widthIcon: 18.w,
              heightIcon: 18.h,
            ),
            SizedBox(height: 12.h),
            CustomFormField(
              label: 'DIAGNOSIS',
              hint: 'Cough',
              fieldFillColor: const Color(0xFFF9FCFF),
              icon: ImageAssets.stethoscope,
              widthIcon: 18.w,
              heightIcon: 18.h,
            ),
            SizedBox(height: 12.h),
            CustomFormField(
              label: 'Finding',
              hint: 'Cough',
              fieldFillColor: const Color(0xFFF9FCFF),
              icon: ImageAssets.stethoscope,
              widthIcon: 18.w,
              heightIcon: 18.h,
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Expanded(
                  child: CustomFormField(
                    label: 'Height (cm)',
                    hint: '170',
                    fieldFillColor: const Color(0xFFFFFFFF),
                    icon: ImageAssets.heightPrescription,
                    keyboardType: TextInputType.number,
                    widthIcon: 16.w,
                    heightIcon: 16.h,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: CustomFormField(
                    fieldFillColor: const Color(0xFFFFFFFF),
                    icon: ImageAssets.weight,
                    label: 'Weight (kg)',
                    hint: '70',
                    widthIcon: 16.w,
                    heightIcon: 16.h,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Expanded(
                  child: CustomFormField(
                    label: 'Height (cm)',
                    hint: '170',
                    fieldFillColor: const Color(0xFFFFFFFF),
                    icon: ImageAssets.heightPrescription,
                    widthIcon: 16.w,
                    heightIcon: 16.h,
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: CustomFormField(
                    fieldFillColor: const Color(0xFFFFFFFF),
                    icon: ImageAssets.weight,
                    label: 'Weight (kg)',
                    hint: '70',
                    widthIcon: 16.w,
                    heightIcon: 16.h,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            CustomFormField(
              label: 'DIAGNOSIS',
              hint: 'Cough',
              fieldFillColor: const Color(0xFFF9FCFF),
              icon: ImageAssets.stethoscope,
              widthIcon: 18.w,
              heightIcon: 18.h,
            ),
            SizedBox(height: 12.h),
            CustomFormField(
              label: 'Finding',
              hint: 'Cough',
              fieldFillColor: const Color(0xFFF9FCFF),
              icon: ImageAssets.stethoscope,
              widthIcon: 18.w,
              heightIcon: 18.h,
            ),
            SizedBox(height: 12.h),
            CustomFormField(
              label: "Treatment or Advice",
              hint: 'Add instructions, follow-up advice, restrictions...',
              hintStyle: TextStyle(
                fontSize: 12.sp,
                color: const Color(0xFF787878),
              ),
              fieldFillColor: const Color(0xFFF9FCFF),
              keyboardType: TextInputType.multiline,
            ),
            SizedBox(height: 12.h),
            CustomFormField(
              label: "Chest Complaint",
              hint: 'Add instructions, follow-up advice, restrictions...',
              hintStyle: TextStyle(
                fontSize: 12.sp,
                color: const Color(0xFF787878),
              ),
              fieldFillColor: const Color(0xFFF9FCFF),
              keyboardType: TextInputType.multiline,
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Expanded(
                  child: CustomFormField(
                    label: 'Spo2',
                    hint: '170',
                    fieldFillColor: const Color(0xFFFFFFFF),
                    icon: ImageAssets.heightPrescription,
                    widthIcon: 16.w,
                    heightIcon: 16.h,
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: CustomFormField(
                    fieldFillColor: const Color(0xFFFFFFFF),
                    icon: ImageAssets.weight,
                    label: 'Respriotry',
                    hint: '70',
                    widthIcon: 16.w,
                    heightIcon: 16.h,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            CustomFormField(
              label: "DOCTOR'S NOTES",
              hint: 'Add instructions, follow-up advice, restrictions...',
              hintStyle: TextStyle(
                fontSize: 12.sp,
                color: const Color(0xFF787878),
              ),
              fieldFillColor: const Color(0xFFF9FCFF),
              keyboardType: TextInputType.multiline,
            ),
            SizedBox(height: 12.h),
            CustomFormField(
              label: 'FOLLOW-UP DATE',
              hint: 'mm/dd/yyyy',
              keyboardType: TextInputType.number,
              fieldFillColor: const Color(0xFFF9FCFF),
              icon: ImageAssets.calender,
              suffixIconPath: ImageAssets.data,
              widthIcon: 12.w,
              heightIcon: 12.h,
            ),
            SizedBox(height: 25.h),
            CustomButton(
              onPressed: () {},
              height: 45.83.h,
              width: 130.w,
              icon: ImageAssets.drft,
              text: 'Prescribe',
              textStyle: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
                color: ColorApp.textColor,
              ),
              buttonColor: Colors.transparent,
              border: Border.all(color: ColorApp.textColor, width: 1.w),
            ),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}

