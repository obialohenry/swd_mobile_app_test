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
                  text: "Create an account",
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
                            labelHint: "First name",
                            controller: signupProvider.firstNameController,
                            hint: "First name",
                            validator: (email) => Validators().validateEmptyTextField(email),
                          ),
                        ),
                        Gap(5.w),
                        Expanded(
                          child: CustomTextField(
                            fieldLabel: "",
                            labelHint: "Last name",
                            controller: signupProvider.lastNameController,
                            hint: "Last name",
                            validator: (email) => Validators().validateEmptyTextField(email),
                          ),
                        ),
                      ],
                    ),
                    Gap(15.h),
                    CustomTextField(
                      fieldLabel: "",
                      labelHint: "Phone number",
                      controller: signupProvider.phoneNumberController,
                      keyboardType: TextInputType.number,
                      hint: "Enter phone number",
                      validator: (email) => Validators().validateEmptyTextField(email),
                    ),
                    Gap(15.h),
                    CustomTextField(
                      fieldLabel: "",
                      labelHint: "Email address",
                      controller: signupProvider.emailController,
                      hint: "Enter Email address",
                      validator: (email) => Validators().validateEmptyTextField(email),
                    ),
                    Gap(15.h),
                    CustomTextField(
                      password: true,
                      visibleField: true,
                      fieldLabel: "",
                      labelHint: "Create Password",
                      controller: signupProvider.passwordController,
                      hint: "Enter Password",
                      obscureInput: signupProvider.obscurePass,
                      onObscureText: signupProvider.togglePassWordVisibility,
                      validator: (email) => Validators().validatePassword(email),
                    ),
                    Gap(15.h),
                    CustomTextField(
                      fieldLabel: "",
                      labelHint: "Referral Code (Optional)",
                      controller: signupProvider.referalCodeController,
                      hint: "Enter Referral Code",
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
