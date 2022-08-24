import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class LeadingBackButton extends StatelessWidget {
  const LeadingBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      behavior: HitTestBehavior.translucent,
      child: Icon(
        Icons.arrow_back_ios,
        size: 16.sp,
      ),
    );
  }
}
