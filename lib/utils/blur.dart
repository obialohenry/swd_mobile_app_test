import 'dart:ui';

import 'package:flutter/material.dart';

///blur it's [child]
///[blur] is the value of blur effect, higher the blur more the blur effect (default value = 5)
///[blurColor] is the color of blur effect (default value = Colors.white)
///[borderRadius] is the radius of the child to be blurred
///[colorOpacity] is the opacity of the blurColor (default value = 0.5)
///[overlay] is the widget that can be stacked over blurred widget
///[alignment] is the alignment geometry of the overlay (default value = Alignment.center)
class Blur extends StatelessWidget {
  const Blur({
    super.key,
    required this.child,
    this.blur = 5,
    this.blurColor = Colors.white,
    this.borderRadius,
    this.colorOpacity = 0.5,
    this.overlay,
    this.alignment = Alignment.center,
  });

  final Widget child;
  final double blur;
  final Color blurColor;
  final BorderRadius? borderRadius;
  final double colorOpacity;
  final Widget? overlay;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: Stack(
        children: [
          child,
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
              child: Container(
                decoration: BoxDecoration(
                  color: blurColor.withOpacity(colorOpacity),
                ),
                alignment: alignment,
                child: overlay,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///extension of [Blur] on [Widget] to blur it's child
///same as a [Blur] widget but you can use this as an extension on any widget which
///you want to have a blur effect
///blur is the value of blur effect, higher the blur more the blur effect (default value = 5)
extension BlurExtension on Widget {
  Blur blurred({
    double blur = 5,
    Color blurColor = Colors.white,
    BorderRadius? borderRadius,
    double colorOpacity = 0.5,
    Widget? overlay,
    AlignmentGeometry alignment = Alignment.center,
  }) {
    return Blur(
      blur: blur,
      blurColor: blurColor,
      borderRadius: borderRadius,
      colorOpacity: colorOpacity,
      overlay: overlay,
      alignment: alignment,
      child: this,
    );
  }
}
