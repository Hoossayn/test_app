import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/core/constants/app_strings.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 40.h),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          side: const BorderSide(width: 2.0, color: Color(0xFF0D2972)),
          backgroundColor: const Color(0xFF3556AB),
          fixedSize: Size(370.w, 60.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.r),
          ),
        ),
        child: Text(
          AppStrings.done,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontFamily: 'Roboto',
            shadows: const <Shadow>[
              Shadow(
                offset: Offset(0.0, 2.0),
                //blurRadius: 3.0,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
