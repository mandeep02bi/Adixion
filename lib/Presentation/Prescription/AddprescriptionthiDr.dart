import 'package:doctor/core/Theme/color_app.dart';
import 'package:doctor/Core/helper/image_assets.dart';
import 'package:doctor/Data/Data_source/Medicine_datasource.dart';
import 'package:doctor/Data/model/medicine_model.dart';
import 'package:doctor/Presentation/Prescription/prescription_preview.dart';
import 'package:doctor/widgets/Add_patient/custom_button.dart';
import 'package:doctor/widgets/Add_patient/custom_header_widgets.dart';
import 'package:doctor/widgets/Add_patient/custom_section_title.dart';
import 'package:doctor/widgets/Add_patient/custom_text_field.dart';
import 'package:doctor/Presentation/Prescription/widgets/Patien_widget.dart';
import 'package:doctor/Presentation/Prescription/widgets/border_container.dart';
import 'package:doctor/Presentation/Prescription/widgets/button_prescription.dart';
import 'package:doctor/Presentation/Prescription/widgets/empty_state.dart';
import 'package:doctor/Presentation/Prescription/widgets/show_add_medicine_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Addperscriptionthirddr extends StatefulWidget {
  const Addperscriptionthirddr({super.key});

  @override
  State<Addperscriptionthirddr> createState() => _AddperscriptionthirddrState();
}

class _AddperscriptionthirddrState extends State<Addperscriptionthirddr> {
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
              const CustomHeaderWidgets(currentStep: 3),

              const SizedBox(height: 16),

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
                          fieldFillColor: Color(0xFFF9FCFF),

                          icon: ImageAssets.stethoscope,
                          widthIcon: 18,
                          heightIcon: 18,
                        ),
                        SizedBox(height: 15),

                        CustomSectionTitle(
                          icon: ImageAssets.lab,
                          title: 'Lab Test',
                          widthIcon: 25,
                          heightIcon: 23,
                        ),
                        SizedBox(height: 10),
                        FutureBuilder<List<MedicineModel>>(
                          future: MedicineDatabase.instance.getAllLabTests(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
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
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                        .deleteMedicine(
                                                          med.id!,
                                                        );
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
                                                        style: TextStyle(
                                                          color: Colors.purple,
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                await showAddMedicineSheet(
                                  context,
                                  title: 'Add Lab Test',
                                  nameOf: 'Name of Lab Test',
                                  name: 'Lab Test',
                                  textButtom: 'Add lab Test',
                                  iconButtom: ImageAssets.lab,
                                  showMedicineFields: false,
                                );

                                _refreshData();
                              },
                              text: 'Add Lab Test',
                              textStyle: TextStyle(color: ColorApp.textColor),
                              assetIcon: ImageAssets.add,
                              buttonColor: const Color(0xFFF9FCFF),
                            ),
                          ),
                        ),

                        ButtonPrescription(
                          text: 'Preview  Now',
                          isfinish: true,
                          onPressed: () {
                            Get.to(const PrescriptionPreviewPage());
                          },
                        ),
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
