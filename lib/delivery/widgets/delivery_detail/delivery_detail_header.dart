import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kurly_hackerton/sign_up/widgets/freshness_mark.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';
import 'package:kurly_hackerton/util/design/ui_criteria.dart';

class DeliveryDetailHeader extends StatelessWidget {
  const DeliveryDetailHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 375/180,
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Color(0xffd9d9d9)
                )
            )
        ),
        padding: EdgeInsets.only(
            left: UICriteria.width(context) * 0.053,
            right: UICriteria.width(context) * 0.0453
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(
              flex: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "김컬리",
                  style: TextStyle(
                      color: grey100,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: UICriteria.width(context) * 0.0266,
                      vertical: UICriteria.width(context) * 0.0053
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: kurlyPurple,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "문앞",
                    style: TextStyle(
                        color: kurlyPurple,
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp
                    ),
                  ),
                )
              ],
            ),
            Spacer(
              flex: 7,
            ),
            Text(
              "서울 송파구 송파대로 송파레미안 C 동 3201호",
              style: TextStyle(
                  color: grey100,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.4
              ),
            ),
            Spacer(
              flex: 12,
            ),
            Text(
              "현관 비밀번호 12341",
              style: TextStyle(
                color: grey100,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            Spacer(
              flex: 14,
            ),
            Text(
              "010-3213-3510",
              style: TextStyle(
                  color: grey100,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.4
              ),
            ),
            Spacer(
              flex: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "배송2",
                  style: TextStyle(
                      color: grey100,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp
                  ),
                ),
                SizedBox(
                  width: UICriteria.horizontalPadding4(context),
                ),
                Row(
                  children: List.generate(2, (index) {
                    return Padding(
                        padding: EdgeInsets.only(
                            left: UICriteria.width(context) * 0.008
                        ),
                        child: FreshnessMark(freshness: "B"));
                  }),
                ),
                SizedBox(
                  width: UICriteria.width(context) * 0.0453,
                ),
                Text(
                  "반품1",
                  style: TextStyle(
                      color: grey100,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp
                  ),
                ),
                SizedBox(
                  width: UICriteria.horizontalPadding4(context),
                ),
                Row(
                  children: List.generate(1, (index) {
                    return Padding(
                        padding: EdgeInsets.only(
                            left: UICriteria.width(context) * 0.008
                        ),
                        child: FreshnessMark(freshness: "C"));
                  }),
                ),
              ],
            ),
            Spacer(
              flex: 14,
            ),
          ],
        ),
      ),
    );
  }
}
