import 'package:doctor/Core/Controller.dart/addpatientcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPatientScreena extends StatelessWidget {
  AddPatientScreena({super.key});

  final controller = Get.put(AddPatientController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF2F5),

      body: Stack(
        children: [

          /// 🔥 HEADER
          _buildHeader(),

          /// 🔥 FORM
          Positioned.fill(
            top: 180,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// TITLE
                  const Text("Personal Information",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.teal)),

                  const SizedBox(height: 20),

                  /// NAME
                  Row(
                    children: [
                      Expanded(child: _field("First Name", "Rishabh")),
                      const SizedBox(width: 10),
                      Expanded(child: _field("Last Name", "Singh")),
                    ],
                  ),

                  const SizedBox(height: 15),

                  _field("Phone Number", "+91 98765 43210"),
                  const SizedBox(height: 15),

                  _field("Email Address", "Patient@email.com"),
                  const SizedBox(height: 15),

                  _field("Date of Birth", "mm/dd/yyyy"),

                  const SizedBox(height: 20),

                  /// GENDER
                  const Text("GENDER"),
                  const SizedBox(height: 10),

                  Obx(() => Row(
                        children: [
                          _gender("Male"),
                          _gender("Female"),
                          _gender("Other"),
                        ],
                      )),

                  const SizedBox(height: 30),

                  /// BUTTON
                  _continueButton(),

                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// ================= HEADER =================
  Widget _buildHeader() {
    return Container(
      height: 220,
      padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF2F80ED), Color(0xFF8E2DE2)],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// TOP
          Row(
            children: const [
              Icon(Icons.arrow_back, color: Colors.white),
              SizedBox(width: 10),
              Text("Add New Patient",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ],
          ),

          const SizedBox(height: 20),

          /// STEP INDICATOR
          Row(
            children: [
              _step(true),
              _line(),
              _step(false),
              _line(),
              _step(false),
            ],
          ),

          const SizedBox(height: 10),

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Personal", style: TextStyle(color: Colors.white)),
              Text("Medical", style: TextStyle(color: Colors.white70)),
              Text("Address", style: TextStyle(color: Colors.white70)),
            ],
          )
        ],
      ),
    );
  }

  Widget _step(bool active) {
    return CircleAvatar(
      radius: 10,
      backgroundColor: active ? Colors.white : Colors.white30,
    );
  }

  Widget _line() {
    return Expanded(
      child: Container(height: 3, color: Colors.white30),
    );
  }

  /// ================= TEXT FIELD =================
  Widget _field(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label.toUpperCase(),
            style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 5),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  /// ================= GENDER =================
  Widget _gender(String text) {
    final controller = Get.find<AddPatientController>();

    return Obx(() {
      bool selected = controller.selectedGender.value == text;

      return GestureDetector(
        onTap: () => controller.selectGender(text),
        child: Container(
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: selected ? Colors.green.shade100 : Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(text),
        ),
      );
    });
  }

  /// ================= BUTTON =================
  Widget _continueButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      alignment: Alignment.center,
      child: const Text("Continue →",
          style: TextStyle(color: Colors.white, fontSize: 16)),
    );
  }
}