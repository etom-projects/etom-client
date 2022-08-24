import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';

class TimeWidget extends StatelessWidget {
  final String title;
  final String time;
  const TimeWidget({
    Key? key,
    required this.title,
    required this.time
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              color: grey80,
              fontWeight: FontWeight.w400,
              fontSize: 17.sp
          ),
        ),
        Text(
          time,
          style: TextStyle(
              color: grey100,
              fontWeight: FontWeight.w700,
              fontSize: 15.sp
          ),
        ),
      ],
    );
  }
}
