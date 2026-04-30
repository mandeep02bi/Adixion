import 'package:flutter/material.dart';

class CertificateCard extends StatelessWidget {
  final String title;
  final String date;

  const CertificateCard({
    super.key,
    required this.title,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF3F6),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [

          /// AVATAR
          // Container(
          //   height: 40,
          //   width: 40,
          //   decoration: const BoxDecoration(
          //     color: Color(0xFF4C6EF5),
          //     shape: BoxShape.circle,
          //   ),
          //   child: const Center(
          //     child: Text(
          //       "AT",
          //       style: TextStyle(color: Colors.white),
          //     ),
          //   ),
          // ),
           CircleAvatar(
                                  radius: 22,
                                  backgroundColor: Colors.blueGrey,
                                  child: const Text("AT",
                                      style: TextStyle(color: Colors.white)),
                                ),

          const SizedBox(width: 12),

          /// TEXT
          Expanded(
            child: Text(
              date,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          /// 👁 ICON
          // const Icon(Icons.remove_red_eye, color: Colors.orange),
          Image.asset(
            "assets/images/Icons/Patient/Eye.png",
            height: 22,
            width: 22,
          )
        ],
      ),
    );
  }
}