import 'package:doctor/core/Theme/color_app.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String hint;
  final String? icon;
  final String? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final Color? textColor;
  final Color? iconColor;
  final double? widthIcon;
  final double? heightIcon;
  final Color? fieldFillColor;
  final TextStyle? hintStyle;
  final TextStyle? lableStyle;

  const CustomTextFormField({
    super.key,
    required this.label,
    required this.hint,
    this.icon,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.textColor,
    this.iconColor,
    this.widthIcon,
    this.heightIcon,
    this.fieldFillColor,
    this.hintStyle,
    this.lableStyle,
  });

  static const Color primaryGreen = Color(0xFF0F6E56);
  static const Color borderSideColor = Color(0xFFE0E0E0);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style:
              lableStyle ??
              TextStyle(
                fontSize: 14,
                color: ColorApp.labelColor,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.8,
              ),
        ),

        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          cursorColor: ColorApp.textColor,
          maxLines: keyboardType == TextInputType.multiline ? 3 : 1,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle:
                hintStyle ??
                const TextStyle(fontSize: 14, color: ColorApp.hintColor),
            prefixIcon: icon != null
                ? Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(
                      icon!,
                      width: widthIcon,
                      height: heightIcon,
                      fit: BoxFit.contain,
                    ),
                  )
                : null,
            suffixIcon: suffixIcon != null
                ? Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(
                      suffixIcon!,
                      width: widthIcon,
                      height: heightIcon,
                      fit: BoxFit.contain,
                    ),
                  )
                : null,
            filled: true,

            fillColor: fieldFillColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: borderSideColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: primaryGreen, width: 1.2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.redAccent, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
          ),
        ),
      ],
    );
  }
}
