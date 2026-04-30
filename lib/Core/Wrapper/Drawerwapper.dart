import 'package:doctor/Core/Controller.dart/drawercontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerWrapper extends StatelessWidget {
  final Widget child;

  DrawerWrapper({required this.child});

  final controller = Get.put(DrawerControllerX());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Stack(
          children: [

            /// 🔥 DRAWER
            _buildDrawer(),

            /// 🔥 MAIN SCREEN (ANIMATED)
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              left: controller.isOpen.value ? 250 : 0,
              right: controller.isOpen.value ? -150 : 0,
              top: controller.isOpen.value ? 80 : 0,
              bottom: controller.isOpen.value ? 80 : 0,
              child: GestureDetector(
                onTap: controller.closeDrawer,
                child: AbsorbPointer(
                  absorbing: controller.isOpen.value,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        controller.isOpen.value ? 30 : 0),
                    child: child,
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  /// ================= DRAWER =================
  Widget _buildDrawer() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 60, left: 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF5F6D8A), Color(0xFF3B4A6B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// HEADER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(radius: 25),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Dr. Suraj Kumnar",
                            style: TextStyle(color: Colors.white)),
                        Text("01303-527300",
                            style: TextStyle(color: Colors.white70)),
                      ],
                    ),
                  ],
                ),

                GestureDetector(
                  onTap: controller.closeDrawer,
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.close, color: Colors.white),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            /// MENU ITEMS
            _menuItem(Icons.person, "Profile", () => Get.toNamed('/profile')),
            _menuItem(Icons.people, "My Patients", () {}),
            _menuItem(Icons.payment, "Payments", () {}),
            _menuItem(Icons.description, "E-Letter head", () {}),
            _menuItem(Icons.feedback, "Feedback", () {}),
            _menuItem(Icons.privacy_tip, "Privacy & Policy", () {}),
            _menuItem(Icons.help, "FAQ's", () {}),
            _menuItem(Icons.settings, "Settings", () {}),
            _menuItem(Icons.star, "Rate and review", () {}),
            _menuItem(Icons.contact_mail, "Contact Us", () {}),

            const Spacer(),

            _menuItem(Icons.logout, "Logout", () {}),
          ],
        ),
      ),
    );
  }

  /// ================= MENU ITEM =================
  Widget _menuItem(IconData icon, String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon, color: Colors.white70),
            const SizedBox(width: 15),
            Expanded(
              child: Text(title,
                  style: const TextStyle(color: Colors.white)),
            ),
            const Icon(Icons.arrow_forward_ios,
                color: Colors.white54, size: 14),
          ],
        ),
      ),
    );
  }
}