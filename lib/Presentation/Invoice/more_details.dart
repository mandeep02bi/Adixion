import 'package:doctor/Core/theme/color_app.dart';
import 'package:doctor/Presentation/Prescription/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoreDetails extends StatefulWidget {
  const MoreDetails({super.key});

  @override
  State<MoreDetails> createState() => _MoreDetailsState();
}

class _MoreDetailsState extends State<MoreDetails> {
  final discountTitleCtrl = TextEditingController();
  final advanceTitleCtrl = TextEditingController();
  final taxTitleCtrl = TextEditingController();
  final dateCtrl = TextEditingController();
  final remarkCtrl = TextEditingController();

  String? discountAmount;
  String? advanceAmount;
  String? taxAmount;
  String selectedStatus = 'None';

  final List<String> amountOptions = ['0', '50', '100', '200', '500'];
  final List<String> statusOptions = ['To Pay', 'Paid', 'Unpaid', 'None'];

  int total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9F1F6),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Discount Title + Amount
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 2,
                  child: CustomTextFormField(
                    label: 'Discount Title',
                    hint: 'Invoice',
                    lableStyle: TextStyle(
                      fontSize: 12.sp,
                      color: ColorApp.labelTextColor,
                    ),
                    controller: discountTitleCtrl,
                    fieldFillColor: Colors.white,
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Amount',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      DropdownButtonFormField<String>(
                        value: discountAmount,
                        style: TextStyle(fontSize: 14.sp, color: Colors.black),
                        items: amountOptions
                            .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)),
                            )
                            .toList(),
                        onChanged: (v) => setState(() => discountAmount = v),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 14.h,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: const BorderSide(
                              color: Color(0xFFE0E0E0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: const BorderSide(
                              color: Color(0xFFE0E0E0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 12.h),

            // Advance + Amount
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 2,
                  child: CustomTextFormField(
                    label: 'Advance / partial amount paid',
                    lableStyle: TextStyle(
                      fontSize: 12.sp,
                      color: ColorApp.labelTextColor,
                    ),
                    hint: 'Invoice',
                    controller: advanceTitleCtrl,
                    fieldFillColor: Colors.white,
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Amount',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      DropdownButtonFormField<String>(
                        value: advanceAmount,
                        style: TextStyle(fontSize: 14.sp, color: Colors.black),
                        items: amountOptions
                            .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)),
                            )
                            .toList(),
                        onChanged: (v) => setState(() => advanceAmount = v),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 14.h,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: const BorderSide(
                              color: Color(0xFFE0E0E0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: const BorderSide(
                              color: Color(0xFFE0E0E0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 12.h),

            // Tax Title + Amount
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 2,
                  child: CustomTextFormField(
                    label: 'Tax Title',
                    lableStyle: TextStyle(
                      fontSize: 12.sp,
                      color: ColorApp.labelTextColor,
                    ),
                    hint: 'Invoice',
                    controller: taxTitleCtrl,
                    fieldFillColor: Colors.white,
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Amount',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      DropdownButtonFormField<String>(
                        value: taxAmount,
                        style: TextStyle(fontSize: 14.sp, color: Colors.black),
                        items: amountOptions
                            .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)),
                            )
                            .toList(),
                        onChanged: (v) => setState(() => taxAmount = v),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 14.h,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: const BorderSide(
                              color: Color(0xFFE0E0E0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: const BorderSide(
                              color: Color(0xFFE0E0E0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 12.h),

            // Date
            CustomTextFormField(
              label: 'Date',
              hint: 'Enter Here',
              controller: dateCtrl,
              lableStyle: TextStyle(
                fontSize: 12.sp,
                color: ColorApp.labelTextColor,
              ),
              fieldFillColor: Colors.white,
              keyboardType: TextInputType.datetime,
            ),

            SizedBox(height: 12.h),

            // Remark
            CustomTextFormField(
              label: 'Remark',
              lableStyle: TextStyle(
                fontSize: 12.sp,
                color: ColorApp.labelTextColor,
              ),
              hint: 'Kumar',
              controller: remarkCtrl,
              fieldFillColor: Colors.white,
            ),

            SizedBox(height: 12.h),

            // Status
            Text(
              'STATUS',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black54,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.8.w,
              ),
            ),
            SizedBox(height: 8.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: statusOptions.map((status) {
                  final isSelected = selectedStatus == status;
                  return Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: GestureDetector(
                      onTap: () => setState(() => selectedStatus = status),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFF7B3FCF)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                            color: isSelected
                                ? const Color(0xFF7B3FCF)
                                : const Color(0xFFE0E0E0),
                          ),
                        ),
                        child: Text(
                          status,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black54,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            SizedBox(height: 40.h),

            // Total + Add Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(30.r),
                    color: Colors.white,
                  ),
                  child: Text(
                    'Total Amount ₹ $total',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7B3FCF),
                    padding: EdgeInsets.symmetric(
                      horizontal: 50.w,
                      vertical: 14.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  child: Text(
                    'Add',
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

