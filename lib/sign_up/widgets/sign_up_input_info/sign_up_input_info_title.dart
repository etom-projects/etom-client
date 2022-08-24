import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';
import 'package:kurly_hackerton/util/design/ui_criteria.dart';

class SignUpInputInfoTitle extends StatelessWidget {
  final String title;

  const SignUpInputInfoTitle({
    Key? key,
    required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: UICriteria.width(context) * 0.02
        ),
        child: Text(
          title,
          style: TextStyle(
            color: grey100,
            fontWeight: FontWeight.w400,
            fontSize: 15.sp
          ),
        ),
      ),
    );
  }
}
