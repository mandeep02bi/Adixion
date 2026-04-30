
import 'package:doctor/widgets/Book_appointment.dart/Datecart.dart';
import 'package:flutter/material.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final size = MediaQuery.of(context).size;

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
               Stack(
                children: [
                  Image.asset(
                    "assets/images/Header/header.png",
                    height: 110,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),

                  Positioned(
                    top: 40,
                    left: 15,
                   child: CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.white24,
                    child: IconButton(
                      padding: EdgeInsets.zero,          // 🔥 remove padding
                      constraints: const BoxConstraints(), // 🔥 remove extra space
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Image.asset(
                        "assets/images/Icons/Patient/Frame.png",
                        height: 22,
                        width: 22,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  ),

                  const Positioned(
                    top: 45,
                    left: 80,
                    child: Text(
                      "Book An appointment",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                      )
                    ),
                  ),

              
                ],
              ),
          
              /// HEADER
              // _header(),

              /// BODY
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF3F5F7),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("PATIENT",
                            style: TextStyle(color: Colors.grey)),

                        const SizedBox(height: 10),

                        _patientCard(),

                        const SizedBox(height: 20),

                        const Text("Select Date",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600)),

                        const SizedBox(height: 10),

                        _dateSelector(),

                        const SizedBox(height: 20),

                        const Text("Select Time",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600)),

                        const SizedBox(height: 5),

                        _timeGrid(),

                        const SizedBox(height: 30),

                        _bookButton(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      // ),
    );
  }


  /// ---------- PATIENT CARD ----------
  Widget _patientCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 25,
            backgroundColor: Color(0xFF4FA3A5),
            child: Text("AT", style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Rishabh Singh",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16)),
              Text("PT-001.Age 28 Years",
                  style: TextStyle(color: Colors.grey)),
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
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Row(
                children: [
                  Icon(Icons.calendar_today, color: Colors.green),
                  SizedBox(width: 10),
                  Text("Friday, March 12, 2026"),
                ],
              ),
              Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
        const SizedBox(height: 12),

        /// Horizontal Dates
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            DateCard(day: "Thu", date: "12"),
            DateCard(day: "Fri", date: "13", active: true),
            DateCard(day: "Sat", date: "14"),
            DateCard(day: "Sun", date: "15"),
          ],
        )
      ],
    );
  }

  /// ---------- TIME GRID ----------
 Widget _timeGrid() {
  int selectedIndex = -1;
  final times = [
    "09:00 AM","09:30 AM","10:00 AM","10:30 AM",
    "11:00 AM","11:30 AM","02:00 PM","02:30 PM",
    "03:00 PM","03:30 PM","04:00 PM","04:30 PM"
  ];

  return Padding(
    padding: const EdgeInsets.only(top: 0), // 👈 reduced top spacing
    child: GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: times.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 2.5,
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
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: Colors.grey.shade300,
              ),
            ),
            child: Text(
              times[index],
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      },
    ),
  );
}
  /// ---------- BUTTON ----------
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
        child: Text("Book Appointment",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600)),
      ),
    );
  }
}