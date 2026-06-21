import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonEdit extends StatelessWidget {
   ButtonEdit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding:  EdgeInsets.symmetric(vertical: 8.w),
        minimumSize:  Size(double.infinity, 30),
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child:  Text(
        "Edit Profile",
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}