import 'package:doctor/core/Theme/color_app.dart';
import 'package:flutter/material.dart';

class RecordCard extends StatelessWidget {
  final String items;
  final String itemname;
  final String subitemname;
  const RecordCard({
    super.key,
    required this.items,
    required this.itemname,
    required this.subitemname,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: ColorApp.textColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(items, width: 60, height: 60),
              Text(
                itemname,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: ColorApp.hintColor,
                ),
              ),
              Text(
                subitemname,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: ColorApp.labelColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
