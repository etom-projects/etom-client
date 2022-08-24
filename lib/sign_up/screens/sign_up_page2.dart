import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kurly_hackerton/delivery/screens/my_delivery_page.dart';
import 'package:kurly_hackerton/sign_up/widgets/sign_up_main_title.dart';
import 'package:kurly_hackerton/sign_up/widgets/sign_up_sub_title.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';
import 'package:kurly_hackerton/util/design/ui_criteria.dart';
import 'package:kurly_hackerton/util/widgets/complete_button.dart';

class SignUpPage2 extends StatelessWidget {
  static const String route = "/sign-up2";

  List<String> _addresses = [
    "강남구",
    "송파구",
    "중구",
    "성북구",
    "관악구",
    "강북구",
    "은평구"
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            bottom: UICriteria.width(context) * 0.2133
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SignUpMainTitle(title: "배송 업무가 가능한\n2개 지역을 선택해주세요"),
            SignUpSubTitle(
                title: "이후 배송지 변경이 가능하며\n선택한 지역 물류가 우선 노출됩니다 "
            ),
            ListView.separated(
              itemCount: _addresses.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(
                  top: UICriteria.width(context) * 0.0506,
                  bottom: UICriteria.width(context) * 0.0453,
                  left: UICriteria.width(context) * 0.053,
                  right: UICriteria.width(context) * 0.053,
              ),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: UICriteria.horizontalPadding16(context)
                  ),
                  child: Text(
                    _addresses[index],
                    style: TextStyle(
                      color: trueBlack,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  color: Color(0xffF4F4F4),
                  height: 1,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
