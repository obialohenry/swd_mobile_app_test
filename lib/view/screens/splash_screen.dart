import 'package:swd_mobile_app_test/src/components.dart';
import 'package:swd_mobile_app_test/src/config.dart';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBlack,
      body: Center(
        child: TextView(
          text: "Splash Screen",
          fontSize: 18.spMin,
        ),
      ),
    );
  }
}
