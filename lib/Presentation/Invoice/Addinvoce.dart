import 'package:doctor/Core/helper/image_assets.dart';
import 'package:doctor/Data/Data_source/Medicine_datasource.dart';
import 'package:doctor/Data/model/invoice_model.dart';
import 'package:doctor/Presentation/Invoice/more_details.dart';
import 'package:doctor/Presentation/Invoice/widgets/custom_header_invoice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Addinvoce extends StatefulWidget {
  const Addinvoce({super.key});

  @override
  State<Addinvoce> createState() => _AddinvoceState();
}

class _AddinvoceState extends State<Addinvoce>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  final nameCtrl = TextEditingController();
  final titleCtrl = TextEditingController();
  final itemCtrl = TextEditingController();
  final amountCtrl = TextEditingController();

  int total = 0;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  void calculateTotal() {
    total = int.tryParse(amountCtrl.text) ?? 0;
    setState(() {});
  }

  Future<void> saveInvoice() async {
    final data = InvoiceModel(
      name: nameCtrl.text,
      title: titleCtrl.text,
      item: itemCtrl.text,
      amount: int.tryParse(amountCtrl.text) ?? 0,
      total: total,
      date: DateTime.now().toString(),
      patientId: '',
      age: 27,
      isPaid: false,
    );

    await MedicineDatabase.insertInvoice(data);

    Get.back(result: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9F1F6),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageAssets.backgroundImagePath2),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const CustomHeaderInvoice(title: 'Create Invoice'),

              /// TABS
              TabBar(
                controller: tabController,
                labelColor: Colors.black,
                tabs: const [
                  Tab(text: "Invoice details"),
                  Tab(text: "More details"),
                ],
              ),

              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    /// 🔷 FIRST TAB (YOUR UI)
                    SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// NAME
                          _field("Invoice / Bill in the name of", nameCtrl),

                          const SizedBox(height: 10),

                          /// TITLE + CURRENCY
                          Row(
                            children: [
                              Expanded(
                                child: _field("Invoice title", titleCtrl),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Text("₹"),
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          /// ITEM + AMOUNT
                          Row(
                            children: [
                              Expanded(
                                child: _field(
                                  "Add item / Particulars",
                                  itemCtrl,
                                ),
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                width: 100,
                                child: TextField(
                                  controller: amountCtrl,
                                  keyboardType: TextInputType.number,
                                  onChanged: (_) => calculateTotal(),
                                  decoration: const InputDecoration(
                                    hintText: "Amount",
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 30),

                          /// TOTAL + BUTTON
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.green),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text("Total Amount ₹ $total"),
                              ),

                              ElevatedButton(
                                onPressed: saveInvoice,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF7B3FCF),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: const Text(
                                  "Add",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    /// 🔷 SECOND TAB (EMPTY / FUTURE)
                    const MoreDetails(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _field(String hint, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
