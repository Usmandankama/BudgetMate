import 'package:budgetmate_2/constatnts/colors.dart';
import 'package:budgetmate_2/screens/home/components/analytics_text.dart';
import 'package:budgetmate_2/screens/history/components/history_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/user_controller.dart';
import 'components/action_button_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserController userController = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 50.h),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundImage: AssetImage(
                                'assets/images/avatar.jpeg',
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              'John Smith',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20.sp,
                                color: AppColors.fontWhite,
                              ),
                            ),
                          ],
                        ),
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
                    Text(
                      '\$20000',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.fontWhite,
                      ),
                    ),
                    SizedBox(height: 50.h),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnalyticsText(titleText: 'Total Spent', amount: 1000),
                        AnalyticsText(titleText: 'Total Income', amount: 2000),
                        AnalyticsText(titleText: 'Goal', amount: 15000),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      children: [
                        ActionButtonContainer(
                          onpressed: () {
                            Get.toNamed('/expenses');
                          },
                          title: 'Add Expense',
                          icon: Icons.credit_card,
                        ),
                        SizedBox(width: 5.w),
                        ActionButtonContainer(
                          onpressed: () {
                            Get.toNamed('/income');
                          },
                          title: 'Add Income',
                          icon: Icons.add_card,
                        ),
                        SizedBox(width: 5.w),
                        CircleAvatar(
                          radius: 30.r,
                          child: const Icon(Icons.more_horiz_rounded),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
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
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                ),
                child: const Column(
                  children: [
                    HistoryCard(),
                    HistoryCard(),
                    HistoryCard(),
                    HistoryCard(),
                    HistoryCard(),
                    HistoryCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
