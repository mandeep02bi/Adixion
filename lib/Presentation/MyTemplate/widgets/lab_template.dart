import 'package:doctor/core/Theme/color_app.dart';
import 'package:doctor/Core/helper/image_assets.dart';
import 'package:doctor/Presentation/MyTemplate/widgets/patine_widgets_template.dart';
import 'package:doctor/widgets/Add_prescription/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LabTemplate extends StatelessWidget {
  const LabTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          const CustomTextFormField(
            label: '',
            hint: 'Lab Test',
            fieldFillColor: ColorApp.scaffoldColor,
            icon: ImageAssets.lab,
            heightIcon: 18,
            widthIcon: 18,
            hintStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10),

          const PatineWidgetsTemplate(),
          SizedBox(height: 10),
          const PatineWidgetsTemplate(),
          SizedBox(height: 10),

          const PatineWidgetsTemplate(),
          SizedBox(height: 10),

          const PatineWidgetsTemplate(),
          SizedBox(height: 10),

          const PatineWidgetsTemplate(),
        ],
      ),
    );
  }
}
