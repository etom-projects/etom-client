import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';
import 'package:kurly_hackerton/util/design/ui_criteria.dart';
import 'package:kurly_hackerton/util/widgets/vertical_bar.dart';

class LocalInfo extends StatelessWidget {
  final String localName;
  final int totalCount;
  final int completeCount;
  final int returnCount;

  LocalInfo({
    Key? key,
    required this.localName,
    required this.totalCount,
    required this.completeCount,
    required this.returnCount}) : super(key: key);

  TextStyle style1 = TextStyle(
      color: grey100,
      fontSize: 15.sp,
      fontWeight: FontWeight.w500
  );

  TextStyle style2 = TextStyle(
      color: grey100,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500
  );

  @override
  Widget build(BuildContext context) {


    return AspectRatio(
      aspectRatio: 375/36,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffF5F5F5),
          border: Border(
            bottom: BorderSide(
              color: Color(0xffd9d9d9)
            )
          )
        ),
        padding: EdgeInsets.symmetric(
          horizontal: UICriteria.horizontalPadding16(context)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              localName,
              style: style1,
            ),
            Row(
              children: [
                Text(
                  "$totalCount건 ",
                  style: style2,
                ),
                VerticalBar(
                  size: 14.sp,
                  padding: 0,
                  color: grey100,
                ),
                Text(
                  " 배송$completeCount 반품$returnCount",
                  style: style2,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
