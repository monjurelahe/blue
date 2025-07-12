import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'show_profile.dart'; // 👈 Create this screen next

class AddProfile extends StatefulWidget {
  const AddProfile({super.key});

  @override
  State<AddProfile> createState() => _AddProfileState();
}

class _AddProfileState extends State<AddProfile> {
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      Navigator.pop(context); // Close bottom sheet

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ShowProfilePage(imageFile: File(pickedFile.path)),
        ),
      );
    }
  }

  void _showImagePickerBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Add Profile Picture',
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
                IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(context)),
              ],
            ),
            SizedBox(height: 20.h),

            GestureDetector(
              onTap: () => _pickImage(ImageSource.camera),
              child: _buildOption(Icons.camera_alt, "Camera"),
            ),
            GestureDetector(
              onTap: () => _pickImage(ImageSource.gallery),
              child: _buildOption(Icons.photo, "Gallery"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(IconData icon, String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey.shade800),
          SizedBox(width: 12.w),
          Text(label, style: TextStyle(fontSize: 16.sp)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(390, 844));
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/terms.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 3)],
                      ),
                      padding: EdgeInsets.all(8.w),
                      child: const Icon(Icons.arrow_back, size: 20),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Add a profile picture',
                          style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w600)),
                      SizedBox(height: 10.h),
                      Text(
                        'Add a profile picture so your friends can recognize you.',
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50.h),
                Center(
                  child: Image.asset(
                    'assets/images/add_profile.png',
                    height: 150.h,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 45.h,
                  child: ElevatedButton(
                    onPressed: _showImagePickerBottomSheet,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFDCC02),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text("Add Picture",
                        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
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
