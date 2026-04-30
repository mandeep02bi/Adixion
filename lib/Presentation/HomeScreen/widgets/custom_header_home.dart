import 'package:doctor/Core/helper/image_assets.dart';
import 'package:flutter/material.dart';

class CustomHeaderHome extends StatelessWidget {
  const CustomHeaderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 380,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(ImageAssets.homePageHeader)),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi Doctor",
                      style: TextStyle(
                        color: Colors.white70,
                        fontFamily: "Rubik",
                      ),
                    ),
                    Text(
                      "Subhash Sharma",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: "Rubik",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage(ImageAssets.homeIcon),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
