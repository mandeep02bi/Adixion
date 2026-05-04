import 'package:doctor/Presentation/Prescription/widgets/container_medicen.dart';
import 'package:doctor/core/Theme/color_app.dart';
import 'package:doctor/Core/helper/image_assets.dart';
import 'package:doctor/Data/Data_source/Medicine_datasource.dart';
import 'package:doctor/Data/model/medicine_model.dart';
import 'package:doctor/widgets/Add_patient/custom_button.dart';
import 'package:doctor/widgets/Add_patient/custom_section_title.dart';
import 'package:doctor/widgets/Add_patient/custom_text_field.dart';
import 'package:doctor/Presentation/Prescription/widgets/Patien_widget.dart';
import 'package:doctor/Presentation/Prescription/widgets/empty_state.dart';
import 'package:flutter/material.dart';

class Addperscriptionthirddr extends StatefulWidget {
  const Addperscriptionthirddr({super.key});

  @override
  State<Addperscriptionthirddr> createState() => _AddperscriptionthirddrState();
}

class _AddperscriptionthirddrState extends State<Addperscriptionthirddr> {
  late Future<List<MedicineModel>> _labTestsFuture;

  @override
  void initState() {
    super.initState();
    _labTestsFuture = MedicineDatabase.instance.getAllLabTests();
  }

  void _refreshData() {
    setState(() {
      _labTestsFuture = MedicineDatabase.instance.getAllLabTests();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                    fieldFillColor: const Color(0xFFF9FCFF),
                    icon: ImageAssets.stethoscope,
                    widthIcon: 18,
                    heightIcon: 18,
                  ),
                  const SizedBox(height: 15),

                  CustomSectionTitle(
                    icon: ImageAssets.lab,
                    title: 'Lab Test',
                    widthIcon: 25,
                    heightIcon: 23,
                  ),
                  const SizedBox(height: 10),

                  // 4. استخدام المتغير هنا
                  FutureBuilder<List<MedicineModel>>(
                    future: _labTestsFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      final labTests = snapshot.data ?? [];
                      if (labTests.isEmpty) {
                        return EmptyState(
                          icon: ImageAssets.lab,
                          subtitle: 'Tap below to add Lab Test',
                          title: 'No Lab Test add yet',
                        );
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: labTests.length,
                        itemBuilder: (context, index) {
                          final med = labTests[index];
                          return Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFF9FCFF),
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.1),
                              ),
                            ),
                            margin: const EdgeInsets.only(
                              bottom: 12,
                            ), // ضفت دي عشان التحاليل متلزقش في بعض
                            padding: const EdgeInsets.all(
                              16,
                            ), // ضفت دي عشان الشكل يبقى متناسق زي الأدوية
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
                                                TextSpan(
                                                  text:
                                                      "How: ${med.instruction}",
                                                  style: const TextStyle(
                                                    color: Colors.purple,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ],
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

                  // 5. شلنا كلمة const وضفنا onAdded
                  ContainerMedicen(
                    title: 'Add Lab Test',
                    nameOf: 'Name of Lab Test',
                    name: 'Lab Test',
                    showMedicineFields: false,
                    onAdded:
                        _refreshData, // استدعاء دالة الريفرش عشان التحليل يظهر فوراً
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
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
