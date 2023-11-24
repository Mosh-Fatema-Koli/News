import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizedPad extends StatelessWidget {
  const SizedPad({super.key, this.height});
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:height==null?10.h:height!.h,
    );
  }
}