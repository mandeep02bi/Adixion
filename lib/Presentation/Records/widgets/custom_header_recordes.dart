import 'package:doctor/core/Theme/color_app.dart';
import 'package:doctor/Core/helper/image_assets.dart';
import 'package:doctor/widgets/Add_patient/custom_button.dart';
import 'package:doctor/widgets/Add_prescription/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomHeaderRecordes extends StatefulWidget {
  final String title;
  final Widget? bottomCard;
  final ValueChanged<int>? onTabChanged;

  const CustomHeaderRecordes({
    super.key,
    required this.title,
    this.bottomCard,
    this.onTabChanged,
  });

  @override
  State<CustomHeaderRecordes> createState() => _CustomHeaderRecordesState();
}

class _CustomHeaderRecordesState extends State<CustomHeaderRecordes> {
  int _selectedIndex = 0;

  bool _isActive(int tabIndex) => _selectedIndex == tabIndex;

  void _onTabTap(int index) {
    setState(() => _selectedIndex = index);
    widget.onTabChanged?.call(index);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      ImageAssets.headeRecordes,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              widget.title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: const CustomTextFormField(
                                label: '',
                                hint: 'Type here to search',
                                hintStyle: TextStyle(
                                  fontSize: 11,
                                  color: ColorApp.scaffoldColor,
                                  fontWeight: FontWeight.w400,
                                ),
                                heightIcon: 38,
                                widthIcon: 283,
                                fieldFillColor: Colors.transparent,
                                borderColor: ColorApp.scaffoldColor,
                                focusedBorderColor: ColorApp.scaffoldColor,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              height: 44,
                              width: 52,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'Go',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: ColorApp.hintColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              _buildTab('Prescriptions', 0),
                              const SizedBox(width: 10),
                              _buildTab('Certificates', 1),
                              const SizedBox(width: 10),
                              _buildTab('Instructions', 2),
                              const SizedBox(width: 10),
                              // ✅ إصلاح: Invoices = index 3 مش 2
                              _buildTab('Invoices', 3),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
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
      ],
    );
  }

  // ✅ Extract tab widget لتجنب التكرار
  Widget _buildTab(String label, int index) {
    final active = _isActive(index);
    return GestureDetector(
      onTap: () => _onTabTap(index),
      child: Container(
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: active ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: active ? null : Border.all(color: Colors.white, width: 1.5),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: active ? ColorApp.hintColor : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
