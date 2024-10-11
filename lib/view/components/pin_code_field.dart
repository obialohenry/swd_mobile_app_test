import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:swd_mobile_app_test/src/components.dart';
import 'package:swd_mobile_app_test/src/config.dart';

class SWDPinCodeField extends ConsumerWidget {
  const SWDPinCodeField({Key? key, this.onChange, this.onComplete, this.onValidate})
      : super(key: key);
  final Function(String)? onChange;
  final Function(String)? onComplete;
  final FormFieldValidator<String>? onValidate;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData theme = Theme.of(context);
    return SizedBox(
      width: 160.w,
      child: PinCodeTextField(
        validator: onValidate,
        onCompleted: onComplete,
        appContext: context,
        // obscuringCharacter: '*',
        length: 3,
        // controller: provider.otpController,
        // obscureText: isObscure,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        cursorColor: AppColors.kMochaBrown,
        keyboardType: TextInputType.number,
        animationType: AnimationType.fade,
        onChanged: onChange,
        // hintCharacter: '-',
        // hintStyle: TextStyle(
        //   color: theme.colorScheme.primary,
        //   // fontFamily: satoshi,
        // ),

        pinTheme: PinTheme(
          disabledColor: AppColors.kDarkGraphite,
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(8.r),
          fieldHeight: 52.h,
          fieldWidth: 46.w,
          activeColor: AppColors.kMochaBrown,
          inactiveColor: AppColors.kStoneGray,
          selectedColor: AppColors.kMochaBrown,
          borderWidth: 1.r,
        ),
        animationDuration: const Duration(milliseconds: 300),
      ),
    );
  }
}
