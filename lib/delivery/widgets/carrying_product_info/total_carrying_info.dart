import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';
import 'package:kurly_hackerton/util/design/ui_criteria.dart';

class TotalCarryingInfo extends StatelessWidget {
  final int totalCount;
  final int house;
  const TotalCarryingInfo({Key? key, required this.totalCount, required  this.house}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(
      color: grey100,
      fontSize: 26.sp,
      fontWeight: FontWeight.w400,
      height: 28/26,
      fontFamily: "Pretendard"
    );

    return Padding(
      padding: EdgeInsets.only(
        top: UICriteria.width(context) * 0.0586
      ),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              style: style,
              children: [
                TextSpan(
                  text: "상품",
                ),
                TextSpan(
                  text: " $totalCount",
                  style: TextStyle(
                    fontWeight: FontWeight.w700
                  )
                ),
                TextSpan(
                  text: "건 "
                )
              ]
            ),
          ),
          RichText(
            text: TextSpan(
                style: style,
                children: [
                  TextSpan(
                    text: "/",
                  ),
                  TextSpan(
                      text: "$house",
                      style: TextStyle(
                          fontWeight: FontWeight.w700
                      )
                  ),
                  TextSpan(
                      text: "가구"
                  )
                ]
            ),
          ),
        ],
      ),
    );
  }
}
