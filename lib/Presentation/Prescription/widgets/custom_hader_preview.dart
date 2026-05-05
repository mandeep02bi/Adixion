import 'package:doctor/Core/helper/image_assets.dart';
import 'package:doctor/Core/theme/color_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return OrientationBuilder(
      builder: (context, orientation) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              height: orientation == Orientation.portrait ? 100.h : 60.h,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(ImageAssets.headerPrescription, fit: BoxFit.fill),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        SizedBox(
                          height: orientation == Orientation.portrait
                              ? 30.h
                              : 15.h,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                ImageAssets.backBottom,
                                width: orientation == Orientation.portrait
                                    ? 35.w
                                    : 25.w,
                                height: orientation == Orientation.portrait
                                    ? 35.61.h
                                    : 25.61.h,
                              ),
                              SizedBox(width: 12.w),
                              Text(
                                title,
                                style: TextStyle(
                                  fontSize: orientation == Orientation.portrait
                                      ? 18.sp
                                      : 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.0.w,
                                ),
                                child: Container(
                                  height: orientation == Orientation.portrait
                                      ? 28.h
                                      : 22.h,
                                  width: orientation == Orientation.portrait
                                      ? 93.w
                                      : 85.w,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFC7C9ED),
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8.0.w,
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          ImageAssets.calender,
                                          height:
                                              orientation ==
                                                  Orientation.portrait
                                              ? 12.h
                                              : 10.h,
                                          width:
                                              orientation ==
                                                  Orientation.portrait
                                              ? 12.w
                                              : 10.w,
                                        ),
                                        SizedBox(width: 5.w),
                                        Text(
                                          '12 Mar 2026',
                                          style: TextStyle(
                                            fontSize:
                                                orientation ==
                                                    Orientation.portrait
                                                ? 10.sp
                                                : 8.sp,
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
              Positioned(
                bottom: -50.h,
                left: 16.w,
                right: 16.w,
                child: bottomCard!,
              ),
          ],
        );
      },
    );
  }
}
