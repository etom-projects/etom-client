import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';
import 'package:kurly_hackerton/util/design/ui_criteria.dart';

class FreshnessMark extends StatelessWidget {
  final String freshness;
  final double? size;
  final double? fontSize;

  const FreshnessMark({
    Key? key,
    required this.freshness,
    this.size,
    this.fontSize
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? UICriteria.horizontalPadding16(context),
      height: size ?? UICriteria.horizontalPadding16(context),
      margin: EdgeInsets.only(
        right: UICriteria.width(context) * 0.003
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _getColor(freshness)
      ),
      alignment: Alignment.center,
      child: Text(
        freshness,
        style: TextStyle(
          color: trueWhite,
          fontSize: fontSize ?? 11.sp,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }

  Color _getColor(String freshness) {
    if (freshness == 'A') {
      return const Color(0xff03B05D);
    }

    if (freshness == "B") {
      return kurlyPurple;
    }

    return const Color(0xff636363);
  }
}
