import 'package:flutter/material.dart';
import 'package:swd_mobile_app_test/src/config.dart';

class GradientText extends StatelessWidget {
  GradientText({
    Key? key,
    this.style,
    this.gradient = AppColors.kDeafaultButtoGradient,
    // begin: Alignment.centerLeft,

    required this.text,
    this.textOverflow = TextOverflow.ellipsis,
    this.textAlign = TextAlign.left,
    this.onTap,
    this.textStyle,
    this.color,
    this.fontSize,
    this.fontFamily,
    this.fontWeight,
    this.maxLines,
    this.decoration,
    this.wordSpacing,
    this.xAlignment = 0.25,
    this.yAlignment = 3,
  }) : super(key: key);

  final TextStyle? style;
  final Gradient? gradient;
  final String text;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  final VoidCallback? onTap;
  final int? maxLines;
  final double? fontSize;
  final TextStyle? textStyle;
  final Color? color;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  final double? wordSpacing;
  final double? xAlignment;
  final double? yAlignment;
  final Gradient defaultGradient = AppColors.kDeafaultButtoGradient;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient!.createShader(
        Rect.fromLTWH(
          0,
          0,
          bounds.width,
          bounds.height,
        ),
      ),
      child: Text(
        text,
        key: key,
        style: textStyle ??
            TextStyle(
              fontFamily: fontFamily ?? 'Satoshi',
              fontSize: fontSize != null ? fontSize! : 14,
              fontWeight: fontWeight ?? FontWeight.w400,
              decoration: decoration,
              wordSpacing: wordSpacing,
            ),
        textAlign: textAlign,
        overflow: textOverflow,
        maxLines: maxLines,
      ),
    );
  }
}
