import 'package:doctor/core/Theme/color_app.dart';
import 'package:doctor/Core/helper/image_assets.dart';
import 'package:flutter/material.dart';

class PatineWidgetsTemplate extends StatelessWidget {
  final String name;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;
  final VoidCallback? onView;

  const PatineWidgetsTemplate({
    super.key,
    this.name = 'Rishabh Singh',
    this.onDelete,
    this.onEdit,
    this.onView,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: ColorApp.labelColor, width: 1),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              ImageAssets.at,
              width: 40.51,
              height: 38.51,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rishabh Singh',

                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),

          Row(
            children: [
              // 🗑 Delete
              GestureDetector(
                onTap: onDelete,
                child: Image.asset(ImageAssets.delete, height: 22, width: 22),
              ),
              const SizedBox(width: 8),

              // ✏️ Edit
              GestureDetector(
                onTap: onEdit,
                child: Image.asset(ImageAssets.pencile, height: 16, width: 16),
              ),
              const SizedBox(width: 8),

              // 👁 View
              GestureDetector(
                onTap: onView,
                child: Image.asset(ImageAssets.eye, height: 27, width: 25),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
