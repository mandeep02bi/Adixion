import 'package:flutter/material.dart';

class PatientWidgets extends StatelessWidget {
  const PatientWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(12),
          //   child: Image.asset(
          //     ImageAssets.at,
          //     width: 40.51,
          //     height: 38.51,
          //     fit: BoxFit.cover,
          //   ),
          // ),
           CircleAvatar(
                                  radius: 22,
                                  backgroundColor: Colors.blueGrey,
                                  child: const Text("AT",
                                      style: TextStyle(color: Colors.white)),
                                ),

    
          const SizedBox(width: 12),
    
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Rishabh Singh',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text(
                  'PT-001 • Age 28 Years',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
    
          // Image.asset(ImageAssets.more, width: 10, height: 5),
        ],
      ),
    );
  }
}