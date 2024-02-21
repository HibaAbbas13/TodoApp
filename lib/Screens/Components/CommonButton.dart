import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_app/Data/AppTypography.dart';

class CommomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color color2;
  final Border border;

  final VoidCallback onTap;
  //bool icon;

  const CommomButton({
    super.key,
    required this.text,
    required this.color,
    required this.color2,
    required this.border,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            height: 52.h,
            width: 345.w,
            decoration: BoxDecoration(
                border: border,
                borderRadius: BorderRadius.circular(16),
                color: color),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(text,
                      style: AppTypography.kSemiBold16.copyWith(color: color2)),
                ],
              ),
            )));
  }
}
