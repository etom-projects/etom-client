import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';
import 'package:kurly_hackerton/util/design/ui_criteria.dart';

class SignUpTab extends StatelessWidget {
  final bool isSelected;
  final int sequence;

  const SignUpTab({
    Key? key,
    required this.isSelected,
    required this.sequence
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: UICriteria.horizontalPadding24(context),
      height: UICriteria.horizontalPadding24(context),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? kurlyPurple : grey30
      ),
      alignment: Alignment.center,
      child: Text(
        sequence.toString(),
        style: TextStyle(
          color: trueWhite,
          fontWeight: FontWeight.w800,
          fontSize: 16.sp
        ),
      ),
    );
  }
}
