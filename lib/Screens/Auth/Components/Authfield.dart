import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/Data/AppColors.dart';
import 'package:task_app/Data/AppTypography.dart';
import 'package:task_app/Screens/Auth/Components/Validation.dart';

class AuthField extends StatefulWidget {
  final TextEditingController controller;
  final bool isPassword;
  final bool confirmpass;
  final String hintText;
  final String icon;
  const AuthField({
    super.key,
    required this.controller,
    this.isPassword = false,
    required this.hintText,
    required this.icon,
    this.confirmpass = false,
  });

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  bool isObscure = true;

  void _togglePasswordVisibility() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.controller,
        obscureText: widget.isPassword ? isObscure : false,
        validator: (value) {
          if (widget.isPassword) {
            return CustomValidator.validatePassword(value);
          } else if (widget.confirmpass) {
            return CustomValidator.confirmPassword(value);
          } else {
            return CustomValidator.validateUsername(value);
          }
        },
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 20),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35.0.r),
            borderSide: BorderSide(color: AppColors.kWhite, width: 1.0.w),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35.0.r),
            borderSide: BorderSide(color: AppColors.kWhite, width: 1.0.w),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35.0.r),
            borderSide: BorderSide(color: AppColors.kWhite, width: 1.0.w),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35.0.r),
            borderSide: BorderSide(color: AppColors.kWhite, width: 1.0.w),
          ),
          filled: true,
          fillColor: AppColors.kWhite,
          hintText: widget.hintText,
          hintStyle: AppTypography.kLight12.copyWith(color: AppColors.kBlack),
        ));
  }
}
