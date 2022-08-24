import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';
import 'package:kurly_hackerton/util/design/ui_criteria.dart';

class SignUpTerm extends StatelessWidget {
  final void Function() onTap;
  final bool isSelected;
  final String text;
  final isTotal;

  const SignUpTerm({
    Key? key,
    required this.onTap,
    required this.isSelected,
    this.isTotal = false,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: UICriteria.horizontalPadding12(context)
      ),
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.translucent,
        child: Row(
          children: [
            Container(
              width: UICriteria.width(context) * 0.053,
              height: UICriteria.width(context) * 0.053,
              decoration: BoxDecoration(
                  color: isSelected ? kurlyPurple : grey20,
                  borderRadius: BorderRadius.circular(4)
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.check_rounded,
                color: trueWhite,
                size: 20.sp,
              ),
            ),
            SizedBox(
              width: UICriteria.width(context) * 0.016,
            ),
            Text(
              text,
              style: TextStyle(
                color: trueBlack,
                fontWeight: isTotal ? FontWeight.w700 : FontWeight.w400,
                fontSize: 16.sp
              ),
            )
          ],
        ),
      ),
    );
  }
}
