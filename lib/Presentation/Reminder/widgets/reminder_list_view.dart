
import 'package:doctor/Core/helper/image_assets.dart';
import 'package:doctor/Presentation/Reminder/reminder_notes.dart';
import 'package:doctor/Presentation/Reminder/reminder_pay.dart';
import 'package:doctor/Presentation/Reminder/widgets/action_button.dart';
import 'package:doctor/Presentation/Reminder/widgets/user_drop_down_card.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ReminderListView extends StatelessWidget {
  final List<Map<String, String>> users;

  const ReminderListView({super.key, required this.users});

  Widget _buildExpandedSection() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFFEEEEEE), width: 1)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ActionButton(
            image: ImageAssets.reminder,
            label: 'Set Reminder',
            onPressed: () {},
          ),
          ActionButton(
            image: ImageAssets.wallet,
            label: 'Payment',
            onPressed: () => Get.to(const ReminderPay()),
          ),
          ActionButton(
            image: ImageAssets.notes,
            label: 'Reminder',
            onPressed: () => Get.to(const ReminderNotes()),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemCount: users.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final user = users[index];
        return UserDropdownCard(
          name: user['name'] ?? '',
          imagePath: user['image'] ?? ImageAssets.at,
          expandedSection: _buildExpandedSection(),
        );
      },
    );
  }
}
