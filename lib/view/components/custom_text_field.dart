import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swd_mobile_app_test/src/components.dart';
import 'package:swd_mobile_app_test/src/config.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    required this.fieldLabel,
    super.key,
    this.height,
    this.width,
    this.hint,
    this.controller,
    this.labelHint = '',
    this.spacing,
    this.keyboardType,
    this.initialValue,
    this.readOnly = false,
    this.padding,
    this.prefixIcon,
    this.password = false,
    this.trailing,
    this.onTap,
    this.textCapitalization = TextCapitalization.sentences,
    this.textAlign = TextAlign.start,
    this.textColor,
    this.maxLines,
    this.isFilled = true,
    this.fillColor = AppColors.kGraphiteBlack,
    // const Color(0xffF9F9F9),
    this.borderColor,
    this.validator,
    this.onChanged,
    this.obscureInput = false,
    this.onObscureText,
    this.borderRadius = 8,
    this.maxlength,
    this.enabled = true,
    this.useForgotPass = false,
    this.onForgotPassTap,
    this.visibleField = true,
    this.borderWidth = 1.0,
    this.focusNode,
    this.showError = true,
    this.errorText,
    this.showSuffixIcon = true,
  });

  final String? hint;
  final String fieldLabel;
  final String labelHint;
  final double? spacing;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? initialValue;
  final bool readOnly;
  final EdgeInsetsGeometry? padding;
  final Widget? prefixIcon;
  final bool? password;
  final Widget? trailing;
  final VoidCallback? onTap;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign;
  final Color? textColor;
  final int? maxLines;
  final double? borderWidth;
  final bool isFilled;
  final Color? fillColor;
  final Color? borderColor;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final bool obscureInput;
  final void Function()? onObscureText;
  final double borderRadius;
  final int? maxlength;
  final bool useForgotPass;
  final bool enabled;
  final void Function()? onForgotPassTap;
  final bool visibleField;
  final double? width;
  final double? height;
  final FocusNode? focusNode;
  final bool? showError;
  final String? errorText;
  final bool? showSuffixIcon;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  // myFocusNode = focusNode;
  @override
  Widget build(BuildContext context) {
    final myFocusNode = widget.focusNode;
    final theme = Theme.of(context);

    return Visibility(
      visible: widget.visibleField,
      child: Container(
        width: widget.width,
        height: widget.height,
        padding: EdgeInsets.only(bottom: 4.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              text: widget.labelHint,
              color: AppColors.kWhite,
              fontSize: 16.spMin,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(
              height: 4.6.h,
            ),
            TextFormField(
              onChanged: widget.onChanged,
              maxLength: widget.maxlength,
              controller: widget.controller,
              focusNode: myFocusNode,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: AppColors.kWhite,
                fontWeight: FontWeight.w400,
                fontFamily: aeonik,
                fontSize: 16.spMin,
              ),
              keyboardType: widget.keyboardType,
              initialValue: widget.initialValue,
              textCapitalization: widget.textCapitalization,
              onTap: widget.onTap,
              readOnly: widget.readOnly,
              enabled: widget.enabled,
              textAlign: widget.textAlign,
              maxLines: widget.maxLines ?? 1,
              validator: widget.validator,
              obscureText: widget.obscureInput,
              decoration: InputDecoration(
                border: widget.readOnly ? InputBorder.none : null,
                hintText: widget.hint,
                hintStyle: theme.textTheme.bodyMedium!.copyWith(
                  color: const Color(0xffA4A4A4),
                  fontFamily: aeonik,
                  fontSize: 16.spMin,
                  fontWeight: FontWeight.w400,
                ),
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.textAlign == TextAlign.center
                    ? null
                    : widget.showSuffixIcon!
                        ? Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Visibility(
                                visible: widget.password!,
                                child: GestureDetector(
                                  onTap: widget.onObscureText,
                                  child: SizedBox(
                                    height: 40.h,
                                    width: 45.w,
                                    // color: Colors.red,
                                    child: Icon(
                                      widget.obscureInput
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      size: 20.r,
                                      color: AppColors.kWhite,
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: widget.trailing != null,
                                child: widget.trailing ?? const SizedBox(),
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                filled: widget.isFilled,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                fillColor: AppColors.kGraphiteBlack,
                enabledBorder: widget.isFilled
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(widget.borderRadius),
                        borderSide: BorderSide(
                          color: widget.borderColor ?? AppColors.kStoneGray,
                        ),
                      )
                    : InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide:
                      BorderSide(color: AppColors.kStoneGray, width: widget.borderWidth!.spMin),
                ),
                errorBorder: widget.showError == true
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(widget.borderRadius),
                        borderSide: const BorderSide(color: Colors.red),
                      )
                    : null,
                focusedErrorBorder: widget.showError == true
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(widget.borderRadius),
                        borderSide: const BorderSide(color: Colors.red),
                      )
                    : null,
                errorText: widget.showError == true ? widget.errorText : null,
                errorStyle: const TextStyle(color: Colors.red),
                errorMaxLines: 4,
              ),
            ),
            // if (myFocusNode.hasFocus)
            //   Text(
            //     // 'Hello',
            //     validatorOne.validateEmail(widget.controller!.text) ?? '',
            //     // widget.validators!.validateEmail(widget.controller!.text) ?? '',
            //     style: TextStyle(color: Colors.red),
            //   ),

            Gap(
              5.spMin,
            ),

            Visibility(
              visible: widget.useForgotPass,
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: widget.onForgotPassTap,
                  child: Text(
                    'Forgot Password?',
                    style: theme.textTheme.labelLarge!.copyWith(
                      color: AppColors.kWhite,
                      fontWeight: FontWeight.w400,
                      fontFamily: aeonik,
                      fontSize: 14.spMin,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
