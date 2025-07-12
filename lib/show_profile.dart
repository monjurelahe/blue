import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowProfilePage extends StatelessWidget {
  final File imageFile;

  const ShowProfilePage({super.key, required this.imageFile});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(390, 844));

    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/terms.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          // Content
          Padding(
            padding: EdgeInsets.all(25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 21),
                      Center(
                        child: Text(
                          'Profile Picture added',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28.sp,
                            color: const Color(0xFF181818),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'DM Sans',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),

                // Profile Image
                Center(
                  child: CircleAvatar(
                    radius: 75.r,
                    backgroundImage: FileImage(imageFile),
                  ),
                ),

                const Spacer(),
                Text(
                  'Your profile is ready! Let’s start your journey with FlexFit!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                // Done Button (or Save / Continue)
                SizedBox(height: 11),
                SizedBox(
                  width: 335.w,
                  height: 40.h,

                  child: ElevatedButton(
                    onPressed: () {
                      // sign up logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFDCC02),
                      padding: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),

                    child: const Text(
                      "Done",
                      style: TextStyle(
                        color: Color(0xFF181818),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'DM Sans',
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
