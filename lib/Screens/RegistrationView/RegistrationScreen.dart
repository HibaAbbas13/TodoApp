import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/Data/AppAssets.dart';
import 'package:task_app/Data/AppColors.dart';
import 'package:task_app/Data/AppTypography.dart';
import 'package:task_app/Screens/Auth/SignUpScreen.dart';
import 'package:task_app/Screens/Components/CommonButton.dart';

class ResgistrationView extends StatelessWidget {
  const ResgistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kthemelight,
        body: Padding(
          padding: const EdgeInsets.only(left: 33, right: 33, top: 50),
          child: SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Text(
                    "TodoApp",
                    style: AppTypography.kExtraBold24,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    "Gets things done with Todo",
                    style: AppTypography.kSemiBold14,
                    textAlign: TextAlign.center,
                  ),
                  Image.asset(
                    AppAssets.regi,
                    height: 300,
                    width: 500,
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  Text(
                    "Streamline your day with our intuitive todo app seamlessly organizing tasks and boosting your productivity.Your ultimate tool for efficient task management",
                    style: AppTypography.kLight14,
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  CommomButton(
                    text: "Get Started ",
                    color: AppColors.kthemedark,
                    color2: AppColors.kBlack,
                    border: Border.all(width: 0),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
