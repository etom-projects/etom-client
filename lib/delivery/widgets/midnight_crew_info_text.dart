import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';
import 'package:kurly_hackerton/util/design/ui_criteria.dart';

class MidnightCrewInfoText extends StatelessWidget {
  const MidnightCrewInfoText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: UICriteria.horizontalPadding16(context),
        right: UICriteria.horizontalPadding16(context),
        top: UICriteria.width(context) * 0.0613
      ),
      child: AspectRatio(
        aspectRatio: 343/44,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: UICriteria.width(context) * 0.024
          ),
          decoration: BoxDecoration(
            color: kurlyPurple.withOpacity(0.04),
            borderRadius: BorderRadius.circular(4)
          ),
          alignment: Alignment.center,
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                color: kurlyPurple,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                fontFamily: "Pretendard",
                letterSpacing: -0.5
              ),
              children: const [
                TextSpan(
                  text: "신선도 레벨에 맞는 시간대에 배송하면",
                ),
                TextSpan(
                  text: " 새벽 크루팀",
                  style: TextStyle(
                    fontWeight: FontWeight.w800
                  )
                ),
                TextSpan(
                  text: "이 될 수 있어요!"
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}
