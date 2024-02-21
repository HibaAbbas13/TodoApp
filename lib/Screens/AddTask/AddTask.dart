import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:task_app/Data/AppColors.dart';
import 'package:task_app/Data/AppTypography.dart';
import 'package:task_app/Model/Categorydata.dart';
import 'package:task_app/Model/Todolist.dart';
import 'package:task_app/Screens/AddTask/components/Categorybutton.dart';
import 'package:task_app/Screens/Auth/Components/Authfield.dart';
import 'package:task_app/Screens/Auth/SignUpScreen.dart';
import 'package:task_app/Screens/Components/CommonButton.dart';
import 'package:task_app/Screens/AddTask/components/TasktypeButton.dart';
import 'package:task_app/Screens/View_Task/ViewTask.dart';
import 'package:task_app/Services/firestore.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController _textcontroller = TextEditingController();
  final TextEditingController _textcontroller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kthemelight,
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 70),
        child: SingleChildScrollView(
          child: Consumer<TodoProvider>(
            builder: (context, value, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create \nNew Todo",
                  style: AppTypography.kBold26,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Task Title",
                  style: AppTypography.kBold16,
                ),
                SizedBox(
                  height: 12.h,
                ),
                AuthField(
                    controller: _textcontroller,
                    hintText: 'Task Title',
                    icon: ""),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "TaskType",
                  style: AppTypography.kBold16,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  children: [
                    TaskTypeButton(title: "Important", color: AppColors.kWhite),
                    SizedBox(
                      width: 10.w,
                    ),
                    TaskTypeButton(
                        title: "Planned", color: AppColors.kthemedark),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Category",
                  style: AppTypography.kBold16,
                ),
                SizedBox(
                  height: 12.h,
                ),
                SizedBox(
                  height: 35.h,
                  width: double.infinity,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return CategoryButton(
                            title: buttonlist[index].title,
                            color: buttonlist[index].color);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 10.w,
                        );
                      },
                      itemCount: buttonlist.length),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "Description",
                  style: AppTypography.kBold16,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 200.h,
                  decoration: BoxDecoration(
                      color: AppColors.kWhite,
                      borderRadius: BorderRadius.circular(20.r)),
                  child: AuthField(
                      controller: _textcontroller2,
                      hintText: "Description",
                      icon: ""),
                ),
                // Description(),
                SizedBox(
                  height: 30.h,
                ),
                CommomButton(
                  text: "Add Todo",
                  color: AppColors.kthemedark,
                  color2: AppColors.kBlack,
                  border: Border.all(width: 0),
                  onTap: () {
                    context.read<TodoProvider>().addTodo(Todo(
                          title: _textcontroller.text,
                          description: _textcontroller2.text,
                          type: type,
                          category: category,
                        ));

                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (builder) => Homepage()),
                        (route) => false);
                    // Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
