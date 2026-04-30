
import 'package:doctor/Core/helper/image_assets.dart';
import 'package:doctor/core/Theme/color_app.dart';
import 'package:doctor/widgets/Add_patient/custom_button.dart';
import 'package:flutter/material.dart';

class ButtonPrescription extends StatelessWidget {
  final VoidCallback? onPressed;
    final VoidCallback? onNextPressed;
    final bool isfinish;

  const ButtonPrescription({super.key, required this.onPressed, this.onNextPressed, this.isfinish = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButton(
          height: 60,
          width: 150,
          onPressed: onPressed,
          text: 'Save Draft',
          textStyle: TextStyle(fontSize: 12, color: ColorApp.textColor),
          subText: ImageAssets.drft,
          buttonColor: Color(0xFFFFFFFF),
          border: Border.all(color: ColorApp.textColor),
          
        ),
        CustomButton(
          height: 60,
          width: 150,
          onPressed: onNextPressed,
          text: isfinish ?'Finish': 'Next',
          subText: ImageAssets.send,
          widthicon: 20,
          heighticon: 20,

          buttonColor: Color(0xFF8D34B0),
        ),
      ],
    );
  }
}
