import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swd_mobile_app_test/src/config.dart';
import 'package:swd_mobile_app_test/src/utils.dart';

class DefaultButtonMain extends StatelessWidget {
  const DefaultButtonMain({
    super.key,
    this.onPressed,
    this.text,
    this.color,
    this.textColor,
    this.borderRadius,
    this.width,
    this.height,
    this.padding,
    this.fontSize,
    this.fontWeight,
    this.borderColor,
    this.buttonState = ButtonState.idle,
    this.danger = false,
    this.showGradient = true,
  });
  final VoidCallback? onPressed;
  final String? text;
  final Color? color;
  final Color? textColor;
  final double? borderRadius;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? borderColor;
  final ButtonState buttonState;
  final bool danger;
  final bool showGradient;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      height: height ?? 48.0.h,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
        /// This line of code is setting the background color of the button. It checks the value of the
        /// `buttonState` parameter and if it is equal to `ButtonState.disabled`, it sets the color to
        /// `AppColors.kDarkGrey`. Otherwise, it sets the color to the value of the `color` parameter,
        /// which is passed in when the function is called. If `color` is null, it sets the color to a
        /// default value of `const Color(0xFF09132D)`.
        color: showGradient == false ? color : null,
        gradient: AppColors.kDeafaultButtoGradient,
        border: Border.all(color: borderColor ?? Colors.transparent),
        borderRadius: BorderRadius.circular(borderRadius ?? 8.0.r),
      ),
      child: ButtonTheme(
        child: MaterialButton(
          padding: EdgeInsets.zero,
          height: height ?? 48.0.h,

          onPressed: (buttonState == ButtonState.disabled || buttonState == ButtonState.loading)
              ? null
              : onPressed,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(borderRadius ?? 8.0.r), // Adjust the radius as needed
          ),
          // disabledColor:(buttonState == ButtonState.disabled)?Colors.grey:null,
          child: Center(
            /// This code is setting the child of the `TextButton` widget. It checks the value of the
            /// `buttonState` parameter and if it is equal to `ButtonState.loading`, it sets the child to
            /// a `SizedBox` widget with a `CircularProgressIndicator` inside it. This is used to indicate
            /// that the button is in a loading state and the user should wait for the action to complete.
            /// If `buttonState` is not equal to `ButtonState.loading`, it sets the child to a `Text`
            /// widget with the `text` parameter passed in when the function is called. The `textColor`,
            /// `fontSize`, and `fontWeight` parameters are also used to style the text.
            child: (buttonState == ButtonState.loading)
                ? const SizedBox.square(
                    dimension: 30,
                    child: CircularProgressIndicator(color: AppColors.kWhite),
                  )
                : Text(
                    text.toString(),
                    style: TextStyle(
                      color: textColor ?? Colors.white,
                      fontSize: fontSize ?? 16.0.spMin,
                      fontWeight: fontWeight ?? FontWeight.w500,
                      fontFamily: aeonik,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
