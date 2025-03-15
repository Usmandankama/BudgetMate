import 'package:budgetmate_2/constatnts/colors.dart';
import 'package:budgetmate_2/screens/settings/components/settings_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'Settings',
          style: TextStyle(fontSize: 24.sp, color: AppColors.fontWhite),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: const AssetImage(
                        'assets/images/avatar.jpeg',
                      ),
                      radius: 60.r,
                    ),
                    Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 24.sp,
                        color: AppColors.fontWhite,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'Accounts',
                style: TextStyle(fontSize: 18.sp, color: AppColors.fontLight),
              ),
              SizedBox(height: 10.h),
              const SettingsTile(text: 'Accounts', icon: Icons.person),
              SizedBox(height: 10.h),
              const SettingsTile(text: 'Accounts', icon: Icons.person),

              SizedBox(height: 10.h),
              Text(
                'Prefrences',
                style: TextStyle(fontSize: 18.sp, color: AppColors.fontLight),
              ),
              SizedBox(height: 10.h),
              const SettingsTile(text: 'Accounts', icon: Icons.person),

              SizedBox(height: 10.h),
              const SettingsTile(text: 'Accounts', icon: Icons.person),

              SizedBox(height: 10.h),
              const SettingsTile(text: 'Accounts', icon: Icons.person),

              SizedBox(height: 10.h),
              const SettingsTile(text: 'Accounts', icon: Icons.person),

              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
