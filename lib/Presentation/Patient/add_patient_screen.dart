import 'package:doctor/Core/theme/color_app.dart';
import 'package:doctor/Presentation/Patient/add_patient_screen_address_and_location.dart';
import 'package:doctor/widgets/Add_patient/custom_button.dart';
import 'package:doctor/widgets/Add_patient/custom_gender_selection.dart';
import 'package:doctor/widgets/Add_patient/custom_header_widgets.dart';
import 'package:doctor/widgets/Add_patient/custom_section_title.dart';
import 'package:doctor/widgets/Add_patient/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddPatientScreen extends StatefulWidget {
  const AddPatientScreen({super.key});

  @override
  State<AddPatientScreen> createState() => _AddPatientScreenState();
}

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

class _AddPatientScreenState extends State<AddPatientScreen> {
  final _formKey = GlobalKey<FormState>();

  String selectedGender = "Male";

  final TextEditingController _dobController = TextEditingController();

  static const String backgroundImagePath =
      'assets/images/background/05_Home screen.jpg';

  @override
  void dispose() {
    _dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF2F5),

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
              const CustomHeaderWidgets(),

              Expanded(child: Stack(children: [_buildForm()])),
            ],
          ),
        ),
      ),
    );
  }

  //  FORM
  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSectionTitle(
              icon: 'assets/images/Icons/Patient/Add/add.png',
              title: 'Personal Information',
              widthIcon: 14.14,
              heightIcon: 18,
            ),
            const SizedBox(height: 25),

            Row(
              children: [
                Expanded(
                  child: CustomFormField(
                    label: "First Name",
                    hint: "Rishabh",
                    icon: 'assets/images/Icons/Patient/Add/e.png',
                    widthIcon: 16,
                    heightIcon: 16,
                    textColor: Color(0xFF888A8E),
                    validator: (v) =>
                        v!.isEmpty ? "Please enter first name" : null,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: CustomFormField(
                    label: "Last Name",
                    icon: 'assets/images/Icons/Patient/Add/e.png',
                    hint: "Singh",
                    textColor: Color(0xFF888A8E),
                    validator: (v) =>
                        v!.isEmpty ? "Please enter last name" : null,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            CustomFormField(
              label: "Phone Number",
              hint: "+91 98765 43210",
              icon: 'assets/images/Icons/Patient/Add/p.png',
              heightIcon: 16,
              widthIcon: 16,
              textColor: Color(0xFF888A8E),
              keyboardType: TextInputType.phone,
              validator: (v) => v!.length < 10 ? "Invalid phone number" : null,
            ),

            const SizedBox(height: 20),

            CustomFormField(
              label: "Email Address",
              hint: "patient@email.com",
              icon: 'assets/images/Icons/Patient/Add/m.png',
              heightIcon: 14.21,
              widthIcon: 16,
              textColor: Color(0xFF888A8E),
              keyboardType: TextInputType.emailAddress,
              validator: (v) => v!.isEmpty ? "Please enter email" : null,
            ),

            const SizedBox(height: 20),

            CustomFormField(
              label: "Date of Birth",
              hint: "mm/dd/yyyy",
              icon: 'assets/images/Icons/Patient/Add/do.png',
              isDateField: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime(2000),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );

                if (pickedDate != null) {
                  _dobController.text =
                      "${pickedDate.month}/${pickedDate.day}/${pickedDate.year}";
                }
              },

              keyboardType: TextInputType.datetime,
              widthIcon: 14,
              heightIcon: 17.11,
              suffixIcon: Icons.calendar_month,
              textColor: Colors.black,
              controller: _dobController,
              validator: (v) => v!.isEmpty ? "Please enter DOB" : null,
            ),

            const SizedBox(height: 20),

            CustomFormField(
              label: "Age",
              hint: "21",
              icon: 'assets/images/Icons/Patient/Add/m.png',
              heightIcon: 14.21,
              widthIcon: 16,
              textColor: Color(0xFF888A8E),
              keyboardType: TextInputType.emailAddress,
              validator: (v) => v!.isEmpty ? "Please enter Age" : null,
            ),
            const SizedBox(height: 20),

            const Text(
              "GENDER",
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            CustomGenderSelection(
              initialValue: selectedGender,
              onGenderChanged: (val) {
                setState(() {
                  selectedGender = val;
                });
              },
            ),
            const SizedBox(height: 20),
            CustomSectionTitle(
              title: 'Blood group',
              textStyle: TextStyle(
                fontSize: 12,
                color: ColorApp.labelColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _buildBloodGroupDropdown(),
            const AddPatientScreenAddressAndLocation(),

            const SizedBox(height: 40),

            CustomButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (_) => MedicalInfoScreen()),
                  // );
                }
              },
              text: 'Continue',
              icon: Icons.arrow_forward,
            ),

            const SizedBox(height: 30),
          ],
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
}
