// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:doctor/Presentation/Reminder/widgets/day_card.dart';
import 'package:doctor/Presentation/Reminder/widgets/select_table_chip.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateReminderPicker extends StatefulWidget {
  const DateReminderPicker({super.key});

  @override
  State<DateReminderPicker> createState() => _DateReminderPickerState();
}

class _DateReminderPickerState extends State<DateReminderPicker> {
  DateTime _selectedDate = DateTime(2026, 3, 15);
  int? _selectedDayOffset;
  String? _selectedPeriod;
  String? _selectedTime;

  final List<String> _periods = [
    '1 Day',
    '5 Day',
    '7 Day',
    '15 Day',
    '1 Month',
  ];

  final List<String> _times = ['03:00 AM', '03:30 AM', '04:00 AM', '04:30 AM'];

  List<DateTime> _getNextDays() {
    final today = DateTime(2026, 3, 12);
    return List.generate(4, (i) => today.add(Duration(days: i)));
  }

  @override
  Widget build(BuildContext context) {
    final days = _getNextDays();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Date Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE0E0E0), width: 0.5),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.calendar_month_outlined,
                  color: Color(0xFF2EAF8A),
                  size: 22,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    DateFormat('EEEE, MMMM d, yyyy').format(_selectedDate),
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: Color(0xFF888888),
                  size: 22,
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Day Cards
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(days.length, (index) {
              final day = days[index];
              final isSelected = _selectedDayOffset == index;
              return DayCard(
                day: day,
                isSelected: isSelected,
                onTap: () => setState(() {
                  _selectedDayOffset = index;
                  _selectedDate = day;
                  _selectedPeriod = null;
                }),
              );
            }),
          ),

          const SizedBox(height: 24),

          // OR Divider
          Row(
            children: const [
              Expanded(child: Divider(color: Color(0xFF1A1A2E), thickness: 1)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'OR',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1A1A2E),
                  ),
                ),
              ),
              Expanded(child: Divider(color: Color(0xFF1A1A2E), thickness: 1)),
            ],
          ),

          const SizedBox(height: 20),

          // Period Chips
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: _periods.map((period) {
              final isSelected = _selectedPeriod == period;
              return SelectableChip(
                label: period,
                isSelected: isSelected,
                onTap: () => setState(() {
                  _selectedPeriod = period;
                  _selectedDayOffset = null;
                }),
              );
            }).toList(),
          ),

          const SizedBox(height: 20),

          // Time Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _times.map((time) {
                final isSelected = _selectedTime == time;
                return SelectableChip(
                  label: time,
                  isSelected: isSelected,
                  onTap: () => setState(() {
                    _selectedTime = time;
                  }),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
