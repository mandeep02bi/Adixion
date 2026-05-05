import 'package:doctor/Core/Theme/color_app.dart';
import 'package:doctor/Core/helper/image_assets.dart';
import 'package:doctor/Presentation/Records/widgets/container_body.dart';
import 'package:doctor/Presentation/Records/widgets/custom_header_recordes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Records extends StatelessWidget {
  const Records({super.key});

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
              const CustomHeaderRecordes(title: 'Kumar’s Records'),
              SizedBox(height: 10.h),
              const ContainerBody(
                name: 'Kumar',
                age: '31yr',
                email: '@kumar123',
                mobile: '9876543210',
                date: '20-mar 2026',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

