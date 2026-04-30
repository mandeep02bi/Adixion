import 'package:doctor/Core/helper/image_assets.dart';
import 'package:doctor/core/Theme/color_app.dart';
import 'package:doctor/Presentation/MyTemplate/widgets/custom_header_template.dart';
import 'package:flutter/material.dart';

class MyTemplate extends StatelessWidget {
  const MyTemplate({super.key});

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
            children: [
              const CustomHeaderTemplate(title: 'My Template'),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
