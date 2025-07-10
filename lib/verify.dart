import 'package:blue/add_profile.dart';
import 'package:blue/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/signup_screen.png"),
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
                Center(
                  child: Image.asset(
                    'assets/images/verifylogo.png',
                    height: 100.h,
                  ),
                ),
                SizedBox(height: 20.h),

                // OTP Text Field
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: OtpTextField(
                      numberOfFields: 6,
                      borderColor: Color(0xFF512DA8),
                      showFieldAsBox: true,
                      fieldWidth: 40.w, // make square width
                      fieldHeight: 42.h,
                      filled: true,
                      fillColor: Colors.white,
                      borderRadius: BorderRadius.circular(5.r),
                      onCodeChanged: (String code) {
                        // Handle code change here (optional)
                      },
                      onSubmit: (String verificationCode) {
                        // Show dialog or handle OTP submission
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Verification Code"),
                              content: Text(
                                'Code entered is $verificationCode',
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                // Resend OTP
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't you receive any code? ",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12.sp,
                          fontFamily: 'DM Sans/DM Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          // navigate to Sign In
                        },
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SigninScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Resend code",
                            style: TextStyle(
                              color: Colors.blue,
                              fontFamily: 'DM Sans/DM Sans',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Continue Button (After OTP Verification)
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => const AddProfile(),
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 110,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: Color(0xFFFDCC02),
                      ),
                      child: Text(
                        "Verify",
                        style: TextStyle(
                          color: Color(0xFF181818),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
