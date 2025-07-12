import 'dart:io';
import 'package:flutter/material.dart';

class ProfilePhoto extends StatelessWidget {
  final File imageFile;

  const ProfilePhoto({super.key, required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Profile Photo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: FileImage(imageFile),
            ),
            const SizedBox(height: 20),
            const Text(
              "Looks good!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
