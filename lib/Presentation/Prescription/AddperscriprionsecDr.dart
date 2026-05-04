import 'package:doctor/Presentation/Prescription/widgets/container_medicen.dart';
import 'package:doctor/Presentation/Prescription/widgets/show_add_medicine_sheet.dart';
import 'package:doctor/core/Theme/color_app.dart';
import 'package:doctor/Core/helper/image_assets.dart';
import 'package:doctor/Data/Data_source/Medicine_datasource.dart';
import 'package:doctor/Data/model/medicine_model.dart';
import 'package:doctor/widgets/Add_patient/custom_button.dart';
import 'package:doctor/widgets/Add_patient/custom_section_title.dart';
import 'package:doctor/widgets/Add_patient/custom_text_field.dart';
import 'package:doctor/Presentation/Prescription/widgets/Patien_widget.dart';
import 'package:doctor/Presentation/Prescription/widgets/border_container.dart';
import 'package:flutter/material.dart';

class Addperscriprionsecdr extends StatefulWidget {
  const Addperscriprionsecdr({super.key});

  @override
  State<Addperscriprionsecdr> createState() => _AddperscriprionsecdrState();
}

class _AddperscriprionsecdrState extends State<Addperscriprionsecdr> {
  late Future<List<MedicineModel>> _medicinesFuture;

  @override
  void initState() {
    super.initState();
    _medicinesFuture = MedicineDatabase.instance.getAllMedicines();
  }

  void _refreshData() {
    setState(() {
      _medicinesFuture = MedicineDatabase.instance.getAllMedicines();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
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
              const SizedBox(height: 8),
              const PatientWidgets(),
              const SizedBox(height: 16),

              CustomFormField(
                label: 'DIAGNOSIS',
                hint: 'Viral Fever & Throat Infection',
                fieldFillColor: const Color(0xFFF9FCFF),
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
                future: _medicinesFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          await MedicineDatabase.instance
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
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "${med.qty} tablet",
                                              style: const TextStyle(
                                                color: Color(0xFF64748B),
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 20),
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
                                            Icons.calendar_today_outlined,
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
                                      Expanded(
                                        child: Text(
                                          med.instruction,
                                          style: const TextStyle(
                                            color: Color(0xFF64748B),
                                            fontSize: 13,
                                          ),
                                          overflow: TextOverflow.ellipsis,
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

              ContainerMedicen(
                showMedicineFields: true,
                onAdded: _refreshData, 
              ),

              const SizedBox(height: 25),
              CustomButton(
                onPressed: () {},
                height: 45.83,
                width: 130,
                assetIcon: ImageAssets.drft,
                text: 'Prescribe',
                textStyle: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: ColorApp.textColor,
                ),
                buttonColor: Colors.transparent,
                border: Border.all(color: ColorApp.textColor, width: 1),
              ),

              const SizedBox(height: 24),
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
