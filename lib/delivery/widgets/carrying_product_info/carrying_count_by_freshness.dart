import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kurly_hackerton/sign_up/widgets/freshness_mark.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';
import 'package:kurly_hackerton/util/design/ui_criteria.dart';
import 'package:kurly_hackerton/util/widgets/vertical_bar.dart';

class CarryingCountByFreshness extends StatelessWidget {
  final int aCount;
  final int bCount;
  final int cCount;

  const CarryingCountByFreshness({
    Key? key,
    required this.aCount,
    required this.bCount,
    required this.cCount
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: UICriteria.horizontalPadding16(context),
        bottom: UICriteria.width(context) * 0.0613
      ),
      child: Row(
        children: [
          FreshnessMark(freshness: "A"),
          SizedBox(
            width: UICriteria.width(context) * 0.0053,
          ),
          _countText(aCount),
          VerticalBar(),
          FreshnessMark(freshness: "B"),
          SizedBox(
            width: UICriteria.width(context) * 0.0053,
          ),
          _countText(bCount),
          VerticalBar(),
          FreshnessMark(freshness: "C"),
          SizedBox(
            width: UICriteria.width(context) * 0.0053,
          ),
          _countText(cCount),
        ],
      ),
    );
  }

  Widget _countText(int count) {
    return Text(
      "$count건",
      style: TextStyle(
        color: grey70,
        fontSize: 15.sp,
        fontWeight: FontWeight.w600
      ),
    );
  }
}
