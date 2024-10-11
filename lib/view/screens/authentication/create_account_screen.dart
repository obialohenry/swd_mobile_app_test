import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swd_mobile_app_test/src/components.dart';
import 'package:swd_mobile_app_test/src/config.dart';
import 'package:swd_mobile_app_test/src/providers.dart';
import 'package:swd_mobile_app_test/src/utils.dart';



class CreateAccountScreen extends ConsumerWidget {
  CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var signupProvider = ref.watch(signupViewModel);
    return Scaffold(
      backgroundColor: AppColors.kTransparent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: TextView(
                  text: createAnAccount,
                  fontSize: 25.spMin,
                  fontWeight: FontWeight.w200,
                  color: AppColors.kWhite,
                ),
              ),
              Gap(20.h),
              Form(
                key: signupProvider.signupFormKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            fieldLabel: "",
                            labelHint: firstName,
                            controller: signupProvider.firstNameController,
                            hint: firstName,
                            validator: (email) => Validators().validateEmptyTextField(email),
                          ),
                        ),
                        Gap(5.w),
                        Expanded(
                          child: CustomTextField(
                            fieldLabel: "",
                            labelHint: lastName,
                            controller: signupProvider.lastNameController,
                            hint: lastName,
                            validator: (email) => Validators().validateEmptyTextField(email),
                          ),
                        ),
                      ],
                    ),
                    Gap(15.h),
                    CustomTextField(
                      fieldLabel: "",
                      labelHint: phoneNumber,
                      controller: signupProvider.phoneNumberController,
                      keyboardType: TextInputType.number,
                      hint: enterPhoneNumber,
                      validator: (email) => Validators().validateEmptyTextField(email),
                    ),
                    Gap(15.h),
                    CustomTextField(
                      fieldLabel: "",
                      labelHint: emailAddress,
                      controller: signupProvider.emailController,
                      hint: enterEmailAddress,
                      validator: (email) => Validators().validateEmptyTextField(email),
                    ),
                    Gap(15.h),
                    CustomTextField(
                      password: true,
                      visibleField: true,
                      fieldLabel: "",
                      labelHint: createPassword,
                      controller: signupProvider.passwordController,
                      hint: enterPassword,
                      obscureInput: signupProvider.obscurePass,
                      onObscureText: signupProvider.togglePassWordVisibility,
                      validator: (email) => Validators().validatePassword(email),
                    ),
                    Gap(15.h),
                    CustomTextField(
                      fieldLabel: "",
                      labelHint: referralCode,
                      controller: signupProvider.referalCodeController,
                      hint: enterReferralCode,
                      // validator: (email) => Validators().validateEmptyTextField(email),
                    ),
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
