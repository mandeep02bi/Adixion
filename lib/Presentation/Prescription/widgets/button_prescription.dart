import 'package:doctor/Core/helper/image_assets.dart';
import 'package:doctor/core/Theme/color_app.dart';
import 'package:doctor/widgets/Add_patient/custom_button.dart';
import 'package:flutter/material.dart';

class ButtonPrescription extends StatelessWidget {
  final VoidCallback? onPressed;
  final VoidCallback? onNextPressed;
  final bool isfinish;
  final String? text;
  final String? text2;
  final String? image;
  final double? height;
  final double? width;
  final double? height2;
  final double? width2;

  const ButtonPrescription({
    super.key,
    required this.onPressed,
    this.onNextPressed,
    this.isfinish = false,
    this.text,
    this.text2,
    this.image,
    this.height,
    this.width,
    this.height2,
    this.width2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomButton(
          height: height ?? 45.83,
          width: width ?? 130,
          onPressed: onPressed,
          text: text ?? 'Save Draft',
          textStyle: TextStyle(fontSize: 12, color: ColorApp.textColor),
          assetIcon: image ?? ImageAssets.drft,
          buttonColor: Color(0xFFFFFFFF),
          border: Border.all(color: ColorApp.textColor),
        ),
        CustomButton(
          height: height2 ?? 60,
          width: width2 ?? 170,
          onPressed: onNextPressed,
          text: text2 ?? 'Next',
          assetIcon: ImageAssets.send,
          widthicon: 20,
          heighticon: 20,

          buttonColor: Color(0xFF8D34B0),
        ),
      ],
    );
  }
}
