import 'package:doctor/Presentation/Prescription/AddperscriptionfirstDr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Prescriptionlist extends StatefulWidget {
  const Prescriptionlist({super.key});

  @override
  State<Prescriptionlist> createState() => _PrescriptionlistState();
}

class _PrescriptionlistState extends State<Prescriptionlist> {
  int expandedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background Gradient
          Positioned.fill(
            child: Image.asset(
              "assets/images/background/P.jpg",
              fit: BoxFit.cover,
            ),
          ),
          // Container(
          //   decoration: const BoxDecoration(
          //     gradient: LinearGradient(
          //       colors: [Color(0xffE8F0F2), Color(0xffB7D6CC)],
          //       begin: Alignment.topCenter,
          //       end: Alignment.bottomCenter,
          //     ),
          //   ),
          // ),

          Column(
            children: [
              /// Header Image
              Stack(
                children: [
                  Image.asset(
                    "assets/images/Header/header.png",
                    height: 110,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),

                  Positioned(
                    top: 40,
                    left: 15,
                   child: CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.white24,
                    child: IconButton(
                      padding: EdgeInsets.zero,          // 🔥 remove padding
                      constraints: const BoxConstraints(), // 🔥 remove extra space
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Image.asset(
                        "assets/images/Icons/Patient/Frame.png",
                        height: 22,
                        width: 22,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  ),

                  const Positioned(
                    top: 45,
                    left: 80,
                    child: Text(
                      "Prescription History",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                      )
                    ),
                  ),

                  Positioned(
                    top: 40,
                    right: 20,
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.white24,
                      child: IconButton(
                      onPressed: () {
                        // Navigator.pop(context);
                         print("Mandeep");
                        Get.to(Addperscriptionfirstdr());
                        
                      },
                      icon: Image.asset(
                        "assets/images/Icons/Patient/Add.png",
                        height: 80,
                        width: 80,
                        // color: Colors.white, // remove if icon already white
                      ),
                    ),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 10),

              /// Patient List
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              expandedIndex =
                                  expandedIndex == index ? -1 : index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 6),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                /// Avatar
                                CircleAvatar(
                                  radius: 22,
                                  backgroundColor: Colors.blueGrey,
                                  child: const Text("AT",
                                      style: TextStyle(color: Colors.white)),
                                ),

                                const SizedBox(width: 12),

                                /// Name
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Rishabh Singh",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text("PT-001.Age 28 Years",
                                          style: TextStyle(
                                              color: Colors.grey)),
                                    ],
                                  ),
                                ),

                                const Icon(Icons.keyboard_arrow_down)
                              ],
                            ),
                          ),
                        ),

                        /// Dropdown Grid
                        if (expandedIndex == index)
                          Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 12),
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: GridView.count(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: 3,
                              childAspectRatio: 1.3,
                              children: [
                                gridItem("assets/images/Icons/Patient/p.png",
                                    "Prescribe"),
                                gridItem("assets/images/Icons/Patient/Attach.png",
                                    "Attachment"),
                                gridItem("assets/images/Icons/Patient/Instructions.png",
                                    "Instruction"),
                              ],
                            ),
                          )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget gridItem(String icon, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(icon, height: 40),
        const SizedBox(height: 5),
        Text(title, style: const TextStyle(fontSize: 12))
      ],
    );
  }
}