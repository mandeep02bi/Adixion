import 'package:doctor/Data/Data_source/Medicine_datasource.dart';
import 'package:doctor/Data/model/certificate_model.dart';
import 'package:doctor/Presentation/Certificate/AddCertificate.dart';
import 'package:doctor/widgets/Certificate/Certificcatecard.dart';
import 'package:doctor/widgets/Common/Appheader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Certificate extends StatefulWidget {
  const Certificate({super.key});

  @override
  State<Certificate> createState() => _CertificateState();
}

class _CertificateState extends State<Certificate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9F1F6),
      body: Column(
        children: [
          /// 🔷 HEADER
          AppHeader(
            title: "Certificate",
            onBack: () => Navigator.pop(context),
            onAdd: () {
              Get.to(Addcertificate());
            },
            backgroundImage: "assets/images/background/P.jpg",
          ),

          /// 👤 USER TILE
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Container(
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
                      style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    "Rishabh Singh",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  )
                ],
              ),
            ),
          ),

          /// 📄 TITLE
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Certificate",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),

          SizedBox(height: 10.h),

          /// 📋 LIST
          Expanded(
            child: FutureBuilder<List<CertificateModel>>(
              future: MedicineDatabase.getAllCertificates(),
              builder: (context, snapshot) {
                /// ⏳ LOADING
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                /// ❌ ERROR
                if (snapshot.hasError) {
                  return Center(
                      child: Text("Error loading data",
                          style: TextStyle(fontSize: 14.sp)));
                }

                /// 📭 EMPTY
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                      child: Text("No Certificates Found",
                          style: TextStyle(fontSize: 14.sp)));
                }

                final list = snapshot.data!;

                /// ✅ DATA LIST
                return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final item = list[index];

                    return CertificateCard(
                      title: item.title,
                      date: _formatDate(item.date),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }

  String _formatDate(String date) {
    final d = DateTime.parse(date);
    return "${d.day} ${_month(d.month)} ${d.year}";
  }

  String _month(int m) {
    const months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];
    return months[m - 1];
  }
}