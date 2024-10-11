import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swd_mobile_app_test/src/components.dart';
import 'package:swd_mobile_app_test/src/config.dart';
import 'package:swd_mobile_app_test/src/utils.dart';
import 'package:swd_mobile_app_test/view/components/button.dart';
import 'package:swd_mobile_app_test/view/components/custom_text_field.dart';
import 'package:swd_mobile_app_test/view/components/gradient_text.dart';
import 'package:swd_mobile_app_test/view/components/moving_circles.dart';
import 'package:swd_mobile_app_test/view/screens/authentication/sign_up_screen.dart';
import 'package:swd_mobile_app_test/view_model/auth/signin_view_model.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final signinFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var signinProvider = ref.watch(signinViewModel);
    return Scaffold(
      backgroundColor: AppColors.kPrimary,
      body: Stack(
        children: [
          const MovingCircles(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      width: 100.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r), color: AppColors.kEbonyBlack),
                    ),
                    Gap(15.h),
                    ImageView.asset(
                      AppImages.welcomeBackLogo,
                      height: 44.h,
                    ),
                  ],
                ),
                Gap(30.h),
                Column(
                  children: [
                    Form(
                      key: signinFormKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            fieldLabel: "",
                            labelHint: "Email address",
                            controller: signinProvider.emailController,
                            hint: "Enter Email address",
                            validator: (email) => Validators().validateEmptyTextField(email),
                          ),
                          Gap(20.h),
                          CustomTextField(
                            useForgotPass: true,
                            password: true,
                            visibleField: true,
                            fieldLabel: "",
                            labelHint: "Password",
                            controller: signinProvider.passwordController,
                            hint: "Enter Password",
                            obscureInput: signinProvider.obscurePass,
                            onObscureText: signinProvider.togglePassWordVisibility,
                            validator: (email) => Validators().validatePassword(email),
                          ),
                        ],
                      ),
                    ),
                    Gap(20.h),
                    DefaultButtonMain(
                      text: "Sign in",
                      onPressed: () {
                        if (signinFormKey.currentState!.validate()) {
                          signinFormKey.currentState!.save();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const SignUpScreen()));
                        }
                      },
                    ),
                    Gap(15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextView(
                          text: "I don't have an account, ",
                          fontSize: 14.spMin,
                          fontWeight: FontWeight.w400,
                          color: AppColors.kWhite,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: GradientText(text: "Create account"),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
