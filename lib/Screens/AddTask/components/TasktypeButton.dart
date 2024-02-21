import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_app/Data/AppTypography.dart';
import 'package:task_app/Model/Categorydata.dart';

class TaskTypeButton extends StatefulWidget {
  const TaskTypeButton({
    super.key,
    required this.title,
    required this.color,
  });

  final String title;
  final Color color;

  @override
  State<TaskTypeButton> createState() => _TaskTypeButtonState();
}

String type = "";

class _TaskTypeButtonState extends State<TaskTypeButton> {
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        constraints:
            const BoxConstraints(minHeight: 25, maxHeight: 35, maxWidth: 90),
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Center(
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: AppTypography.kLight10,
          ),
        ),
      ),
      onTap: () {
        setState(() {
          type = widget.title;
        });
        //     texttransfer();
      },
    );
  }
}
