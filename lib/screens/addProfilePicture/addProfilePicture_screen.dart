import 'dart:io';

import 'package:budgetmate_2/constatnts/colors.dart';
import 'package:budgetmate_2/screens/components/actionButton.dart';
import 'package:budgetmate_2/screens/home/home_screen.dart';
import 'package:budgetmate_2/screens/home/home_shell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class AddProfilePictureScreen extends StatefulWidget {
  const AddProfilePictureScreen({super.key});

  @override
  _AddProfilePictureScreenState createState() =>
      _AddProfilePictureScreenState();
}

class _AddProfilePictureScreenState extends State<AddProfilePictureScreen> {
  // Variable to store the selected image file
  File? _selectedImage;

  /// Pick an image from Camera or Gallery
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path); // Update selected image
      });
    }
  }

  /// Show the bottom sheet for selecting image source
  void _showImageSourceDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            color: AppColors.accentColor,
          ),
          padding: EdgeInsets.all(16),
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt, color: Colors.green),
                title: Text(
                  "Take a Picture",
                  style: TextStyle(color: AppColors.fontWhite),
                ),
                onTap: () async {
                  Navigator.pop(context);
                  await _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library, color: Colors.blue),
                title: Text(
                  "Choose from Gallery",
                  style: TextStyle(color: AppColors.fontWhite),
                ),
                onTap: () async {
                  Navigator.pop(context);
                  await _pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50.h),
            // Profile Picture Text
            Text(
              'Complete Your Profile',
              style: TextStyle(
                color: AppColors.fontWhite,
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),

            // Subtext with a fun tone
            Text(
              'Almost there! Let’s make your profile shine. Add a profile picture to show off your style.',
              style: TextStyle(
                color: AppColors.fontWhite,
                fontSize: 18.sp,
                fontFamily: 'Montserrat',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40.h),

            // Profile Picture Placeholder
            CircleAvatar(
              radius: 80.r,
              // Display the selected image, if available
              backgroundImage: _selectedImage != null
                  ? FileImage(_selectedImage!)
                  : AssetImage('assets/images/avatar.jpeg') as ImageProvider,
              backgroundColor: Colors.grey.shade300,
            ),
            SizedBox(height: 40.h),

            // Add Picture Button (Changed to Done if image is selected)
            ActionButton(
              title: _selectedImage != null ? 'Done' : 'Add a picture',
              onPressed: () {
                if (_selectedImage != null) {
                  // Navigate to the next screen if the image is selected
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeShell()),
                  );
                } else {
                  // Show the image source dialog if no image is selected
                  _showImageSourceDialog(context);
                }
              },
            ),
            SizedBox(height: 20.h),

            // Skip Button (optional)
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeShell()),
                );
              },
              child: Text(
                'Skip for now',
                style: TextStyle(
                  color: AppColors.fontWhite,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
