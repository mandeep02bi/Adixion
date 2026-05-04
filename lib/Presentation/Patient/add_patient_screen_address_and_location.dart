import 'package:doctor/widgets/Add_patient/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddPatientScreenAddressAndLocation extends StatelessWidget {
  const AddPatientScreenAddressAndLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),

        const SizedBox(height: 20),

        CustomFormField(
          label: 'Street address',
          hint: 'House No., Street, Area...',
          keyboardType: TextInputType.multiline,
        ),

        const SizedBox(height: 20),

        CustomFormField(
          label: 'City / District',
          hint: 'Jaipur',
          icon: 'assets/images/Icons/Patient/Add/Skyscraper.png',
          widthIcon: 18,
          heightIcon: 18,
        ),
      ],
    );
  }
}
