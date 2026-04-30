import 'package:doctor/Data/Data_source/Medicine_datasource.dart';
import 'package:doctor/Data/model/invoice_model.dart';
import 'package:doctor/Presentation/Invoice/Addinvoce.dart';
import 'package:doctor/widgets/Common/Appheader.dart';
import 'package:doctor/widgets/Invoice/Invoicecard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Invoice extends StatefulWidget {
  const Invoice({super.key});

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: const Color(0xFFE9F1F6),
      body: Column(
        children: [

          /// 🔷 HEADER
          AppHeader(
            title: "List of Invoice",
            onBack: () => Navigator.pop(context),
            onAdd: () {
              Get.to(Addinvoce());
            },
            backgroundImage: "assets/images/background/P.jpg"
          ),

          //   Expanded(
          //   child: ListView(
          //     padding: const EdgeInsets.symmetric(horizontal: 16),
          //     children: const [
          //       InvoiceCard(
          //         name: "Kumar",
          //         patientId: "PT-001",
          //         age: 28,
          //         amount: 6200,
          //         isPaid: true,
          //       ),
          //       InvoiceCard(
          //         name: "Rishabh Singh",
          //         patientId: "PT-001",
          //         age: 28,
          //         amount: 6200,
          //         isPaid: false,
          //       ),
          //       InvoiceCard(
          //         name: "Rishabh Singh",
          //         patientId: "PT-001",
          //         age: 28,
          //         amount: 6200,
          //         isPaid: false,
          //       ),
          //       InvoiceCard(
          //         name: "Rishabh Singh",
          //         patientId: "PT-001",
          //         age: 28,
          //         amount: 6200,
          //         isPaid: true,
          //       ),
          //     ],
          //   ),
          // ),
          Expanded(
  child: FutureBuilder<List<InvoiceModel>>(
    future: MedicineDatabase.getAllInvoices(),
    builder: (context, snapshot) {

      /// ⏳ LOADING
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }

      /// ❌ ERROR
      if (snapshot.hasError) {
        return const Center(child: Text("Something went wrong"));
      }

      /// 📭 EMPTY
      if (!snapshot.hasData || snapshot.data!.isEmpty) {
        return const Center(child: Text("No Invoices Found"));
      }

      final list = snapshot.data!;

      /// ✅ DYNAMIC LIST
      return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: list.length,
        itemBuilder: (context, index) {
          final item = list[index];

          return InvoiceCard(
            name: item.name,
            patientId: "PT-001",
            age: 28,
            amount: item.total,
            isPaid: true, // you can make this dynamic later
          );
        },
      );
    },
  ),
)
        ]));
  }
}