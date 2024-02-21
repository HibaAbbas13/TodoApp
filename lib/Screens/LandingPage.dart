import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:task_app/Data/AppColors.dart';
import 'package:task_app/Screens/AddTask/AddTask.dart';
import 'package:task_app/Screens/Profile/Profile.dart';

import 'package:task_app/Screens/View_Task/ViewTask.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int selectIndex = 0;
  //bool _isTap = false;
  // ignore: non_constant_identifier_names
  bool is_selected = false;
  List<Widget> pages = [const Homepage(), const AddTask(), Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: pages[selectIndex],
      bottomNavigationBar: SalomonBottomBar(
          backgroundColor: AppColors.kthemelight,
          selectedItemColor: AppColors.kthemedark,
          unselectedItemColor: AppColors.kBlack,
          onTap: (int val) {
            selectIndex = val;
            setState(() {});
          },
          currentIndex: selectIndex,
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text('Home'),
            ),
            SalomonBottomBarItem(
                icon: const Icon(Icons.add), title: const Text('Add Task')),
            SalomonBottomBarItem(
                icon: const Icon(Icons.settings),
                title: const Text('Settings')),
          ]),
    );
  }
}
