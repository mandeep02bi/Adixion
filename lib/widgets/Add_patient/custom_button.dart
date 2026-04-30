import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final String? subText;
  final IconData? icon;
  final double? widthicon;
  final double? heighticon;
  final Color? buttonColor;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final TextStyle? subTextStyle;
  final Border? border;
  final String? assetIcon;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.subText,
    this.assetIcon,
    this.icon,
    this.buttonColor,
    this.widthicon,
    this.heighticon,
    this.height,
    this.width,
    this.border,
    this.textStyle,
    this.subTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onPressed,
        behavior: HitTestBehavior.opaque,
        child: Container(
          width: width ?? double.infinity,
          height: height ?? 60,
          decoration: BoxDecoration(
            color: buttonColor ?? const Color(0xFF8D34B0),
            borderRadius: BorderRadius.circular(15),
            border: border,
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: const Color(0xFF8B5CF6).withOpacity(0.3),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (assetIcon != null) ...[
                Image.asset(
                  assetIcon!,
                  width: widthicon ?? 16,
                  height: heighticon ?? 15.83,
                ),
                const SizedBox(width: 10),
              ],

              if (subText != null)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                    Text(
                      subText!,
                      style:
                          subTextStyle ??
                          const TextStyle(
                            color: Color(0xFFEDEDED),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ],
                )
              else
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

              if (icon != null) ...[
                const SizedBox(width: 10),
                Icon(icon, color: Colors.white, size: 25),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
