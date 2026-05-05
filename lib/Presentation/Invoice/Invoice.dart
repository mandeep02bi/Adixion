import 'package:doctor/Data/Data_source/Medicine_datasource.dart';
import 'package:doctor/Data/model/invoice_model.dart';
import 'package:doctor/Presentation/Invoice/Addinvoce.dart';
import 'package:doctor/widgets/Common/Appheader.dart';
import 'package:doctor/widgets/Invoice/Invoicecard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            backgroundImage: "assets/images/background/P.jpg",
          ),

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
                  return Center(
                      child: Text("Something went wrong",
                          style: TextStyle(fontSize: 14.sp)));
                }

                /// 📭 EMPTY
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                      child: Text("No Invoices Found",
                          style: TextStyle(fontSize: 14.sp)));
                }

                final list = snapshot.data!;

                /// ✅ DYNAMIC LIST
                return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
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
        ],
      ),
    );
  }
}