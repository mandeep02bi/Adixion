import 'package:flutter/material.dart';

class DateCard extends StatelessWidget {
  final String day;
  final String date;
  final bool active;

  const DateCard({
    super.key,
    required this.day,
    required this.date,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: active ? Colors.white : Colors.white70,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Text(day, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 6),
          Text(date,
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold)),
          const Text("Mar", style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}