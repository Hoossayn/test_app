import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/core/constants/app_images.dart';
import 'package:test_app/core/constants/app_strings.dart';
import 'package:test_app/data/model/task_entity.dart';
import 'package:test_app/presentation/features/add_task/add_task_screen.dart';
import 'package:test_app/presentation/features/edit_task/edit_task_screen.dart';
import 'package:test_app/presentation/widgets/task_widget.dart';

import '../../../bloc/task_bloc.dart';
import '../../../bloc/task_state.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<Task> taskList = [];

  void addTaskToList(Task newTask) {
    setState(() {
      taskList.add(newTask);
    });
  }

  void editTask(Task task, int taskId) {
    setState(() {
      taskList[taskId] = task;
    });
  }

  void callEditPage(Task task, int taskIndex) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) {
          return EditTaskScreen(
            onTaskEdited: editTask,
            task: task,
            taskId: taskIndex,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: ClipOval(
          child: FloatingActionButton(
            backgroundColor: const Color(0XFF3556AB),
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 500),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return AddTaskScreen(
                      onTaskAdded: addTaskToList,
                    );
                  },
                ),
              );
            },
            shape: RoundedRectangleBorder(
                side: const BorderSide(width: 2, color: Color(0XFF123EB1)),
                borderRadius: BorderRadius.circular(100)),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(0.0, 2.0),
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
        backgroundColor: const Color(0XFFF3F3F3),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: const Color(0XFF3556AB),
              width: double.infinity,
              height: 130.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 32.w, top: 19.h),
                    child: CircleAvatar(
                      radius: 25.r,
                      child: Image.asset(
                        AppImages.profilePicture,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 24.h, left: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.helloUser,
                          style: TextStyle(
                              shadows: const <Shadow>[
                                Shadow(
                                  offset: Offset(1.0, 2.0),
                                  color: Colors.black,
                                ),
                              ],
                              fontFamily: 'Roboto',
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 220.w,
                          child: Text(
                            AppStrings.userEmail,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.white,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w100,
                              fontStyle: FontStyle.italic,
                              shadows: const <Shadow>[
                                Shadow(
                                  offset: Offset(0.0, 2.0),
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 130.h,
              decoration: BoxDecoration(
                  color: const Color(0XFFCDE53D),
                  border: Border.all(width: 2, color: const Color(0XFF9EB031))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 25.w, top: 36.h, right: 28.w),
                    child: Image.asset(
                      AppImages.trophyImage,
                       width: 53.w,
                       height: 40.h,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 36.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.goPro,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: const Color(0XFF071D55),
                            fontSize: 20.sp,
                            shadows: const <Shadow>[
                              Shadow(
                                offset: Offset(0.0, 2.0),
                                //blurRadius: 3.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 190.w,
                          height: 46.h,
                          child: Text(
                            AppStrings.noFussNoAds,
                            style: TextStyle(
                              color: const Color(0XFF0D2972),
                              fontSize: 12.sp,
                              shadows: const <Shadow>[
                                Shadow(
                                  offset: Offset(0.0, 1.0),
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15.w),
                    width: 66.w,
                    height: 71.h,
                    color: const Color(0XFF071D55),
                    child:  Center(
                      child: Text(
                        "\$1",
                        style: TextStyle(
                          fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0XFFF2C94C)
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<TaskBloc, TaskState>(
                builder: (context, state){
                  if (state is TaskStateLoaded) {
                    return state.task.isEmpty
                        ? Container()
                        : ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: state.task.length,
                        itemBuilder: (context, index) {
                          return TaskWidget(
                            task: state.task[index],
                            callTaskEditPage: callEditPage,
                            taskIndex: index,
                            isCompleted: state.task[index].isCompleted,
                            onToggleCheckbox: (bool? newValue) {},
                          );

                        }
                    );
                  }
                  return Container();
                },
              )
              ),
          ],
        ),
      ),
    );
  }
}
