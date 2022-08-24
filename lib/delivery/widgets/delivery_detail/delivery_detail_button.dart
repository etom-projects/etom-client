import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';
import 'package:kurly_hackerton/util/design/ui_criteria.dart';

class DeliveryDetailButton extends StatelessWidget {
  final String title;
  final void Function() onTap;

  const DeliveryDetailButton({
    Key? key,
    required this.title,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: UICriteria.width(context) * 0.456,
        height: UICriteria.width(context) * 0.1386,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: kurlyPurple
          )
        ),
        child: Text(
          title,
          style: TextStyle(
            color: kurlyPurple,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700
          ),
        ),
      ),
    );
  }
}
