import 'package:doctor/core/Theme/color_app.dart';
import 'package:doctor/Core/helper/image_assets.dart';
import 'package:doctor/Presentation/MyTemplate/widgets/consent_template.dart';
import 'package:doctor/Presentation/MyTemplate/widgets/lab_template.dart';
import 'package:doctor/Presentation/MyTemplate/widgets/medicine_template.dart';
import 'package:doctor/widgets/Add_patient/custom_button.dart';
import 'package:doctor/Presentation/Prescription/widgets/show_add_medicine_sheet.dart';
import 'package:flutter/material.dart';

class CustomHeaderTemplate extends StatefulWidget {
  final String title;
  final Widget? bottomCard;
  final ValueChanged<int>? onTabChanged;

  const CustomHeaderTemplate({
    super.key,
    required this.title,
    this.bottomCard,
    this.onTabChanged,
  });

  @override
  State<CustomHeaderTemplate> createState() => _CustomHeaderTemplateState();
}

class _CustomHeaderTemplateState extends State<CustomHeaderTemplate> {
  int _selectedIndex = 0;

  bool _isActive(int tabIndex) => _selectedIndex == tabIndex;

  void _onTabTap(int index) {
    setState(() => _selectedIndex = index);
    widget.onTabChanged?.call(index);
  }

  Widget _buildTabContent() {
    switch (_selectedIndex) {
      case 0:
        return const MedicineTemplate();
      case 1:
        return const LabTemplate();
      case 2:
        return const ConsentTemplate();
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              height: 152,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    ImageAssets.headerPrescription,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: Image.asset(
                                    ImageAssets.backBottom,
                                    width: 35,
                                    height: 35.61,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  widget.title,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                if (_selectedIndex == 0) {
                                  showAddMedicineSheet(context);
                                } else if (_selectedIndex == 1) {
                                  showAddMedicineSheet(
                                    context,
                                    title: 'Add Lab Test',
                                    nameOf: 'Name of Lab Test',
                                    name: 'Lab Test',
                                    textButtom: 'Add lab Test',
                                    iconButtom: ImageAssets.lab,
                                    showMedicineFields: false,
                                  );
                                } else if (_selectedIndex == 2) {
                                  showAddMedicineSheet(
                                    context,
                                    title: 'Add Consent',
                                    nameOf: 'Consent Title',
                                    name: ' Consent',
                                    textButtom: 'Consent',
                                    iconButtom: ImageAssets.consent,
                                    customButtom: SizedBox.shrink(),
                                    showMedicineFields: false,
                                  );
                                }
                              },
                              child: Image.asset(
                                ImageAssets.addBottom,
                                width: 35,
                                height: 35.61,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              CustomButton(
                                onPressed: () => _onTabTap(0),
                                text: 'Medicine',
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: _isActive(0)
                                      ? ColorApp.textColor
                                      : Colors.white,
                                ),
                                buttonColor: _isActive(0)
                                    ? ColorApp.scaffoldColor
                                    : Colors.transparent,
                                border: _isActive(0)
                                    ? null
                                    : Border.all(
                                        color: Colors.white,
                                        width: 1.5,
                                      ),
                                assetIcon: ImageAssets.drugs,
                                heighticon: 18,
                                widthicon: 18,
                                height: 45,
                                width: 123,
                              ),
                              const SizedBox(width: 10),
                              CustomButton(
                                onPressed: () => _onTabTap(1),
                                text: 'Lab Test',
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: _isActive(1)
                                      ? ColorApp.textColor
                                      : Colors.white,
                                ),
                                buttonColor: _isActive(1)
                                    ? ColorApp.scaffoldColor
                                    : Colors.transparent,
                                border: _isActive(1)
                                    ? null
                                    : Border.all(
                                        color: Colors.white,
                                        width: 1.5,
                                      ),
                                assetIcon: ImageAssets.lab,
                                heighticon: 25,
                                widthicon: 23,
                                height: 45,
                                width: 123,
                              ),
                              const SizedBox(width: 10),
                              CustomButton(
                                onPressed: () => _onTabTap(2),
                                text: 'Consent',
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: _isActive(2)
                                      ? ColorApp.textColor
                                      : Colors.white,
                                ),
                                buttonColor: _isActive(2)
                                    ? ColorApp.scaffoldColor
                                    : Colors.transparent,
                                border: _isActive(2)
                                    ? null
                                    : Border.all(
                                        color: Colors.white,
                                        width: 1.5,
                                      ),
                                assetIcon: ImageAssets.consent,
                                heighticon: 23,
                                widthicon: 23,
                                height: 45,
                                width: 123,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (widget.bottomCard != null)
              Positioned(
                bottom: -50,
                left: 16,
                right: 16,
                child: widget.bottomCard!,
              ),
          ],
        ),

        _buildTabContent(),
      ],
    );
  }
}
