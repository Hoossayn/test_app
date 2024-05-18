import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:getwidget/types/gf_checkbox_type.dart';
import 'package:test_app/core/constants/app_strings.dart';
import '../../bloc/task_bloc.dart';
import '../../bloc/task_event.dart';
import '../../data/model/task_entity.dart';
import 'gf_checkbox.dart';

class TaskWidget extends StatefulWidget {
  final bool isCompleted;
  final ValueChanged<bool?> onToggleCheckbox;

  final Function(Task task, int taskIdex) callTaskEditPage;
  final Task task;
  final int taskIndex;

  const TaskWidget({
    Key? key,
    required this.isCompleted,
    required this.taskIndex,
    required this.task,
    required this.onToggleCheckbox,
    required this.callTaskEditPage,
  }) : super(key: key);

  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.isCompleted;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      padding: EdgeInsets.only(right: 15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 2,
            offset: const Offset(0, 3)
          ),
        ],
      ),
      height: 90.h,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 17.w, right: 15.w),
                child: GFCustomCheckbox(
                  size: GFSize.SMALL,
                  activeBgColor: GFColors.SUCCESS,
                  activeBorderColor: const Color(0xFF399649),
                  inactiveBorderColor: const Color(0xFF071D55),
                  type: GFCheckboxType.circle,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value;
                      widget.onToggleCheckbox(value);
                      BlocProvider.of<TaskBloc>(context)
                          .add(TaskUpdate(id: widget.task.id,  isCompleted: value));

                    });
                  },
                  value: isChecked,
                  inactiveIcon: null,
                ),
              ),
              Expanded(
                child: Text(
                  widget.task.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                      decoration: isChecked
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      color: isChecked
                          ? const Color(0xFF8D8D8D)
                          : const Color(0xFF071D55)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  widget.callTaskEditPage(widget.task, widget.taskIndex);
                },
                child: Container(
                  width: 51.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      border:
                      Border.all(width: 1.0, color: const Color(0xFF071D55))),
                  child: const Center(
                    child: Text(
                      AppStrings.edit,
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF071D55)
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
