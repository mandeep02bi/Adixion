import 'package:flutter/material.dart';

class CustomHeaderWidgets extends StatelessWidget {
  final String? title;
  final int currentStep;
  const CustomHeaderWidgets({super.key, this.title, required this.currentStep});

  static const _activeLabel = Color(0xFFF3F7FA);
  static const _inactiveLabel = Color(0xFFBDCBCE);

  List<String> getSteps(String title) {
  if (title.toLowerCase().contains("prescription")) {
    return ["Case History", "Medical", "Lab Test"];
  } else {
    return ["Personal", "Medical", "Address"];
  }
}

  @override
  Widget build(BuildContext context) {
    final steps = getSteps(title ?? "");

    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/background/header.png',
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/Icons/Patient/Frame.png',
                      width: 35,
                      height: 35.61,
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
                Row(
                  children: [
                    Image.asset(
                      'assets/images/Icons/Patient/Add.png',
                      width: 40,
                      height: 40,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Step $currentStep to 3",
                              style: const TextStyle(
                                color: Color(0xFFD0DCF4),
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                _stepLine(currentStep >= 1),
                                _stepLine(currentStep >= 2),
                                _stepLine(currentStep >= 3),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                steps.length,
                                (index) => _stepLabel(
                                  steps[index],
                                  currentStep == index + 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _stepLine(bool active) => Expanded(
        child: Container(
          height: 4,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: active ? const Color(0xFFF3F7FA) : const Color(0xFF86B6C0),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      );

  Widget _stepLabel(String text, bool isActive) => Text(
        text,
        style: TextStyle(
          color: isActive ? _activeLabel : _inactiveLabel,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      );
}