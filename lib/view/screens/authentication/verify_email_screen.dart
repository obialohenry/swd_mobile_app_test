import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swd_mobile_app_test/src/components.dart';
import 'package:swd_mobile_app_test/src/config.dart';
import 'package:swd_mobile_app_test/src/providers.dart';





class VerifyEmailScreen extends ConsumerWidget {
  VerifyEmailScreen({super.key});
  final signupFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var signupProvider = ref.watch(signupViewModel);
    return Scaffold(
      backgroundColor: AppColors.kTransparent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              text: verifyYourEmail,
              fontSize: 25.spMin,
              fontWeight: FontWeight.w200,
              color: AppColors.kWhite,
            ),
            Gap(15.h),
            RichText(
              text: TextSpan(
                  text: pleaseEnterOTP,
                  style: TextStyle(
                    fontSize: 16.spMin,
                    fontWeight: FontWeight.w400,
                    color: AppColors.kAshGrey,
                  ),
                  children: [
                    TextSpan(
                      text: dummyMail,
                      style: TextStyle(
                        fontSize: 16.spMin,
                        fontWeight: FontWeight.w500,
                        color: AppColors.kAshGrey,
                      ),
                    )
                  ]),
            ),
            Gap(40.h),
            //PinCode
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SWDPinCodeField(),
                Gap(5.w),
                TextView(
                  text: "-",
                  fontSize: 24.spMin,
                  color: AppColors.kAshGrey,
                ),
                Gap(5.w),
                const SWDPinCodeField(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
