import 'package:flutter/material.dart';
import 'package:swd_mobile_app_test/src/components.dart';
import 'package:swd_mobile_app_test/src/config.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimary,
      body: Center(
        child: TextView(
          text: "Coming Soon",
          fontSize: 25.spMin,
          fontWeight: FontWeight.w300,
          color: AppColors.kWhite,
        ),
      ),
    );
  }
}
