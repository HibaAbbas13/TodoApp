import 'package:flutter/material.dart';
import 'package:task_app/Data/AppColors.dart';

class Cateogory {
  final String title;
  Color color;

  Cateogory({required this.title, required this.color});
}

List<Cateogory> buttonlist = [
  Cateogory(title: "Food", color: AppColors.kthemedark),
  Cateogory(title: "Work", color: AppColors.kWhite),
  Cateogory(title: "WorkOut", color: AppColors.kthemedark),
  Cateogory(title: "Design", color: AppColors.kWhite),
  Cateogory(title: "Run", color: AppColors.kthemedark),
  Cateogory(title: "Others", color: AppColors.kthemedark),
];
