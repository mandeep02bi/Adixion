import 'package:flutter/material.dart';

class CustomHeaderWidgets extends StatelessWidget {
  final String? title;
  const CustomHeaderWidgets({super.key, this.title});

  List<String> getSteps(String title) {
    if (title.toLowerCase().contains("prescription")) {
      return ["Case History", "Medical", "Lab Test"];
    } else {
      return ["Personal", "Medical", "Address"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/background/header.png', fit: BoxFit.fill),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Image.asset(
                        'assets/images/Icons/Patient/Frame.png',
                        width: 35,
                        height: 35.61,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title ?? 'Add New Patient',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Fill in patient details',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFFD0DCF4),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
