import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:task_app/Data/AppAssets.dart';
import 'package:task_app/Data/AppColors.dart';
import 'package:task_app/Data/AppIcons.dart';
import 'package:task_app/Data/AppTypography.dart';
import 'package:task_app/Screens/AddTask/AddTask.dart';
import 'package:task_app/Screens/Auth/Components/Authfield.dart';

import 'package:task_app/Screens/Auth/SignUpScreen.dart';
import 'package:task_app/Screens/Components/CommonButton.dart';
import 'package:task_app/Screens/LandingPage.dart';
import 'package:task_app/Screens/View_Task/ViewTask.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  void enter_login() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AddTask()),
      );
    }
    ;
  }

  final TextEditingController _controller1 = TextEditingController();

  final TextEditingController _controller2 = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kthemelight,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 33, right: 33, top: 40),
              child: Column(

                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 200.h,
                      alignment: Alignment.center,
                      child: LottieBuilder.asset('animations/signup.json'),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      "Welcome Back!",
                      style: AppTypography.kSemiBold18
                          .copyWith(color: AppColors.kBlack),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      "Let’s help you to meet your tasks",
                      style: AppTypography.kLight14
                          .copyWith(color: AppColors.kBlack),
                    ),
                    SizedBox(
                      height: 47.h,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          AuthField(
                            hintText: "Enter Your Email",
                            icon: "NONE",
                            controller: _controller1,
                          ),
                          SizedBox(
                            height: 28.h,
                          ),
                          AuthField(
                            hintText: "Confirm Password",
                            icon: "NONE",
                            controller: _controller2,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    CommomButton(
                      text: "Sign In",
                      color: AppColors.kthemedark,
                      color2: AppColors.kBlack,
                      border: Border.all(width: 0),
                      onTap: () async {
                        try {
                          final credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: _controller1.text,
                                  password: _controller2.text);

                          // ignore: use_build_context_synchronously
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => LandingPage()),
                              (route) => false);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            print('No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            print('Wrong password provided for that user.');
                          }
                        }
                        enter_login();
                      },
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                      },
                      child: const Text.rich(
                        TextSpan(
                          text: 'Do not have an account? ',
                          children: <InlineSpan>[
                            TextSpan(
                              text: 'SignUp',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ));
  }
}
