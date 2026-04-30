import 'package:doctor/Data/Data_source/Medicine_datasource.dart';
import 'package:doctor/Data/model/certificate_model.dart';
import 'package:doctor/Presentation/Certificate/AddCertificate.dart';
import 'package:doctor/widgets/Certificate/Certificcatecard.dart';
import 'package:doctor/widgets/Common/Appheader.dart';
import 'package:flutter/material.dart';
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
            backgroundImage: "assets/images/background/P.jpg"
          ),

          /// 👤 USER TILE
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFEFF3F6),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  // const CircleAvatar(
                  //   backgroundColor: Color(0xFF4C6EF5),
                  //   child: Text("AT"),
                  // ),
                   CircleAvatar(
                                  radius: 22,
                                  backgroundColor: Colors.blueGrey,
                                  child: const Text("AT",
                                      style: TextStyle(color: Colors.white)),
                                ),

                  const SizedBox(width: 10),
                  const Text(
                    "Rishabh Singh",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ),

          /// 📄 TITLE
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Certificate",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          /// 📋 LIST
          // Expanded(
          //   child: ListView(
          //     padding: const EdgeInsets.symmetric(horizontal: 16),
          //     children: const [
          //       CertificateCard(title: "Cert", date: "15 April 2026"),
          //       CertificateCard(title: "Cert", date: "12 April 2026"),
          //       CertificateCard(title: "Cert", date: "12 April 2026"),
          //       CertificateCard(title: "Cert", date: "12 April 2026"),
          //     ],
          //   ),
          // )
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
                  return const Center(child: Text("Error loading data"));
                }

                /// 📭 EMPTY
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("No Certificates Found"));
                }

                final list = snapshot.data!;

                /// ✅ DATA LIST
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
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
      "Jan","Feb","Mar","Apr","May","Jun",
      "Jul","Aug","Sep","Oct","Nov","Dec"
    ];
    return months[m - 1];
  }
}