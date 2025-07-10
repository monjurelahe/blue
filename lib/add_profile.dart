import 'package:blue/select_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddProfile extends StatefulWidget {
  const AddProfile({super.key});

  @override
  State<AddProfile> createState() => _AddProfile();
}

class _AddProfile extends State<AddProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/terms.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          // Foreground content
          Padding(
            padding: EdgeInsetsGeometry.all(11),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back arrow
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 3,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(8),
                        child: const Icon(Icons.arrow_back, size: 20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),

                // Logo
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Add a profile picture',
                            style: TextStyle(
                              fontSize: 28.sp,
                              color: Color(0xFF181818),
                              fontWeight: FontWeight.w600,
                              fontFamily: 'DM Sans',
                              letterSpacing: 0.20,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Add a profile picture so your friends can recognize you. Your picture will be visible to everyone.',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Color(0xFF181818),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'DM Sans',
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0.15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50.h),
                Center(
                  child: Image.asset(
                    'assets/images/add_profile.png',
                    height: 150.h,
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 40,
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
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          (MaterialPageRoute(
                            builder: (context) =>  SelectProfile(),
                          )),
                        );
                      },
                      child: const Text(
                        "Add Picture",
                        style: TextStyle(
                          color: Color(0xFF181818),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'DM Sans/DM Sans',
                        ),
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
