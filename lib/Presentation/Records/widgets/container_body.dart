import 'package:doctor/core/Theme/color_app.dart';
import 'package:flutter/material.dart';

class ContainerBody extends StatelessWidget {
  final String name;
  final String age;
  final String email;
  final String mobile;
  final String date;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const ContainerBody({
    super.key,
    required this.name,
    required this.age,
    required this.email,
    required this.mobile,
    required this.date,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: ColorApp.boderContainer, width: 2),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 14, bottom: 10),
            child: Text(
              date,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            child: Column(
              children: [
                buildRow('Name:', name),
                const SizedBox(height: 8),
                buildRow('Age :', age),
                const SizedBox(height: 8),
                buildRow('Email:', email),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(child: buildRow('Mobile:', mobile)),
                    GestureDetector(
                      onTap: onEdit,
                      child: Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade100,
                        ),
                        child: const Icon(
                          Icons.edit_outlined,
                          size: 18,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: onDelete,
                      child: Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade100,
                          border: Border.all(color: ColorApp.labelColor),
                        ),
                        child: const Icon(
                          Icons.delete_outline,
                          size: 18,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 55,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
