import 'package:flutter/material.dart';

class CustomSectionTitle extends StatelessWidget {
  final String icon;
  final String title;
  final double widthIcon;
  final double heightIcon;
    final TextStyle? textStyle;


  const CustomSectionTitle({
    super.key,
    required this.icon,
    required this.title,
    required this.widthIcon,
    required this.heightIcon,
        this.textStyle,

  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(icon, width: widthIcon, height: heightIcon),
        const SizedBox(width: 10),
        Text(
          title,
          style: textStyle ?? const TextStyle(
            color: Color(0xFF0F6E56),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
