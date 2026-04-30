import 'package:doctor/core/Theme/color_app.dart';
import 'package:doctor/Core/helper/image_assets.dart';
import 'package:doctor/Data/Data_source/Medicine_datasource.dart';
import 'package:doctor/Data/model/medicine_model.dart';
import 'package:doctor/Presentation/Prescription/AddprescriptionthiDr.dart';
import 'package:doctor/widgets/Add_patient/custom_button.dart';
import 'package:doctor/widgets/Add_patient/custom_header_widgets.dart';
import 'package:doctor/widgets/Add_patient/custom_section_title.dart';
import 'package:doctor/widgets/Add_patient/custom_text_field.dart';
import 'package:doctor/widgets/Add_prescription/Patien_widget.dart';
import 'package:doctor/widgets/Add_prescription/border_container.dart';
import 'package:doctor/widgets/Add_prescription/button_prescription.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Addperscriprionsecdr extends StatefulWidget {
  const Addperscriprionsecdr({super.key});

  @override
  State<Addperscriprionsecdr> createState() => _AddperscriprionsecdrState();
}

class _AddperscriprionsecdrState extends State<Addperscriprionsecdr> {
   void _refreshData() {
    setState(() {});
  }

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomHeaderWidgets(currentStep: 2),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 18),
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
                      const SizedBox(height: 8),
                      const PatientWidgets(),
                      const SizedBox(height: 16),

                       CustomFormField(
                        label: 'DIAGNOSIS',
                        hint: 'Viral Fever & Throat Infection',
                        fieldFillColor: Color(0xFFF9FCFF),
                        icon: ImageAssets.stethoscope,
                        widthIcon: 18,
                        heightIcon: 18,
                      ),
                      const SizedBox(height: 16),

                       CustomSectionTitle(
                        icon: ImageAssets.drugs,
                        title: 'MEDICINES',
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: ColorApp.labelColor,
                        ),
                        widthIcon: 20,
                        heightIcon: 20,
                      ),
                      const SizedBox(height: 12),

                      FutureBuilder<List<MedicineModel>>(
                        future: MedicineDatabase.instance.getAllMedicines(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          final medicines = snapshot.data ?? [];

                          if (medicines.isEmpty) {
                            return _buildEmptyState();
                          }

                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: medicines.length,
                            itemBuilder: (context, index) {
                              final med = medicines[index];
                              return Container(
                                margin: const EdgeInsets.only(bottom: 12),
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF9FCFF),
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                    color: Colors.grey.withOpacity(0.1),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      ImageAssets.baneg,
                                      width: 30,
                                      height: 30,
                                    ),
                                    const SizedBox(width: 12),

                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  med.medicineName,
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xFF333333),
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () async {
                                                  await MedicineDatabase
                                                      .instance
                                                      .deleteMedicine(med.id!);
                                                  _refreshData();
                                                },
                                                child: const Icon(
                                                  Icons.delete_outline,
                                                  color: Color(0xFFE57373),
                                                  size: 24,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),

                                          Row(
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    const TextSpan(
                                                      text: "Dosage: ",
                                                      style: TextStyle(
                                                        color: Colors.purple,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: "${med.qty} tablet",
                                                      style: const TextStyle(
                                                        color: Color(
                                                          0xFF64748B,
                                                        ),
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 20),
                                              // Frequency
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.access_time,
                                                    size: 14,
                                                    color: Color(0xFF4DB6AC),
                                                  ),
                                                  const SizedBox(width: 4),
                                                  Text(
                                                    med.frequency,
                                                    style: const TextStyle(
                                                      color: Color(0xFF64748B),
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 6),

                                          Row(
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons
                                                        .calendar_today_outlined,
                                                    size: 14,
                                                    color: Color(0xFF4DB6AC),
                                                  ),
                                                  const SizedBox(width: 4),
                                                  Text(
                                                    "${med.noOfDays} days",
                                                    style: const TextStyle(
                                                      color: Color(0xFF64748B),
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(width: 25),
                                              // Instruction
                                              Expanded(
                                                child: Text(
                                                  med.instruction,
                                                  style: const TextStyle(
                                                    color: Color(0xFF64748B),
                                                    fontSize: 13,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),

                      const SizedBox(height: 15),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 10,
                        ),
                        child: DashedBorderContainer(
                          child: CustomButton(
                            height: 50,
                            width: 335,
                            onPressed: () async {
                              await _showAddMedicineSheet(context);
                              _refreshData();
                            },
                            text: 'Add Medicine',
                            textStyle: TextStyle(color: ColorApp.textColor),
                            subText: ImageAssets.add,
                            // buttonColor: const Color(0xFFF9FCFF),
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),
                       CustomFormField(
                        label: 'DOCTOR\'S NOTES',
                        hint:
                            'Add instructions, follow-up advice, restrictions...',
                        hintStyle: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF787878),
                        ),
                        fieldFillColor: Color(0xFFF9FCFF),
                        keyboardType: TextInputType.multiline,
                      ),
                      const SizedBox(height: 16),
                       CustomFormField(
                        label: 'FOLLOW-UP DATE',
                        hint: 'mm/dd/yyyy',
                        fieldFillColor: Color(0xFFF9FCFF),
                        icon: ImageAssets.calender,
                        suffixIconPath: ImageAssets.data,
                        widthIcon: 16,
                        heightIcon: 16,
                      ),
                      const SizedBox(height: 25),
                      ButtonPrescription(onPressed: () {
                        Get.to(const Addperscriptionthirddr());
                      }),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: DashedBorderContainer(
        child: Container(
          height: 154,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorApp.scaffoldColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImageAssets.drugs, width: 40, height: 40),
              const SizedBox(height: 6),
              Text(
                'No medicines add yet',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ColorApp.gery2,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Tap below to add medicines',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: ColorApp.gery1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _showAddMedicineSheet(BuildContext context) async {
  final medicineNameController = TextEditingController();
  final qtyController = TextEditingController();
  final frequencyController = TextEditingController();
  final routeFormController = TextEditingController();
  final noOfDaysController = TextEditingController();
  final instructionController = TextEditingController();

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.85,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 5,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(
                      ImageAssets.remove,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Add Medicine",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Name of Medicine / Product",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: ColorApp.labelColor,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "T.Qty",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: ColorApp.labelColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: CustomFormField(
                        controller: medicineNameController,
                        label: '',
                        hint: 'Medicine Name',
                        icon: ImageAssets.stethoscope,
                        fieldFillColor: Color(0xFFF9FCFF),
                        widthIcon: 18,
                        heightIcon: 18,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomFormField(
                        controller: qtyController,
                        label: '',
                        hint: 'Qty',
                        fieldFillColor: Color(0xFFF9FCFF),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                // Save and Add + Choose Template buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: CustomButton(
                        width: 150,
                        height: 50,
                        onPressed: () {},
                        text: 'Save and Add ',
                        textStyle: TextStyle(
                          fontSize: 12,
                          color: ColorApp.textColor,
                        ),
                        border: Border.all(color: ColorApp.textColor, width: 1),
                        buttonColor: ColorApp.scaffoldColor,
                        subText: ImageAssets.drft,
                      ),
                    ),
                    Expanded(
                      child: CustomButton(
                        width: 180,
                        height: 50,
                        onPressed: () {},
                        text: 'Choose Template ',
                        subText: ImageAssets.drft,
                        textStyle: TextStyle(
                          fontSize: 12,
                          color: ColorApp.textColor,
                        ),
                        border: Border.all(color: ColorApp.textColor, width: 1),
                        buttonColor: ColorApp.scaffoldColor,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // FREQUENCY + ROUTE/FORM labels
                Row(
                  children: [
                    Expanded(
                      child: CustomFormField(
                        controller: frequencyController,
                        label: 'Frequency',
                        hint: '170',
                        icon: ImageAssets.heightPrescription,
                        widthIcon: 16,
                        heightIcon: 16,
                        fieldFillColor: ColorApp.scaffoldColor,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomFormField(
                        controller: routeFormController,
                        label: 'Route/ form',
                        hint: '65',
                        icon: ImageAssets.weight,
                        widthIcon: 16,
                        heightIcon: 16,
                        fieldFillColor: ColorApp.scaffoldColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                Row(
                  children: [
                    Expanded(
                      child: CustomFormField(
                        controller: noOfDaysController,
                        label: 'No of Days',
                        hint: '170',
                        icon: ImageAssets.heightPrescription,
                        widthIcon: 16,
                        heightIcon: 16,
                        fieldFillColor: ColorApp.scaffoldColor,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomFormField(
                        controller: instructionController,
                        label: 'Instruction',
                        hint: '65',
                        icon: ImageAssets.weight,
                        widthIcon: 16,
                        heightIcon: 16,
                        fieldFillColor: ColorApp.scaffoldColor,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                 CustomFormField(
                  label: 'Additional Comments',
                  hint: "Add instructions, follow-up advice, restictions...",
                  hintStyle: TextStyle(
                    fontSize: 12,
                    color: ColorApp.labelColor,
                  ),
                  keyboardType: TextInputType.multiline,
                  fieldFillColor: Color(0xFFF9FCFF),
                ),
                const SizedBox(height: 20),

                Center(
                  child: CustomButton(
                    onPressed: () async {
                      if (medicineNameController.text.trim().isEmpty) return;

                      final medicine = MedicineModel(
                        medicineName: medicineNameController.text.trim(),
                        qty: qtyController.text.trim(),
                        frequency: frequencyController.text.trim(),
                        routeForm: routeFormController.text.trim(),
                        noOfDays: noOfDaysController.text.trim(),
                        instruction: instructionController.text.trim(),
                      );

                      await MedicineDatabase.instance.insertMedicine(medicine);
                      if (context.mounted) Navigator.pop(context);
                    },
                    text: 'Add Medicine',
                    height: 70,
                    width: 200,
                    subText: ImageAssets.drugs,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}