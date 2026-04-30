import 'package:animate_do/animate_do.dart';
import 'package:doctor/Core/helper/image_assets.dart';
import 'package:doctor/core/Theme/color_app.dart';
import 'package:doctor/Presentation/HomeScreen/widgets/crousel_slider.dart';
import 'package:doctor/Presentation/HomeScreen/widgets/grid_menu.dart';
import 'package:doctor/Presentation/HomeScreen/widgets/record_section.dart';
import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // padding: EdgeInsets.all(15),
      child: Column(
        children: [
          SizedBox(height: 15),

          const CarouselSliderWidget(),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FadeInUp(
              delay: Duration(milliseconds: 200),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: ColorApp.textColor, width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Image.asset(
                        ImageAssets.iconUpgrade,
                        height: 35,
                        width: 35,
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Upgrade to Premium',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: ColorApp.hintColor,
                            ),
                          ),
                          Text(
                            'Easy access to better care',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: ColorApp.labelColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 40),

                      Container(
                        height: 31,
                        width: 80,
                        decoration: BoxDecoration(
                          color: ColorApp.buttomColor,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            'Upgrade',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: ColorApp.scaffoldColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GridMenu(),
          ),

          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: RecordSection(),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
