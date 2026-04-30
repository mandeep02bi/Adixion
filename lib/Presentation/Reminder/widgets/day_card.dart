import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DayCard extends StatelessWidget {
  final DateTime day;
  final bool isSelected;
  final VoidCallback onTap;

  const DayCard({
    required this.day,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 78,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFFE8F5F0)
              : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF2EAF8A)
                : const Color(0xFFE0E0E0),
            width: isSelected ? 1.5 : 0.5,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              DateFormat('EEE').format(day),
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: isSelected
                    ? const Color(0xFF2EAF8A)
                    : const Color(0xFF888888),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              '${day.day}',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: isSelected
                    ? const Color(0xFF2EAF8A)
                    : const Color(0xFF1A1A2E),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              DateFormat('MMM').format(day),
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: isSelected
                    ? const Color(0xFF2EAF8A)
                    : const Color(0xFF888888),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
