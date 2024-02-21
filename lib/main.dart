//import 'package:firebase_core/firebase_core.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_app/Data/AppAssets.dart';
import 'package:task_app/Data/AppColors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:task_app/Screens/AddTask/AddTask.dart';
import 'package:task_app/Screens/Auth/SignUpScreen.dart';
import 'package:task_app/Screens/Profile/Profile.dart';

import 'package:task_app/Screens/View_Task/ViewTask.dart';
import 'package:task_app/Screens/LandingPage.dart';
import 'package:task_app/Screens/RegistrationView/RegistrationScreen.dart';
import 'package:task_app/Screens/Splash.dart';
import 'package:task_app/Services/firestore.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoProvider>(
      create: (context) => TodoProvider(),
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: MaterialApp(
                  title: 'Stylish',
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                      //primaryColor: AppColors.kRed,
                      fontFamily: "OpenSans",
                      scaffoldBackgroundColor: AppColors.kWhite,
                      appBarTheme:
                          AppBarTheme(backgroundColor: AppColors.kWhite)),
                  scrollBehavior:
                      const ScrollBehavior().copyWith(overscroll: false),
                  routes: {
                    '/': (context) => SplashScreen(),
                    '/registration': (context) => ResgistrationView(),
                  }));
        },
      ),
    );
  }
}
