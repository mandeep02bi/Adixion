import 'package:flutter/material.dart';

class CustomSectionTitle extends StatelessWidget {
  final String? icon;
  final String title;
  final double? widthIcon;
  final double? heightIcon;
  final TextStyle? textStyle;

  const CustomSectionTitle({
    super.key,
    this.icon,
    required this.title,
    this.widthIcon,
    this.heightIcon,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null)
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(icon!, width: widthIcon, height: heightIcon),
          ),
        Text(
          title,
          style:
              textStyle ??
              const TextStyle(
                color: Color(0xFF0F6E56),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}
