import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:provider/provider.dart';
import 'package:task_app/Data/AppColors.dart';
import 'package:task_app/Data/AppTypography.dart';
import 'package:task_app/Model/Todolist.dart';
import 'package:task_app/Screens/AddTask/components/CategoryButton.dart';
import 'package:task_app/Screens/AddTask/components/TasktypeButton.dart';
import 'package:task_app/Screens/Auth/Components/Authfield.dart';

import 'package:task_app/Services/firestore.dart';

class TileCard extends StatelessWidget {
  const TileCard({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
        builder: (context, value, child) => (InkWell(
            onTap: () {
              TextEditingController controller = TextEditingController();
              TextEditingController descontroller = TextEditingController();
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Column(
                          children: [
                            AuthField(
                                controller: controller,
                                hintText: "Add title",
                                icon: ''),
                            SizedBox(
                              height: 10.h,
                            ),
                            AuthField(
                                controller: descontroller,
                                hintText: "Add description",
                                icon: ''),
                          ],
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () {
                              for (int index = 0;
                                  index < value.todos.length;
                                  index++) {
                                var temptodo = Todo(
                                  title: controller.text,
                                  description: descontroller.text,
                                  type: type,
                                  category: category,
                                );

                                if (index >= 0 && index < value.todos.length) {
                                  temptodo.id = value.todos[index].id;
                                }

                                if (temptodo.id != null) {
                                  context
                                      .read<TodoProvider>()
                                      .editTodo(temptodo);
                                } else {
                                  // Handle the case where id is null (optional, depending on your logic)
                                }

                                Navigator.pop(context);
                              }
                            },
                            child: Text("Update"),
                          ),
                        ],
                      ));
            },
            child: ListTile(
              leading: Text(
                title,
                style: AppTypography.kLight20.copyWith(color: AppColors.kBlack),
              ),
              trailing: InkWell(
                onTap: () {
                  context.read<TodoProvider>().deleteTodo('');
                },
                child: Icon(
                  Icons.delete,
                  color: AppColors.kthemedark,
                ),
              ),
              title: Icon(
                Icons.edit,
                color: AppColors.kthemedark,
              ),
            ))));
  }
}
