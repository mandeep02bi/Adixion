import 'package:doctor/Core/Bloc/Login_bloc.dart';
import 'package:doctor/Core/Controller.dart/themecontroller.dart';
import 'package:doctor/Presentation/HomeScreen/doctor_home_sc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Loginsc extends StatefulWidget {
  const Loginsc({super.key});

  @override
  State<Loginsc> createState() => _LoginscState();
}

class _LoginscState extends State<Loginsc> {
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc()..add(LoadLogin()),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              /// Background Image
              Positioned.fill(
                child: Image.asset(
                  "assets/images/background/bg.png",
                  fit: BoxFit.cover,
                ),
              ),

              /// Dark overlay
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.1),
                ),
              ),

              /// Main Content
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return AnimatedOpacity(
                    duration: const Duration(milliseconds: 600),
                    opacity: state.isLoading ? 0 : 1,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 40.h),
                            Text(
                              "Welcome back",
                              style: TextStyle(
                                fontFamily: "Rubik",
                                fontSize: 26.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "You can search course, apply course and find scholarship for abroad studies",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Rubik",
                                fontSize: 14.sp,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 30.h),
                            /// Google + Facebook Buttons
                            Row(
                              children: [
                                Expanded(
                                    child: socialButton("Google",
                                        "assets/images/Icons/login/google.png")),
                                SizedBox(width: 10.w),
                                Expanded(
                                    child: socialButton("Facebook",
                                        "assets/images/Icons/login/facebook.png")),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            /// Email Field
                            TextField(
                              decoration: InputDecoration(
                                hintText: "itsmemamun1@gmail.com",
                                suffixIcon:
                                    const Icon(Icons.check, color: Colors.blue),
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.8),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.r)),
                              ),
                            ),
                            SizedBox(height: 15.h),
                            /// Password Field
                            TextField(
                              obscureText: state.obscureText,
                              decoration: InputDecoration(
                                hintText: "••••••••",
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.visibility_off),
                                  onPressed: () {
                                    context
                                        .read<LoginBloc>()
                                        .add(TogglePassword());
                                  },
                                ),
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.8),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.r)),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            /// Login Button
                            GestureDetector(
                              onTap: () {
                                Get.to(() => const Doctorhomesc());
                              },
                              child: Container(
                                width: double.infinity,
                                height: 55.h,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xff8E2DE2),
                                      Color(0xff4A00E0)
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(14.r),
                                ),
                                child: Center(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      fontFamily: "Rubik",
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15.h),
                            Text("Forgot password",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 14.sp)),
                            SizedBox(height: 40.h),
                            Text("Don’t have an account? Join us",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 14.sp)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget socialButton(String text, String iconPath) {
    return Container(
      height: 55.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconPath,
            width: 24.w,
            height: 24.w,
          ),
          SizedBox(width: 10.w),
          Text(
            text,
            style: TextStyle(
              fontFamily: "Rubik",
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}