import 'package:doctor/Presentation/AuthScreen/LoginSC.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Onboardsc extends StatefulWidget {
  const Onboardsc({super.key});

  @override
  State<Onboardsc> createState() => _OnboardscState();
}

class _OnboardscState extends State<Onboardsc> {
  final PageController controller = PageController();
  int currentPage = 0;

  final List<Map<String, String>> data = [
    {
      "image": "assets/images/onboarding/01.png",
      "title": "Manage Your Patients Easily",
      "desc": "Add, view, and manage all your patients in one place. Access patient history, records, and prescriptions anytime."
    },
    {
      "image": "assets/images/onboarding/02.png",
      "title": "Digital Prescriptions & Records",
      "desc": "Create digital prescriptions, upload medical records, and share documents securely with your patients."
    },
    {
      "image": "assets/images/onboarding/03.png",
      "title": "Appointments & Reminders",
      "desc": "Schedule appointments, set reminders, and never miss an important follow-up with your patients."
    },
  ];

  void nextPage() async {
    if (currentPage < data.length - 1) {
      controller.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool("seenOnboard", true);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Loginsc()),
      );
    }
  }

  void skip() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("seenOnboard", true);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const Loginsc()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background Image 1 (Top)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/images/background/OnbBG.jpg",
              fit: BoxFit.cover,
            ),
          ),

          /// Background Image 2 (Center)
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/images/background/OnbBg1.jpg",
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          /// Background Image 3 (Bottom)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/images/background/OnbBG.jpg",
              fit: BoxFit.cover,
            ),
          ),

          /// PageView Content
          PageView.builder(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemCount: data.length,
            itemBuilder: (context, index) {
              return buildPage(
                image: data[index]["image"]!,
                title: data[index]["title"]!,
                desc: data[index]["desc"]!,
                index: index,
              );
            },
          ),

          /// Bottom Controls
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Column(
              children: [
                /// Dot Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    data.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: currentPage == index ? 20 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: currentPage == index
                            ? Colors.purple
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// Next Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: nextPage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      currentPage == data.length - 1
                          ? "Get Started"
                          : "Next",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                /// Skip Button
                TextButton(
                  onPressed: skip,
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Animated Page Content
  Widget buildPage({
    required String image,
    required String title,
    required String desc,
    required int index,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Column(
        children: [
          /// Animated Image
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            transform: Matrix4.translationValues(
              currentPage == index ? 0 : 200,
              0,
              0,
            ),
            child: CircleAvatar(
              radius: 150,
              backgroundImage: AssetImage(image),
            ),
          ),

          const SizedBox(height: 30),

          /// Animated Title
          AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: currentPage == index ? 1 : 0,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 10),

          /// Animated Description
          AnimatedOpacity(
            duration: const Duration(milliseconds: 700),
            opacity: currentPage == index ? 1 : 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                desc,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

