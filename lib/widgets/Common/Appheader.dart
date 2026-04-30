import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onBack;
  final VoidCallback? onAdd;
  final String? backgroundImage;

  const AppHeader({
    super.key,
    required this.title,
    this.onBack,
    this.onAdd,
    this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Stack(
        children: [

          /// 🔷 BACKGROUND (Image OR Gradient)
          // Positioned.fill(
          //   child: backgroundImage != null
          //       ? Image.asset(
          //           backgroundImage!,
          //           fit: BoxFit.cover,
          //         )
          //       : Container(
          //           decoration: const BoxDecoration(
          //             gradient: LinearGradient(
          //               colors: [
          //                 Color(0xFF2D9CDB),
          //                 Color(0xFF6C63FF),
          //               ],
          //               begin: Alignment.topLeft,
          //               end: Alignment.bottomRight,
          //             ),
          //           ),
          //         ),
          // ),
              Image.asset(
                    "assets/images/Header/header.png",
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),

          /// 🔵 TOP RIGHT CIRCLE EFFECT (like screenshot)
          // Positioned(
          //   top: -30,
          //   right: -30,
          //   child: Container(
          //     height: 120,
          //     width: 120,
          //     decoration: BoxDecoration(
          //       color: Colors.white.withOpacity(0.15),
          //       shape: BoxShape.circle,
          //     ),
          //   ),
          // ),
           Positioned(
                    top: 42,
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

          /// 🔷 CONTENT
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  /// 🔙 BACK
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.white24,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: onBack,
                      icon: const Icon(Icons.arrow_back,
                          color: Colors.white),
                    ),
                  ),

                  /// 🏷 TITLE
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  // /// ➕ ADD
                  // CircleAvatar(
                  //   radius: 22,
                  //   backgroundColor: Colors.white24,
                  //   child: IconButton(
                  //     padding: EdgeInsets.zero,
                  //     constraints: const BoxConstraints(),
                  //     onPressed: onAdd,
                  //     icon: const Icon(Icons.add, color: Colors.white),
                  //   ),
                  // ),
                  onAdd != null
                  ? CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.white24,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: onAdd,
                        icon: Image.asset(
                        "assets/images/Icons/Patient/Add.png",
                        height: 80,
                        width: 80,
                        // color: Colors.white, // remove if icon already white
                      ),
                      ),
                    )
                  : const SizedBox(width: 44), // 👈 keeps layout balanced
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
} 