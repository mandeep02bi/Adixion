import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String? image;
  final String label;
  final VoidCallback onPressed;

  const ActionButton({
    super.key,
    this.image,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (image != null)
            Image.asset(image!, height: 28, width: 25, fit: BoxFit.contain)
          else
            const SizedBox(height: 28),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF000000),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
