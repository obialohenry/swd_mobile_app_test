import 'package:flutter/material.dart';
import 'package:swd_mobile_app_test/src/components.dart';
import 'package:swd_mobile_app_test/src/config.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<QuickActionsModel> quickActions = [
    QuickActionsModel(logo: AppImages.dataLogo, title: "Data"),
    QuickActionsModel(logo: AppImages.airtimeLogo, title: "Airtime"),
    QuickActionsModel(logo: AppImages.showMaxLogo, title: "Showmax"),
    QuickActionsModel(logo: AppImages.giftCardsLogo, title: "Giftcards"),
    QuickActionsModel(logo: AppImages.bettingLogo, title: "Betting"),
    QuickActionsModel(logo: AppImages.electricityLogo, title: "Electricity"),
    QuickActionsModel(logo: AppImages.tvCableLogo, title: "Tv/Cable"),
    QuickActionsModel(logo: AppImages.ePinLogo, title: "E-Pin"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimary,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const UserProfileContainer(),
            Gap(30.h),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
              child: QuickActions(quickActions: quickActions),
            ),
            Gap(30.h),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
              child: const NewsAndUpdate(),
            ),
            Gap(65.h)
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 52.w,
        height: 52.h,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: AppColors.kDeafaultButtoGradient,
        ),
        child: Center(
          child: ImageView.asset(
            AppImages.chatConversationLogo,
            width: 32.w,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class UserProfileContainer extends StatelessWidget {
  const UserProfileContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.r),
          bottomRight: Radius.circular(24.r),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ImageView.asset(
                AppImages.userLogo,
                width: 44.w,
              ),
              ImageView.asset(
                AppImages.welcomeSamLogo,
                width: 110.w,
              ),
              ImageView.asset(
                AppImages.notificationLogo,
                width: 44.w,
              ),
            ],
          ),
          Gap(20.h),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: AppColors.kDeafaultButtoGradient,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: "Wallet balance".toUpperCase(),
                      fontSize: 10.spMin,
                      color: AppColors.kWhite,
                    ),
                    Gap(5.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextView(
                          text: "NGN 50,000",
                          fontSize: 14.spMin,
                          color: AppColors.kWhite,
                          fontWeight: FontWeight.w700,
                        ),
                        Gap(3.w),
                        Icon(
                          Icons.visibility_off_outlined,
                          size: 10.r,
                          color: AppColors.kWhite,
                        ),
                      ],
                    ),
                    Gap(10.h),
                    Container(
                      width: 101.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.r),
                          color: AppColors.kWhite.withOpacity(0.6)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextView(
                            text: "Cashback",
                            fontSize: 10.spMin,
                            color: AppColors.kGraphiteBlack100,
                            fontWeight: FontWeight.w400,
                          ),
                          Gap(3.h),
                          GradientText(
                            text: "N341.20",
                            fontSize: 10.spMin,
                            fontWeight: FontWeight.w700,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                    height: 69.h,
                    width: 3.w,
                    child: VerticalDivider(
                      thickness: 1.w,
                      color: Color(0xffD04E4E).withOpacity(0.6),
                    )),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    gradient: AppColors.kDeafaultButtoGradient,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.r),
                      bottomRight: Radius.circular(8.r),
                    ),
                    color: AppColors.kWhite.withOpacity(0.2),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(
                        text: "MONIEPOINT",
                        fontSize: 10.spMin,
                        color: AppColors.kWhite,
                      ),
                      Gap(5.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextView(
                            text: "8192017482",
                            fontSize: 16.spMin,
                            color: AppColors.kWhite,
                            fontWeight: FontWeight.w700,
                          ),
                          Gap(5.w),
                          ImageView.asset(
                            AppImages.copyLogo,
                            width: 14.w,
                            color: AppColors.kWhite,
                          ),
                        ],
                      ),
                      Gap(5.h),
                      TextView(
                        text: "Deposit Fee: N20",
                        fontSize: 10.spMin,
                        color: AppColors.kWhite,
                        decoration: TextDecoration.underline,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Gap(20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  ImageView.asset(
                    AppImages.plusLogo,
                    width: 20.w,
                  ),
                  Gap(10.h),
                  TextView(
                    text: "Top up",
                    fontSize: 14.spMin,
                    fontWeight: FontWeight.w500,
                    color: AppColors.kGraphite,
                  )
                ],
              ),
              Gap(20.w),
              SizedBox(
                  height: 17.h,
                  width: 3.w,
                  child: VerticalDivider(
                    thickness: 1.w,
                    color: AppColors.kLightSilver,
                  )),
              Gap(20.w),
              Column(
                children: [
                  ImageView.asset(
                    AppImages.sendLogo,
                    width: 20.w,
                  ),
                  Gap(10.h),
                  TextView(
                    text: "Transfer",
                    fontSize: 14.spMin,
                    fontWeight: FontWeight.w500,
                    color: AppColors.kGraphite,
                  )
                ],
              ),
              Gap(20.w),
              SizedBox(
                  height: 17.h,
                  width: 3.w,
                  child: VerticalDivider(
                    thickness: 1.w,
                    color: AppColors.kLightSilver,
                  )),
              Gap(20.h),
              Column(
                children: [
                  ImageView.asset(
                    AppImages.clockLogo,
                    width: 20.w,
                  ),
                  Gap(10.h),
                  TextView(
                    text: "History",
                    fontSize: 14.spMin,
                    fontWeight: FontWeight.w500,
                    color: AppColors.kGraphite,
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class NewsAndUpdate extends StatelessWidget {
  const NewsAndUpdate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextView(
              text: "News & Update",
              fontSize: 18.spMin,
              fontWeight: FontWeight.w500,
              color: AppColors.kWhite,
            ),
            TextView(
              text: "View all",
              fontSize: 16.spMin,
              fontWeight: FontWeight.w500,
              color: AppColors.kCoralRed,
            )
          ],
        ),
        Gap(10.h),
        SizedBox(
          height: 120.h,
          child: ListView.builder(
            itemCount: 2,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.only(right: 10.w),
              height: 120.h,
              width: 285.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                image: const DecorationImage(
                  image: AssetImage(AppImages.dummyLogo),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class QuickActions extends StatelessWidget {
  const QuickActions({
    super.key,
    required this.quickActions,
  });

  final List<QuickActionsModel> quickActions;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          text: "Quick Actions",
          fontSize: 18.h,
          fontWeight: FontWeight.w500,
          color: AppColors.kWhite,
        ),
        Gap(20.h),
        Wrap(
            children: List.generate(
          quickActions.length,
          (index) => Container(
            width: 78.w,
            height: 75.h,
            margin: EdgeInsets.only(right: 5.w, bottom: 5.h),
            decoration: BoxDecoration(
                color: AppColors.kGraphiteBlack100, borderRadius: BorderRadius.circular(5.r)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageView.asset(
                  quickActions[index].logo,
                  width: 20.w,
                  height: 20.h,
                ),
                Gap(10.h),
                TextView(
                  text: quickActions[index].title,
                  fontSize: 14.spMin,
                  fontWeight: FontWeight.w200,
                  color: AppColors.kWhite,
                )
              ],
            ),
          ),
        ))
      ],
    );
  }
}

class QuickActionsModel {
  final String logo;
  final String title;
  QuickActionsModel({required this.logo, required this.title});
}
