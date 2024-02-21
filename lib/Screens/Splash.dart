import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:task_app/Data/AppColors.dart';
import 'package:task_app/Data/AppTypography.dart';
import 'package:task_app/Model/Categorydata.dart';
import 'package:task_app/Screens/AddTask/components/Categorybutton.dart';
import 'package:task_app/Screens/AddTask/components/TasktypeButton.dart';
import 'package:task_app/Screens/Auth/Components/Authfield.dart';
import 'package:task_app/Screens/Components/CommonButton.dart';
import 'package:task_app/Screens/View_Task/ViewTask.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    _timer();
  }

  _timer() {
    var duration = Duration(seconds: 4);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacementNamed(context, '/registration');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kthemelight,
      body: Center(
        child: Container(
          child: LottieBuilder.asset(
            'animations/task2.json',
            reverse: true,
            repeat: false,
          ),
        ),
      ),
    );
  }
}
