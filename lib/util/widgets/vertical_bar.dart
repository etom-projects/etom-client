import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';
import 'package:kurly_hackerton/util/design/ui_criteria.dart';

class VerticalBar extends StatelessWidget {
  final double? size;
  final double? padding;
  final Color? color;

  const VerticalBar({
    Key? key,
    this.size,
    this.padding,
    this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: padding ?? UICriteria.horizontalPadding8(context)
      ),
      child: Text(
        "|",
        style: TextStyle(
            color: color ?? grey30,
            fontWeight: FontWeight.w500,
            fontSize: size ?? 18.sp
        ),
      ),
    );
  }
}
