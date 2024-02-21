import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:task_app/Data/AppColors.dart';
import 'package:task_app/Data/AppTypography.dart';
import 'package:task_app/Model/Todolist.dart';
import 'package:task_app/Screens/AddTask/components/CategoryButton.dart';
import 'package:task_app/Screens/AddTask/components/TasktypeButton.dart';
import 'package:task_app/Screens/Auth/Components/Authfield.dart';
import 'package:task_app/Screens/LandingPage.dart';
import 'package:task_app/Screens/View_Task/Components/TileCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:task_app/Services/firestore.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // ignore: prefer_typing_uninitialized_variables
  var currentime = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kthemelight,
        appBar: AppBar(
          backgroundColor: AppColors.kthemelight,
          title: Text(
            "Scheduled Tasks",
            style: AppTypography.kBold26,
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => LandingPage()));

                // Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: Padding(
            padding: const EdgeInsets.only(left: 30, top: 10, right: 30),
            child: SingleChildScrollView(
                reverse: true,
                child: Consumer<TodoProvider>(
                    builder: (context, value, child) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${currentime.year}\n${currentime.hour}:${currentime.minute}:${currentime.second}",
                                style: AppTypography.kBold20,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              ListView.separated(
                                shrinkWrap: true,
                                itemCount: value.todos.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    elevation: 6,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.r)),
                                    child: ListTile(
                                      tileColor: AppColors.kthemelight,
                                      title: Text(
                                        value.todos[index].title,
                                        style: AppTypography.kLight16.copyWith(
                                            color: AppColors.kthemedark),
                                      ),
                                      subtitle: Text(
                                        value.todos[index].description,
                                        style: AppTypography.kLight14
                                            .copyWith(color: AppColors.kBlack),
                                      ),
                                      isThreeLine: true,
                                      trailing: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            InkWell(
                                              onTap: () {
                                                TextEditingController
                                                    controller =
                                                    TextEditingController(
                                                        text: value.todos[index]
                                                            .title);
                                                TextEditingController
                                                    descontroller =
                                                    TextEditingController(
                                                        text: value.todos[index]
                                                            .description);
                                                showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        AlertDialog(
                                                          title: Column(
                                                            children: [
                                                              AuthField(
                                                                controller:
                                                                    controller,
                                                                hintText:
                                                                    "Add title",
                                                                icon: '',
                                                              ),
                                                              SizedBox(
                                                                  height: 10.h),
                                                              AuthField(
                                                                controller:
                                                                    descontroller,
                                                                hintText:
                                                                    "Add description",
                                                                icon: '',
                                                              ),
                                                            ],
                                                          ),
                                                          actions: <Widget>[
                                                            TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: const Text(
                                                                  "Cancel"),
                                                            ),
                                                            TextButton(
                                                              onPressed: () {
                                                                var temptodo =
                                                                    Todo(
                                                                  title:
                                                                      controller
                                                                          .text,
                                                                  description:
                                                                      descontroller
                                                                          .text,
                                                                  type: type,
                                                                  category:
                                                                      category,
                                                                );
                                                                temptodo.id =
                                                                    value
                                                                        .todos[
                                                                            index]
                                                                        .id;

                                                                context
                                                                    .read<
                                                                        TodoProvider>()
                                                                    .editTodo(
                                                                        temptodo);
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Text(
                                                                  'Update'),
                                                            ),
                                                          ],
                                                        ));
                                              },
                                              child: Icon(
                                                Icons.edit,
                                                color: AppColors.kthemedark,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                context
                                                    .read<TodoProvider>()
                                                    .deleteTodo(
                                                        value.todos[index].id);
                                              },
                                              child: Icon(
                                                Icons.delete,
                                                color: AppColors.kthemedark,
                                              ),
                                            ),
                                          ]),
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    height: 10.h,
                                  );
                                },
                              )
                            ])))));
  }
}
