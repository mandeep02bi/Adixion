import 'package:doctor/Presentation/Prescription/AddperscriptionfirstDr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

          Column(
            children: [
              /// Header Image
              Stack(
                children: [
                  Image.asset(
                    "assets/images/Header/header.png",
                    height: 110.h,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),

                  Positioned(
                    top: 40.h,
                    left: 15.w,
                    child: CircleAvatar(
                      radius: 22.r,
                      backgroundColor: Colors.white24,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Image.asset(
                          "assets/images/Icons/Patient/Frame.png",
                          height: 22.h,
                          width: 22.w,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 45.h,
                    left: 80.w,
                    child: Text("Prescription History",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        )),
                  ),

                  Positioned(
                    top: 40.h,
                    right: 20.w,
                    child: CircleAvatar(
                      radius: 22.r,
                      backgroundColor: Colors.white24,
                      child: IconButton(
                        onPressed: () {
                          Get.to(const Addperscriptionfirstdr());
                        },
                        icon: Image.asset(
                          "assets/images/Icons/Patient/Add.png",
                          height: 80.h,
                          width: 80.w,
                        ),
                      ),
                    ),
                  )
                ],
              ),

              SizedBox(height: 10.h),

              /// Prescription List
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
                            margin: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 6.h),
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Row(
                              children: [
                                /// Avatar
                                CircleAvatar(
                                  radius: 22.r,
                                  backgroundColor: Colors.blueGrey,
                                  child: Text("AT",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp)),
                                ),

                                SizedBox(width: 12.w),

                                /// Name
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Rishabh Singh",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp)),
                                      Text("PT-001.Age 28 Years",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12.sp)),
                                    ],
                                  ),
                                ),

                                Icon(Icons.keyboard_arrow_down, size: 24.r)
                              ],
                            ),
                          ),
                        ),

                        /// Dropdown Grid
                        if (expandedIndex == index)
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 12.w),
                            padding: EdgeInsets.all(5.w),
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: GridView.count(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: 3,
                              childAspectRatio: 1.3,
                              children: [
                                gridItem("assets/images/Icons/Patient/p.png",
                                    "Prescribe"),
                                gridItem(
                                    "assets/images/Icons/Patient/Attach.png",
                                    "Attachment"),
                                gridItem(
                                    "assets/images/Icons/Patient/Instructions.png",
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
        Image.asset(icon, height: 40.h),
        SizedBox(height: 5.h),
        Text(title, style: TextStyle(fontSize: 12.sp))
      ],
    );
  }
}