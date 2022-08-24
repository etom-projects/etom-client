import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';
import 'package:kurly_hackerton/util/design/ui_criteria.dart';

class SignUpSubTitle extends StatelessWidget {
  final String title;

  const SignUpSubTitle({
    Key? key,
    required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: UICriteria.width(context) * 0.0533,
        top: UICriteria.horizontalPadding12(context),
      ),
      child: Text(
        title,
        style: TextStyle(
            color: grey70,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            height: 20/14
        ),
      ),
    );
  }
}
