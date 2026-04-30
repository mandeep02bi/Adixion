
import 'package:doctor/core/Theme/color_app.dart';
import 'package:doctor/widgets/Add_prescription/border_container.dart';
import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  const EmptyState({super.key, required this.icon, required this.subtitle, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Padding(
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
              Image.asset(icon, width: 40, height: 40),
              const SizedBox(height: 6),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ColorApp.gery2,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
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