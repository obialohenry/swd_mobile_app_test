import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swd_mobile_app_test/src/components.dart';
import 'package:swd_mobile_app_test/src/config.dart';
import 'package:swd_mobile_app_test/src/providers.dart';
import 'package:swd_mobile_app_test/src/screens.dart';


class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    var signupProvider = ref.watch(signupViewModel);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.kPrimary,
      appBar: AppBar(
        foregroundColor: AppColors.kTransparent,
        backgroundColor: AppColors.kTransparent,
        // surfaceTintColor: AppColors.kTransparent,
        leadingWidth: 78.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 15.0.w),
          child: Row(
            children: [
              Icon(
                Icons.arrow_back_ios,
                color: AppColors.kAshGrey,
                size: 24.spMin,
              ),
              Gap(5.w),
              TextView(
                text: "Back",
                fontWeight: FontWeight.w400,
                fontSize: 16.spMin,
                color: AppColors.kAshGrey,
              )
            ],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15.0.w),
            child: GestureDetector(
                onTap: () {},
                child: GradientText(
                  text: "Sign in instead",
                  fontSize: 16.spMin,
                )),
          )
        ],
      ),
      body: Stack(
        children: [
          const MovingCircles(),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 15.h,
              horizontal: 15.h,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: (MediaQuery.sizeOf(context).height) * 0.65,
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (value) => signupProvider.onPageChange(newPage: value),
                    itemCount: signupProvider.signupScreens.length,
                    itemBuilder: (context, index) {
                      return signupProvider.signupScreens[index];
                    },
                  ),
                ),
                Gap(20.h),
                Column(
                  children: [
                    Gap(20.h),
                    DefaultButtonMain(
                      text: signupProvider.currentPage == 0 ? "Next" : "Verify Email",
                      onPressed: () {
                        if (signupProvider.currentPage == 0 &&
                            signupProvider.signupFormKey.currentState!.validate()) {
                          signupProvider.signupFormKey.currentState!.save();
                          
                            signupProvider.setPageViewPageToNextPage();
                            _pageController.animateToPage(1,
                                duration: const Duration(milliseconds: 5), curve: Curves.bounceIn);
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DashBoardScreen(),
                              ),
                            );
                          }
                        
                      },
                    ),
                    Gap(20.h),
                    Row(
                      children: List.generate(
                        2,
                        (indicatorIndex) => Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: indicatorIndex == 0 ? 3.w : 0),
                            height: 3.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.r),
                              color: signupProvider.currentPage == indicatorIndex
                                  ? AppColors.kWhite
                                  : AppColors.kSlateGray,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gap(10.h),
                    TextView(
                      text: signupProvider.currentPage == 0
                          ? "Account information"
                          : "Email verification",
                      fontSize: 16.spMin,
                      fontWeight: FontWeight.w200,
                      color: AppColors.kCoolSilver,
                    )
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
