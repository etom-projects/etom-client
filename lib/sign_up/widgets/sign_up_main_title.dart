import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';
import 'package:kurly_hackerton/util/design/ui_criteria.dart';

class SignUpMainTitle extends StatelessWidget {
  final String title;

  const SignUpMainTitle({
    Key? key,
    required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: UICriteria.horizontalPadding12(context),
        left: UICriteria.width(context) * 0.0533
      ),
      child: Text(
        title,
        style: TextStyle(
          color: trueBlack,
          fontWeight: FontWeight.w600,
          fontSize: 25.sp,
          height: 32/25
        ),
      ),
    );
  }
}
