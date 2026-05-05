import 'package:doctor/widgets/Add_patient/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddPatientScreenAddressAndLocation extends StatelessWidget {
  const AddPatientScreenAddressAndLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        const CustomFormField(
          label: 'Street address',
          hint: 'House No., Street, Area...',
          keyboardType: TextInputType.multiline,
        ),
        SizedBox(height: 20.h),
        CustomFormField(
          label: 'City / District',
          hint: 'Jaipur',
          icon: 'assets/images/Icons/Patient/Add/Skyscraper.png',
          widthIcon: 18.w,
          heightIcon: 18.h,
        ),
      ],
    );
  }
}

