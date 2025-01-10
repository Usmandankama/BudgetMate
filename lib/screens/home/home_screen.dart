import 'package:budget_mate/constatnts/colors.dart';
import 'package:budget_mate/screens/home/components/analytics_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/action_button_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/avatar.jpeg'),
                  ),
                  SizedBox(width: 5.w),
                  const CircleAvatar(
                    backgroundColor: AppColors.accentColor,
                    child: Icon(
                      Icons.notifications,
                      color: AppColors.fontWhite,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Text(
                'Total Balance',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20.sp,
                  color: AppColors.fontLight,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                '\$20000',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.fontWhite,
                ),
              ),
              SizedBox(height: 20.h),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnalyticsText(
                    titleText: 'Total Spent',
                    amount: 1000,
                  ),
                  AnalyticsText(
                    titleText: 'Total Income',
                    amount: 2000,
                  ),
                  AnalyticsText(
                    titleText: 'Goal',
                    amount: 15000,
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Row(
                children: [
                  ActionButtonContainer(
                    onpressed: () {},
                    title: 'Add Expense',
                    icon: Icons.credit_card,
                  ),
                  SizedBox(width: 5.w),
                  ActionButtonContainer(
                    onpressed: () {},
                    title: 'Add Income',
                    icon: Icons.add_card,
                  ),
                  SizedBox(width: 5.w),
                  CircleAvatar(
                    radius: 30.r,
                    child: const Icon(Icons.more_horiz_rounded),
                  )
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Activities',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20.sp,
                      color: AppColors.fontWhite,
                    ),
                  ),
                  Text(
                    'view all',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18.sp,
                      color: AppColors.fontLight,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.h),
              Container(
                height: 500.h,
                decoration: BoxDecoration(
                  color: AppColors.fontWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
