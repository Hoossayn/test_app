import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/core/constants/app_strings.dart';
import 'package:test_app/data/model/task_entity.dart';
import 'package:test_app/presentation/widgets/custom_app_bar.dart';
import 'package:test_app/presentation/widgets/custom_elevated_button.dart';

import '../../../bloc/task_bloc.dart';
import '../../../bloc/task_event.dart';

class EditTaskScreen extends StatefulWidget {
  final int taskId;
  final Task task;
  final Function(Task task, int taskId) onTaskEdited;

  const EditTaskScreen({super.key,
    required this.taskId,
    required this.task,
    required this.onTaskEdited});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final TextEditingController _taskNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _taskNameController.text = widget.task.name;
  }


  @override
  Widget build(BuildContext context) {

    void handleOnPressed() {

      BlocProvider.of<TaskBloc>(context)
          .add(TaskUpdate(id: widget.task.id, name: _taskNameController.text, isCompleted: widget.task.isCompleted));

      Navigator.pop(context);
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF3F3F3),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.h),
          child: const CustomAppBar(
            title: AppStrings.editTask,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Text(
                    AppStrings.taskName,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    controller: _taskNameController,
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF0D2972)),
                    decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.only(left: 15.w, top: 15.h, bottom: 15.h),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.r),
                        borderSide: const BorderSide(
                          color: Color(0xFFCBCBCB),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.r),
                        borderSide: const BorderSide(
                          width: 2.0,
                          color: Color(0xFFCBCBCB),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.r),
                        borderSide: const BorderSide(
                          color: Color(0xFFCBCBCB),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            CustomElevatedButton(
              onPressed: handleOnPressed,
            )
          ],
        ),
      ),
    );
  }
}
