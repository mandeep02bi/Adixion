import 'package:doctor/Core/helper/image_assets.dart';
import 'package:doctor/Data/Data_source/Medicine_datasource.dart';
import 'package:doctor/Data/model/invoice_model.dart';
import 'package:doctor/Presentation/Invoice/more_details.dart';
import 'package:doctor/Presentation/Invoice/widgets/custom_header_invoice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                unselectedLabelStyle: TextStyle(fontSize: 14.sp),
                tabs: const [
                  Tab(text: "Invoice details"),
                  Tab(text: "More details"),
                ],
              ),

              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    /// 🔷 FIRST TAB
                    SingleChildScrollView(
                      padding: EdgeInsets.all(16.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// NAME
                          _field("Invoice / Bill in the name of", nameCtrl),

                          SizedBox(height: 10.h),

                          /// TITLE + CURRENCY
                          Row(
                            children: [
                              Expanded(
                                child: _field("Invoice title", titleCtrl),
                              ),
                              SizedBox(width: 10.w),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 12.h,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: Colors.white,
                                ),
                                child: Text("₹", style: TextStyle(fontSize: 16.sp)),
                              ),
                            ],
                          ),

                          SizedBox(height: 10.h),

                          /// ITEM + AMOUNT
                          Row(
                            children: [
                              Expanded(
                                child: _field(
                                  "Add item / Particulars",
                                  itemCtrl,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              SizedBox(
                                width: 100.w,
                                child: TextField(
                                  controller: amountCtrl,
                                  keyboardType: TextInputType.number,
                                  onChanged: (_) => calculateTotal(),
                                  style: TextStyle(fontSize: 14.sp),
                                  decoration: InputDecoration(
                                    hintText: "Amount",
                                    hintStyle: TextStyle(fontSize: 14.sp),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 30.h),

                          /// TOTAL + BUTTON
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 10.h,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.green),
                                  borderRadius: BorderRadius.circular(12.r),
                                  color: Colors.white,
                                ),
                                child: Text(
                                  "Total Amount ₹ $total",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: saveInvoice,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF7B3FCF),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 30.w,
                                    vertical: 12.h,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                ),
                                child: Text(
                                  "Add",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    /// 🔷 SECOND TAB
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
      style: TextStyle(fontSize: 14.sp),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(fontSize: 14.sp),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
      ),
    );
  }
}

