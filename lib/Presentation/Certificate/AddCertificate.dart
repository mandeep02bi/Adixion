import 'package:doctor/Data/Data_source/Medicine_datasource.dart';
import 'package:doctor/Data/model/certificate_model.dart';
import 'package:doctor/widgets/Common/Appheader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Addcertificate extends StatefulWidget {
  const Addcertificate({super.key});

  @override
  State<Addcertificate> createState() => _AddcertificateState();
}

class _AddcertificateState extends State<Addcertificate> {
  final titleController = TextEditingController();
  final descController = TextEditingController();

  Future<void> saveCertificate() async {
    final data = CertificateModel(
      title: titleController.text,
      description: descController.text,
      date: DateTime.now().toString(),
    );

    await MedicineDatabase.insertCertificate(data);
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9F1F6),
      body: Column(
        children: [
          /// HEADER
          AppHeader(
            title: "Certificate",
            onBack: () => Navigator.pop(context),
          ),

          Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              children: [
                /// USER TILE
                Container(
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF3F6),
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 22.r,
                        backgroundColor: Colors.blueGrey,
                        child: Text(
                          "AT",
                          style:
                              TextStyle(color: Colors.white, fontSize: 14.sp),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "Rishabh Singh",
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.h),

                /// TITLE FIELD
                TextField(
                  controller: titleController,
                  style: TextStyle(fontSize: 14.sp),
                  decoration: InputDecoration(
                    hintText: "Certificate Title",
                    hintStyle: TextStyle(fontSize: 14.sp),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),

                SizedBox(height: 15.h),

                /// DESCRIPTION FIELD
                TextField(
                  controller: descController,
                  maxLines: 3,
                  style: TextStyle(fontSize: 14.sp),
                  decoration: InputDecoration(
                    hintText: "Description",
                    hintStyle: TextStyle(fontSize: 14.sp),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),

                SizedBox(height: 25.h),

                /// BUTTON
                _bookButton()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _bookButton() {
    return GestureDetector(
      onTap: saveCertificate,
      child: Container(
        height: 55.h,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF7B3FCF), Color(0xFF9C27B0)],
          ),
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Center(
          child: Text(
            "Prescribe",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),
          ),
        ),
      ),
    );
  }
}