import 'package:flutter/material.dart';
import 'package:swd_mobile_app_test/src/config.dart';

class Gap extends StatelessWidget {
  const Gap(this.size, {super.key});

  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size?.spMin ?? 10.spMin,
    );
  }
}
