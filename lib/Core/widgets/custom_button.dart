import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final String? icon;
  final double? widthicon;
  final double? heighticon;
  final Color? buttonColor;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final Border? border;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.icon,
    this.buttonColor,
    this.widthicon,
    this.heighticon,
    this.height,
    this.width,
    this.border,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: width ?? 400,
          height: height ?? 60,
          decoration: BoxDecoration(
            color: buttonColor ?? const Color(0xFF8D34B0),
            borderRadius: BorderRadius.circular(20),
            border: border,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Image.asset(
                  icon!,
                  width: widthicon ?? 16,
                  height: heighticon ?? 15.83,
                ),
                const SizedBox(width: 10),
              ],
              Text(
                text,
                style:
                    textStyle ??
                    const TextStyle(
                      color: Color(0xFFEDEDED),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
