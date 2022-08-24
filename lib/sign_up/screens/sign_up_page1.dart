import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kurly_hackerton/sign_up/widgets/freshness_mark.dart';
import 'package:kurly_hackerton/sign_up/widgets/freshness_seleection_button.dart';
import 'package:kurly_hackerton/sign_up/widgets/sign_up_main_title.dart';
import 'package:kurly_hackerton/sign_up/widgets/sign_up_sub_title.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';
import 'package:kurly_hackerton/util/design/ui_criteria.dart';

class SignUpPage1 extends StatefulWidget {
  final void Function(int index) selectJobType;
  final int? selectedId;

  const SignUpPage1({
    Key? key,
    required this.selectJobType,
    required this.selectedId
  }) : super(key: key);

  @override
  State<SignUpPage1> createState() => _SignUpPage1State();
}

class _SignUpPage1State extends State<SignUpPage1> {

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
            const SignUpMainTitle(
                title: "주 업무시간대를\n선택해주세요"
            ),
            SignUpSubTitle(
                title: "주 업무시간대에 해당하는 배송 건들을 볼 수 있습니다.\n이후 다른 시간대 선택도 가능합니다."
            ),
            Padding(
              padding: EdgeInsets.only(
                left: UICriteria.horizontalPadding32(context),
                top: UICriteria.width(context) * 0.1226
              ),
              child: Row(
                children: [
                  Text(
                    "신선도 등급",
                    style: TextStyle(
                      color:grey100,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      height: 19/15,
                      letterSpacing: -0.05
                    ),
                  ),
                  SizedBox(
                    width: UICriteria.width(context) * 0.0266,
                  ),
                  const FreshnessMark(
                    freshness: "A",
                  ),
                  const FreshnessMark(
                    freshness: "B",
                  ),
                  const FreshnessMark(
                    freshness: "C",
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: UICriteria.horizontalPadding32(context),
                top: UICriteria.width(context) * 0.0053
              ),
              child: Text(
                "샛별배송은 신선도 등급에 따라 배송 시간대가 분류됩니다.",
                style: TextStyle(
                  color: grey80,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  height: 20/12,
                  letterSpacing: -0.04
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: UICriteria.width(context) * 0.0586,
                left: UICriteria.horizontalPadding16(context),
                right: UICriteria.horizontalPadding16(context),
              ),
              child: Column(
                children: [
                  FreshnessSelectionButton(
                      onTap: () => widget.selectJobType(1),
                      isSelected: widget.selectedId == 1,
                      id: 1
                  ),
                  SizedBox(
                    height: UICriteria.horizontalPadding12(context),
                  ),
                  FreshnessSelectionButton(
                      onTap: () =>  widget.selectJobType(2),
                      isSelected: widget.selectedId == 2,
                      id: 2
                  ),
                  SizedBox(
                    height: UICriteria.horizontalPadding12(context),
                  ),
                  FreshnessSelectionButton(
                      onTap: () => widget.selectJobType(3),
                      isSelected: widget.selectedId == 3,
                      id: 3
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
