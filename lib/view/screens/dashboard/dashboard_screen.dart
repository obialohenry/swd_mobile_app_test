import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swd_mobile_app_test/src/components.dart';
import 'package:swd_mobile_app_test/src/config.dart';
import 'package:swd_mobile_app_test/view/screens/dashboard/home_screen.dart';
import 'package:swd_mobile_app_test/view/screens/dashboard/referrals_screen.dart';
import 'package:swd_mobile_app_test/view/screens/dashboard/services_screen.dart';
import 'package:swd_mobile_app_test/view/screens/dashboard/settings_screen.dart';
import 'package:swd_mobile_app_test/view/screens/dashboard/statistics_screen.dart';
import 'package:swd_mobile_app_test/view_model/dashboard_view_model.dart';

class DashBoardScreen extends ConsumerStatefulWidget {
  const DashBoardScreen({super.key});

  @override
  ConsumerState<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends ConsumerState<DashBoardScreen> {
  List<Widget> dashboardScreens = [
    HomeScreen(),
    const ServicesScreen(),
    const StatisticsScreen(),
    const ReferralScreen(),
    const SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    var dashboardProvider = ref.watch(dashboardViewModel);
    return Scaffold(
      backgroundColor: AppColors.kPrimary,
      body: dashboardScreens[dashboardProvider.selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.kPrimary,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageView.asset(
              AppImages.houseLogo,
              height: 24.h,
              width: 24.w,
              color: dashboardProvider.selectedIndex == 0 ? AppColors.kWhite : AppColors.kIronGray,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: ImageView.asset(
              //services
              AppImages.houseLogo,
              height: 24.h,
              width: 24.w,
              color: dashboardProvider.selectedIndex == 1 ? AppColors.kWhite : AppColors.kIronGray,
            ),
            label: "Services",
          ),
          BottomNavigationBarItem(
            icon: ImageView.asset(
              AppImages.arrowDownUpLogo,
              height: 24.h,
              width: 24.w,
              color: dashboardProvider.selectedIndex == 2 ? AppColors.kWhite : AppColors.kIronGray,
            ),
            label: "Statistics",
          ),
          BottomNavigationBarItem(
            icon: ImageView.asset(
              AppImages.referralsLogo,
              height: 24.h,
              width: 24.w,
              color: dashboardProvider.selectedIndex == 3 ? AppColors.kWhite : AppColors.kIronGray,
            ),
            label: "Referrals",
          ),
          BottomNavigationBarItem(
            icon: ImageView.asset(
              AppImages.settingsLogo,
              height: 24.h,
              width: 24.w,
              color: dashboardProvider.selectedIndex == 4 ? AppColors.kWhite : AppColors.kIronGray,
            ),
            label: "Settings",
          ),
        ],
        unselectedItemColor: AppColors.kIronGray,
        selectedItemColor: AppColors.kWhite,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(
          fontSize: 12.spMin,
          color: AppColors.kWhite,
          fontWeight: FontWeight.w400,
        ),
        unselectedFontSize: 12.spMin,
        currentIndex: dashboardProvider.selectedIndex,
        onTap: dashboardProvider.onItemClicked,
      ),
    );
  }
}
