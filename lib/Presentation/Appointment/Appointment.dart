
import 'package:doctor/widgets/Book_appointment.dart/Datecart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  int selectedIndex = -1;
  final times = [
    "09:00 AM",
    "09:30 AM",
    "10:00 AM",
    "10:30 AM",
    "11:00 AM",
    "11:30 AM",
    "02:00 PM",
    "02:30 PM",
    "03:00 PM",
    "03:30 PM",
    "04:00 PM",
    "04:30 PM"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4FA3A5), Color(0xFF7B3FCF)],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Column(
          children: [
            OrientationBuilder(
              builder: (context, orientation) {
                return Stack(
                  children: [
                    Image.asset(
                      "assets/images/Header/header.png",
                      height: orientation == Orientation.portrait ? 110.h : 70.h,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      top: orientation == Orientation.portrait ? 40.h : 25.h,
                      left: 15.w,
                      child: CircleAvatar(
                        radius: orientation == Orientation.portrait ? 22.r : 18.r,
                        backgroundColor: Colors.white24,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Image.asset(
                            "assets/images/Icons/Patient/Frame.png",
                            height: orientation == Orientation.portrait ? 22.r : 18.r,
                            width: orientation == Orientation.portrait ? 22.r : 18.r,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: orientation == Orientation.portrait ? 45.h : 30.h,
                      left: 80.w,
                      child: Text(
                        "Book An appointment",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: orientation == Orientation.portrait ? 20.sp : 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),

            /// BODY
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F5F7),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30.r),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("PATIENT",
                          style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
                      SizedBox(height: 10.h),
                      _patientCard(),
                      SizedBox(height: 20.h),
                      Text("Select Date",
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.w600)),
                      SizedBox(height: 10.h),
                      _dateSelector(),
                      SizedBox(height: 20.h),
                      Text("Select Time",
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.w600)),
                      SizedBox(height: 5.h),
                      _timeGrid(),
                      SizedBox(height: 30.h),
                      _bookButton(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// ---------- PATIENT CARD ----------
  Widget _patientCard() {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.r,
            backgroundColor: const Color(0xFF4FA3A5),
            child: Text("AT",
                style: TextStyle(color: Colors.white, fontSize: 16.sp)),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Rishabh Singh",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16.sp)),
              Text("PT-001.Age 28 Years",
                  style: TextStyle(color: Colors.grey, fontSize: 13.sp)),
            ],
          )
        ],
      ),
    );
  }

  /// ---------- DATE SELECTOR ----------
  Widget _dateSelector() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(14.r),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.calendar_today, color: Colors.green, size: 20.r),
                  SizedBox(width: 10.w),
                  Text(
                    "Friday, March 12, 2026",
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ],
              ),
              Icon(Icons.arrow_forward_ios, size: 16.r),
            ],
          ),
        ),
        SizedBox(height: 12.h),

        /// Horizontal Dates
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              DateCard(day: "Thu", date: "12"),
              SizedBox(width: 10),
              DateCard(day: "Fri", date: "13", active: true),
              SizedBox(width: 10),
              DateCard(day: "Sat", date: "14"),
              SizedBox(width: 10),
              DateCard(day: "Sun", date: "15"),
              SizedBox(width: 10),
              DateCard(day: "Mon", date: "16"),
            ],
          ),
        )
      ],
    );
  }

  /// ---------- TIME GRID ----------
  Widget _timeGrid() {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Padding(
          padding: EdgeInsets.only(top: 0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: times.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: orientation == Orientation.portrait ? 3 : 5,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.h,
              childAspectRatio: orientation == Orientation.portrait ? 2.5 : 3.0,
            ),
            itemBuilder: (context, index) {
              final isSelected = selectedIndex == index;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: isSelected
                        ? const LinearGradient(
                            colors: [Color(0xFF7B3FCF), Color(0xFF9C27B0)],
                          )
                        : null,
                    color: isSelected ? null : Colors.white,
                    borderRadius: BorderRadius.circular(14.r),
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  child: Text(
                    times[index],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }


  Widget _bookButton() {
    return Container(
      height: 55.h,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF7B3FCF), Color(0xFF9C27B0)],
        ),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Center(
        child: Text("Book Appointment",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16.sp)),
      ),
    );
  }
}
