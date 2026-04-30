
import 'package:doctor/Presentation/Patient/add_patient_screen_address_and_location.dart';
import 'package:doctor/widgets/Add_patient/custom_button.dart';
import 'package:doctor/widgets/Add_patient/custom_header_widgets.dart';
import 'package:doctor/widgets/Add_patient/custom_section_title.dart';
import 'package:doctor/widgets/Add_patient/custom_text_field.dart';
import 'package:flutter/material.dart';

class MedicalInfoScreen extends StatefulWidget {
  const MedicalInfoScreen({super.key});

  @override
  State<MedicalInfoScreen> createState() => _MedicalInfoScreenState();
}

class _MedicalInfoScreenState extends State<MedicalInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  static const String backgroundImagePath =
      'assets/images/background/05_Home screen.jpg';

  String? selectedBloodGroup;
  final List<String> bloodGroups = [
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(backgroundImagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const CustomHeaderWidgets(currentStep: 2),

              Expanded(
                child: Stack(
                  children: [
                    Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomSectionTitle(
                              icon: 'assets/images/Icons/Patient/Add/Medicine.png',
                              title: 'Vitals',
                              widthIcon: 18,
                              heightIcon: 18,
                            ),
                            const SizedBox(height: 20),

                            _buildLabel("BLOOD GROUP"),
                            const SizedBox(height: 8),
                            _buildBloodGroupDropdown(),

                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomFormField(
                                    label: "Height (CM)",
                                    hint: "170",
                                    icon:
                                        'assets/images/Icons/Patient/Add/Height.png',
                                    widthIcon: 16,
                                    heightIcon: 16,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: CustomFormField(
                                    label: "Weight (KG)",
                                    hint: "65",
                                    icon:
                                        'assets/images/Icons/Patient/Add/Weight.png',
                                    widthIcon: 16,
                                    heightIcon: 16,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomFormField(
                                    label: "Pulse",
                                    hint: "170",
                                    icon:
                                        'assets/images/Icons/Patient/Add/Pulse.png',
                                    widthIcon: 19,
                                    heightIcon: 19,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: CustomFormField(
                                    label: "Respiratory Rate",
                                    hint: "65",
                                    icon:
                                        'assets/images/Icons/Patient/Add/Heart.png',
                                    widthIcon: 22,
                                    heightIcon: 22,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 30),

                            // const CustomSectionTitle(
                            //   icon: 'assets/images/Icons/Patient/Add/File.png',
                            //   title: 'Medical History',
                            //   widthIcon: 18,
                            //   heightIcon: 18,
                            // ),
                            // const SizedBox(height: 20),

                            // CustomFormField(
                            //   label: "Known Allergies",
                            //   hint: "E.g. Penicillin, Peanuts, Latex...",
                            //   keyboardType: TextInputType.multiline,
                            // ),

                            // const SizedBox(height: 20),
                            // CustomFormField(
                            //   label: "Past Medical History",
                            //   hint:
                            //       "E.g. Diabetes (Type 2), Previous Surgeries...",
                            //   keyboardType: TextInputType.multiline,
                            // ),

                            const SizedBox(height: 40),
                            CustomButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          AddPatientScreenAddressAndLocation(),
                                    ),
                                  );
                                }
                              },
                              text: 'Continue',
                              icon: Icons.arrow_forward,
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBloodGroupDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: "Select Blood Group",
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            'assets/images/Icons/Patient/Add/Blood.png',
            width: 18,
            height: 18,
            color: Colors.redAccent,
          ),
        ),
        filled: true,
        fillColor: const Color(0xFFF8FEFB),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF0F6E56)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF0F6E56), width: 1.2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF0F6E56)),
        ),
      ),
      initialValue: selectedBloodGroup,
      items: bloodGroups
          .map((group) => DropdownMenuItem(value: group, child: Text(group)))
          .toList(),
      onChanged: (val) => setState(() => selectedBloodGroup = val),
    );
  }

  Widget _buildLabel(String text) => Text(
    text,
    style: const TextStyle(
      fontSize: 11,
      color: Colors.grey,
      fontWeight: FontWeight.bold,
    ),
  );
}
