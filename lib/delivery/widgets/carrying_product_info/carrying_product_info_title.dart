import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';
import 'package:kurly_hackerton/util/design/ui_criteria.dart';

class CarryingProductInfoTitle extends StatelessWidget {
  const CarryingProductInfoTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "적재",
          style: TextStyle(
            color: grey100,
            fontSize: 17.sp,
            fontWeight: FontWeight.w600
          ),
        ),
        SizedBox(
          width: UICriteria.horizontalPadding8(context),
        ),
        Text(
          "배송물을 1번부터 가장 안쪽으로 실어주세요",
          style: TextStyle(
            color: kurlyPurple,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp
          ),
        )
      ],
    );
  }
}
