import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kurly_hackerton/sign_up/widgets/freshness_mark.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';

class CountByFresh extends StatelessWidget {
  final String freshness;
  final int count;

  const CountByFresh({
    Key? key,
    required this.freshness,
    required this.count
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FreshnessMark(freshness: freshness),
        Text(
          "$count건",
          style: TextStyle(
              color: grey70,
              fontSize: 15.sp,
              fontWeight: FontWeight.w600
          ),
        )
      ],
    );
  }
}
