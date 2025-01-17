import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swd_mobile_app_test/src/components.dart';
import 'package:swd_mobile_app_test/src/config.dart';
import 'package:swd_mobile_app_test/src/providers.dart';
import 'package:swd_mobile_app_test/src/screens.dart';


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
            label: home,
          ),
          BottomNavigationBarItem(
            icon: ImageView.asset(
              //services
              AppImages.houseLogo,
              height: 24.h,
              width: 24.w,
              color: dashboardProvider.selectedIndex == 1 ? AppColors.kWhite : AppColors.kIronGray,
            ),
            label: services,
          ),
          BottomNavigationBarItem(
            icon: ImageView.asset(
              AppImages.arrowDownUpLogo,
              height: 24.h,
              width: 24.w,
              color: dashboardProvider.selectedIndex == 2 ? AppColors.kWhite : AppColors.kIronGray,
            ),
            label: statistics,
          ),
          BottomNavigationBarItem(
            icon: ImageView.asset(
              AppImages.referralsLogo,
              height: 24.h,
              width: 24.w,
              color: dashboardProvider.selectedIndex == 3 ? AppColors.kWhite : AppColors.kIronGray,
            ),
            label: referrals,
          ),
          BottomNavigationBarItem(
            icon: ImageView.asset(
              AppImages.settingsLogo,
              height: 24.h,
              width: 24.w,
              color: dashboardProvider.selectedIndex == 4 ? AppColors.kWhite : AppColors.kIronGray,
            ),
            label: settings,
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
