import 'package:blue/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/signup_screen.png",
                ), // add your bg
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Foreground content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 48.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back arrow
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
                                blurRadius: 4,
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
                  const SizedBox(height: 20),
                  // Logo
                  Center(
                    child: Image.asset('assets/images/logo.png', height: 100),
                  ),
                  const SizedBox(height: 40),
                  // Name Field
                  Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF181818),
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Paragraph/P3_Regular',
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 48, // set your desired height
                    width: double.infinity,
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: "Peter Parker",
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                        ),
                        //filled: true,
                        fillColor: Colors.white.withOpacity(
                          0.3,
                        ), // Semi-transparent
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Email Field
                  Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF181818),
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Paragraph/P3_Regular',
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 48, // set your desired height
                    width: double.infinity,
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "youremail@gmail.com",
                        //filled: true,
                        fillColor: Colors.white.withOpacity(0.3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Password Field
                  Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF181818),
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Paragraph/P3_Regular',
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 48, // set your desired height
                    width: double.infinity,
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: !showPassword,
                      obscuringCharacter: '●',
                      decoration: InputDecoration(
                        hintText: "●●●●●●●●",
                        //filled: true,
                        fillColor: Colors.white.withOpacity(0.3),
                        suffixIcon: IconButton(
                          icon: Icon(
                            showPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Create Account Button
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
                          Navigator.push(context, (MaterialPageRoute(
                            builder: (context) => const SigninScreen(),
                          )));
                        },
                        child: const Text(
                          "Create Account",
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
                  const SizedBox(height: 24),
                  // Divider with text
                  Row(
                    children: const [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text("or continue with"),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Social Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Google
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: InkWell(
                          child: Image.asset(
                            "assets/icons/google.png",
                            height: 60.h,
                            width: 87.sp,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      // Apple
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: InkWell(
                          child: Image.asset(
                            "assets/icons/apple.png",
                            height: 60.h,
                            width: 87.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Sign In Text
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Have an account? ",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
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
                            child: const Text(
                              "Sign in",
                              style: TextStyle(
                                color: Colors.blue,
                                fontFamily: 'DM Sans/DM Sans',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
