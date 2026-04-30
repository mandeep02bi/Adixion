import 'package:doctor/Data/Data_source/Medicine_datasource.dart';
import 'package:doctor/Data/model/certificate_model.dart';
import 'package:doctor/widgets/Common/Appheader.dart';
import 'package:flutter/material.dart';
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

    // Navigator.pop(context); // go back
    Get.back();
  }
  
  
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9F1F6),
      body: Column(
        children: [

          /// HEADER (reuse your widget)
          AppHeader(
            title: "Certificate",
            onBack: () => Navigator.pop(context),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [

                /// USER TILE
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF3F6),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: const [
                      // CircleAvatar(
                      //   backgroundColor: Colors.blue,
                      //   child: Text("AT"),
                      // ),
                       CircleAvatar(
                                  radius: 22,
                                  backgroundColor: Colors.blueGrey,
                                  child: const Text("AT",
                                      style: TextStyle(color: Colors.white)),
                                ),
                      SizedBox(width: 10),
                      Text("Rishabh Singh"),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// TITLE FIELD
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: "Certificate Title",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                /// DESCRIPTION FIELD
                TextField(
                  controller: descController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: "Description",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

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
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF7B3FCF), Color(0xFF9C27B0)],
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Center(
        child: Text("Prescribe",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600)),
      ),
    );
  }
}