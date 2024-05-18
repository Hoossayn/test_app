import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.15),
          offset: const Offset(0, 4.0),
          blurRadius: 4.0,
        )
      ]),
      child: AppBar(
        backgroundColor: const Color(0xFF3556AB),
        bottomOpacity: 0.0,
        elevation: 5.0,
        leading: BackButton(
          onPressed: Navigator.of(context).pop,
          color: Colors.white,
          style: ButtonStyle(
            fixedSize: MaterialStatePropertyAll(
              Size(16.w, 16.h),
            ),
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontSize: 24.sp,
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
        centerTitle: true,
      ),
    );
  }
}
