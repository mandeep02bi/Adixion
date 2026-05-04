import 'package:doctor/Core/helper/image_assets.dart';
import 'package:doctor/Core/theme/color_app.dart';
import 'package:flutter/material.dart';

class CustomHaderPreview extends StatelessWidget {
  final String title;
  final Widget? bottomCard;

  const CustomHaderPreview({
    super.key,
    this.title = 'Write Prescription',
    this.bottomCard,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: 100,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(ImageAssets.headerPrescription, fit: BoxFit.fill),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            ImageAssets.backBottom,
                            width: 35,
                            height: 35.61,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Container(
                              height: 28,
                              width: 93,
                              decoration: BoxDecoration(
                                color: Color(0xFFC7C9ED),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      ImageAssets.calender,
                                      height: 12,
                                      width: 12,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      '12 Mar 2026',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: ColorApp.labelColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        if (bottomCard != null)
          Positioned(bottom: -50, left: 16, right: 16, child: bottomCard!),
      ],
    );
  }
}
