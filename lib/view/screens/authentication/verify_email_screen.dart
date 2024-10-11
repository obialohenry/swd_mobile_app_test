import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swd_mobile_app_test/src/components.dart';
import 'package:swd_mobile_app_test/src/config.dart';
import 'package:swd_mobile_app_test/src/utils.dart';
import 'package:swd_mobile_app_test/view/components/button.dart';
import 'package:swd_mobile_app_test/view/components/custom_text_field.dart';
import 'package:swd_mobile_app_test/view/components/gradient_text.dart';
import 'package:swd_mobile_app_test/view/components/pin_code_field.dart';
import 'package:swd_mobile_app_test/view_model/auth/sign_up_view_model.dart';

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
              text: "Verify your email",
              fontSize: 25.spMin,
              fontWeight: FontWeight.w200,
              color: AppColors.kWhite,
            ),
            Gap(15.h),
            RichText(
              text: TextSpan(
                  text: "Please enter the OTP sent to\n",
                  style: TextStyle(
                    fontSize: 16.spMin,
                    fontWeight: FontWeight.w400,
                    color: AppColors.kAshGrey,
                  ),
                  children: [
                    TextSpan(
                      text: "tolu.ab19@gmail.com",
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
                SWDPinCodeField(),
                Gap(5.w),
                TextView(
                  text: "-",
                  fontSize: 24.spMin,
                  color: AppColors.kAshGrey,
                ),
                Gap(5.w),
                SWDPinCodeField(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
