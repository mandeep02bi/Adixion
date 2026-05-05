import 'package:doctor/Core/theme/color_app.dart';
import 'package:doctor/Presentation/Patient/add_patient_screen_address_and_location.dart';
import 'package:doctor/widgets/Add_patient/custom_button.dart';
import 'package:doctor/widgets/Add_patient/custom_gender_selection.dart';
import 'package:doctor/widgets/Add_patient/custom_header_widgets.dart';
import 'package:doctor/widgets/Add_patient/custom_section_title.dart';
import 'package:doctor/widgets/Add_patient/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      backgroundColor: const Color(0xFFEFF2F5),
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
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSectionTitle(
              icon: 'assets/images/Icons/Patient/Add/add.png',
              title: 'Personal Information',
              widthIcon: 14.w,
              heightIcon: 18.h,
            ),
            SizedBox(height: 25.h),
            Row(
              children: [
                Expanded(
                  child: CustomFormField(
                    label: "First Name",
                    hint: "Rishabh",
                    icon: 'assets/images/Icons/Patient/Add/e.png',
                    widthIcon: 16.w,
                    heightIcon: 16.h,
                    textColor: const Color(0xFF888A8E),
                    validator: (v) =>
                        v!.isEmpty ? "Please enter first name" : null,
                  ),
                ),
                SizedBox(width: 15.w),
                Expanded(
                  child: CustomFormField(
                    label: "Last Name",
                    icon: 'assets/images/Icons/Patient/Add/e.png',
                    hint: "Singh",
                    textColor: const Color(0xFF888A8E),
                    validator: (v) =>
                        v!.isEmpty ? "Please enter last name" : null,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            CustomFormField(
              label: "Phone Number",
              hint: "+91 98765 43210",
              icon: 'assets/images/Icons/Patient/Add/p.png',
              heightIcon: 16.h,
              widthIcon: 16.w,
              textColor: const Color(0xFF888A8E),
              keyboardType: TextInputType.phone,
              validator: (v) => v!.length < 10 ? "Invalid phone number" : null,
            ),
            SizedBox(height: 20.h),
            CustomFormField(
              label: "Email Address",
              hint: "patient@email.com",
              icon: 'assets/images/Icons/Patient/Add/m.png',
              heightIcon: 14.h,
              widthIcon: 16.w,
              textColor: const Color(0xFF888A8E),
              keyboardType: TextInputType.emailAddress,
              validator: (v) => v!.isEmpty ? "Please enter email" : null,
            ),
            SizedBox(height: 20.h),
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
              widthIcon: 14.w,
              heightIcon: 17.h,
              suffixIcon: Icons.calendar_month,
              textColor: Colors.black,
              controller: _dobController,
              validator: (v) => v!.isEmpty ? "Please enter DOB" : null,
            ),
            SizedBox(height: 20.h),
            CustomFormField(
              label: "Age",
              hint: "21",
              icon: 'assets/images/Icons/Patient/Add/m.png',
              heightIcon: 14.h,
              widthIcon: 16.w,
              textColor: const Color(0xFF888A8E),
              keyboardType: TextInputType.number,
              validator: (v) => v!.isEmpty ? "Please enter Age" : null,
            ),
            SizedBox(height: 20.h),
            Text(
              "GENDER",
              style: TextStyle(
                fontSize: 11.sp,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            CustomGenderSelection(
              initialValue: selectedGender,
              onGenderChanged: (val) {
                setState(() {
                  selectedGender = val;
                });
              },
            ),
            SizedBox(height: 20.h),
            CustomSectionTitle(
              title: 'Blood group',
              textStyle: TextStyle(
                fontSize: 12.sp,
                color: ColorApp.labelColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            _buildBloodGroupDropdown(),
            const AddPatientScreenAddressAndLocation(),
            SizedBox(height: 40.h),
            CustomButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Logic
                }
              },
              text: 'Continue',
              icon: Icons.arrow_forward,
            ),
            SizedBox(height: 30.h),
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
          padding: EdgeInsets.all(10.w),
          child: Image.asset(
            'assets/images/Icons/Patient/Add/Blood.png',
            width: 18.w,
            height: 18.h,
            color: Colors.redAccent,
          ),
        ),
        filled: true,
        fillColor: const Color(0xFFF8FEFB),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: Color(0xFF0F6E56)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: Color(0xFF0F6E56), width: 1.2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: Color(0xFF0F6E56)),
        ),
      ),
      initialValue: selectedBloodGroup,
      items: bloodGroups
          .map((group) => DropdownMenuItem(
              value: group,
              child: Text(group, style: TextStyle(fontSize: 14.sp))))
          .toList(),
      onChanged: (val) => setState(() => selectedBloodGroup = val),
    );
  }
}

