import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swd_mobile_app_test/src/components.dart';
import 'package:swd_mobile_app_test/src/config.dart';
import 'package:swd_mobile_app_test/src/providers.dart';
import 'package:swd_mobile_app_test/src/screens.dart';
import 'package:swd_mobile_app_test/src/utils.dart';


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
                            labelHint: emailAddress,
                            controller: signinProvider.emailController,
                            hint: enterEmailAddress,
                            validator: (email) => Validators().validateEmptyTextField(email),
                          ),
                          Gap(20.h),
                          CustomTextField(
                            useForgotPass: true,
                            password: true,
                            visibleField: true,
                            fieldLabel: "",
                            labelHint: password,
                            controller: signinProvider.passwordController,
                            hint: enterPassword,
                            obscureInput: signinProvider.obscurePass,
                            onObscureText: signinProvider.togglePassWordVisibility,
                            validator: (email) => Validators().validatePassword(email),
                          ),
                        ],
                      ),
                    ),
                    Gap(20.h),
                    DefaultButtonMain(
                      text: signIn,
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
                          text: iDoNotHaveAnAccount,
                          fontSize: 14.spMin,
                          fontWeight: FontWeight.w400,
                          color: AppColors.kWhite,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: GradientText(text: createAccount),
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
