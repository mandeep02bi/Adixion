import 'package:doctor/core/Theme/color_app.dart';
import 'package:doctor/Core/helper/image_assets.dart';
import 'package:doctor/Presentation/Prescription/AddperscriprionsecDr.dart';
import 'package:doctor/widgets/Add_patient/custom_header_widgets.dart';
import 'package:doctor/widgets/Add_patient/custom_text_field.dart';
import 'package:doctor/widgets/Add_prescription/Patien_widget.dart';
import 'package:doctor/widgets/Add_prescription/button_prescription.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Addperscriptionfirstdr extends StatefulWidget {
  const Addperscriptionfirstdr({super.key});

  @override
  State<Addperscriptionfirstdr> createState() => _AddperscriptionfirstdrState();
}

class _AddperscriptionfirstdrState extends State<Addperscriptionfirstdr> {

    // static const String backgroundImagePath = 'assets/images/background/05_Home screen.jpg';

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.scaffoldColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background/05_Home screen.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomHeaderWidgets(title: "Write a Prescription",currentStep: 1),

              const SizedBox(height: 16),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'PATIENT',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF808080),
                            letterSpacing: 1,
                          ),
                        ),

                        const SizedBox(height: 12),
                        const PatientWidgets(),

                        const SizedBox(height: 12),
                         CustomFormField(
                          label: 'DIAGNOSIS By Staff',
                          hint: 'Viral Fever & Throat Infection',
                          fieldFillColor: Color(0xFFF9FCFF),

                          icon: ImageAssets.stethoscope,
                          widthIcon: 18,
                          heightIcon: 18,
                        ),

                        const SizedBox(height: 12),
                         CustomFormField(
                          label: 'DIAGNOSIS',
                          hint: 'Cough',
                          fieldFillColor: Color(0xFFF9FCFF),

                          icon: ImageAssets.stethoscope,
                          widthIcon: 18,
                          heightIcon: 18,
                        ),

                        const SizedBox(height: 12),
                         CustomFormField(
                          label: 'Finding',
                          hint: 'Cough',
                          fieldFillColor: Color(0xFFF9FCFF),
                          icon: ImageAssets.stethoscope,
                          widthIcon: 18,
                          heightIcon: 18,
                        ),

                        const SizedBox(height: 12),

                        Row(
                          children: [
                            Expanded(
                              child: CustomFormField(
                                label: 'Height (cm)',
                                hint: '170',
                                fieldFillColor: Color(0xFFFFFFFF),
                                icon: ImageAssets.heightPrescription,
                                keyboardType: TextInputType.number,
                                widthIcon: 16,
                                heightIcon: 16,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: CustomFormField(
                                fieldFillColor: Color(0xFFFFFFFF),
                                icon: ImageAssets.weight,
                                label: 'Weight (kg)',
                                hint: '70',
                                widthIcon: 16,
                                heightIcon: 16,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: CustomFormField(
                                label: 'Height (cm)',
                                hint: '170',
                                fieldFillColor: Color(0xFFFFFFFF),
                                icon: ImageAssets.heightPrescription,
                                widthIcon: 16,
                                heightIcon: 16,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: CustomFormField(
                                fieldFillColor: Color(0xFFFFFFFF),
                                icon: ImageAssets.weight,
                                label: 'Weight (kg)',
                                hint: '70',
                                widthIcon: 16,
                                heightIcon: 16,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        CustomFormField(
                          label: 'DIAGNOSIS',
                          hint: 'Cough',
                          fieldFillColor: Color(0xFFF9FCFF),

                          icon: ImageAssets.stethoscope,
                          widthIcon: 18,
                          heightIcon: 18,
                        ),

                        const SizedBox(height: 12),
                        CustomFormField(
                          label: 'Finding',
                          hint: 'Cough',
                          fieldFillColor: Color(0xFFF9FCFF),
                          icon: ImageAssets.stethoscope,
                          widthIcon: 18,
                          heightIcon: 18,
                        ),
                        const SizedBox(height: 12),
                         CustomFormField(
                          label: 'DOCTOR’S NOTES',
                          hint:
                              'Add instructions, follow-up advice, restrictions...',
                          hintStyle: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF787878),
                          ),

                          fieldFillColor: Color(0xFFF9FCFF),
                          keyboardType: TextInputType.multiline,
                        ),

                        const SizedBox(height: 12),
                        CustomFormField(
                          label: 'FOLLOW-UP DATE',
                          hint: 'mm/dd/yyyy',
                          keyboardType: TextInputType.number,
                          fieldFillColor: Color(0xFFF9FCFF),
                          icon: ImageAssets.calender,
                          suffixIconPath: ImageAssets.data,
                          widthIcon: 12,
                          heightIcon: 12,
                        ),
                        SizedBox(height: 15),

                        ButtonPrescription(
                          onPressed: () {
                            Get.to(const Addperscriprionsecdr());
                          },
                        ),

                        SizedBox(height: 50),
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