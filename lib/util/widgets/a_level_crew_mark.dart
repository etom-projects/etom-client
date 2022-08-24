import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kurly_hackerton/util/design/ui_criteria.dart';

class ALevelCrewMark extends StatelessWidget {
  const ALevelCrewMark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffD6EEFF),
          borderRadius: BorderRadius.circular(2)
      ),
      padding: EdgeInsets.symmetric(
          horizontal: UICriteria.horizontalPadding8(context),
          vertical: UICriteria.horizontalPadding4(context)
      ),
      child: Text(
        "A등급 크루 only",
        style: TextStyle(
          color: Color(0xff0098FF),
          fontWeight: FontWeight.w800,
          fontSize: 12.sp,
        ),
      ),
    );
  }
}
