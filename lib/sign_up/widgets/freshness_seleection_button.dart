import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kurly_hackerton/sign_up/widgets/freshness_mark.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';
import 'package:kurly_hackerton/util/design/ui_criteria.dart';
import 'package:kurly_hackerton/util/widgets/a_level_crew_mark.dart';

class FreshnessSelectionButton extends StatelessWidget {
  final void Function() onTap;
  final bool isSelected;
  final int id;
  const FreshnessSelectionButton({
    Key? key,
    required this.onTap,
    required this.isSelected,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(
          left: UICriteria.horizontalPadding16(context),
          top: UICriteria.horizontalPadding16(context),
          bottom: UICriteria.width(context) * 0.0746
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? kurlyPurple : grey20,
            width: 1
          )
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: isSelected ? kurlyPurple : grey20,
                  borderRadius: BorderRadius.circular(4)
              ),
              child: Icon(
                Icons.check_rounded,
                color: trueWhite,
              ),
            ),
            SizedBox(
              width: UICriteria.horizontalPadding16(context),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      _getTitle(id),
                      style: TextStyle(
                          color: grey90,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    Visibility(
                      visible: id == 3,
                      child: ALevelCrewMark(),
                    )
                  ],
                ),
                SizedBox(
                  height: UICriteria.width(context) * 0.053,
                ),
                Row(
                  children: [
                    _getFreshness(id),
                    SizedBox(
                      width: UICriteria.horizontalPadding4(context),
                    ),
                    Text(
                      _getFreshnessInfo(id),
                      style: TextStyle(
                          color: grey70,
                          fontWeight: FontWeight.w400,
                          fontSize: 13.sp
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: UICriteria.horizontalPadding8(context),
                ),
                Text(
                  _getContent(id),
                  style: TextStyle(
                      color: grey80,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.5,
                      height: 17/13
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  String _getTitle(int id) {
    if (id == 1) {
      return "오전 12시-03시";
    }

    if (id == 2) {
      return "오전 02시-07시";
    }

    return "오전 04시-07시 ";
  }

  Widget _getFreshness(int id) {
    if (id == 1) {
      return const FreshnessMark(
        freshness: "A",
      );
    }

    if (id == 2) {
      return const FreshnessMark(
        freshness: "B",
      );
    }

    return const FreshnessMark(
      freshness: "C",
    );
  }

  String _getFreshnessInfo(int id) {
    if (id == 1) {
      return "통조림, 시리얼 등 가공식품";
    }

    if (id == 2) {
      return "샐러드, 간편식 , 베이커리";
    }

    return "아이스크림, 육류, 해산물, 유제품";
  }

  String _getContent(int id) {
    if (id == 1) {
      return "상온에서 시간이 지나도 상하지 않는 안전한 상품이에요.\n일반 택배배송 차량도 배송이 가능해요.";
    }

    if (id == 2) {
      return "빠른시간 내에 배송 받지 않아도 되는\n신선 중요도가 낮은 상품이에요.";
    }

    return "오전 5-7시경에  배송해야 하는 신선도가 가장 중요한\n상품이에요. 다른 배송보다 비용이 높고 A등급 뱃지를\n받은 크루만 배송할 수 있어요.";
  }
}
