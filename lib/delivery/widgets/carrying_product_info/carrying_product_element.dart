import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kurly_hackerton/sign_up/widgets/freshness_mark.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';
import 'package:kurly_hackerton/util/design/ui_criteria.dart';

class CarryingProductElement extends StatelessWidget {
  final String address;
  final String prefixId;
  final String suffixId;
  final List freshnessList;

  const CarryingProductElement({
    Key? key,
    required this.address,
    required this.prefixId,
    required this.suffixId,
    required this.freshnessList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: UICriteria.horizontalPadding16(context),
        right: UICriteria.width(context) * 0.0613
      ),
      padding: EdgeInsets.symmetric(
        vertical: UICriteria.horizontalPadding8(context)
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: grey10
          )
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: grey90,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Pretendard"
                  ),
                  children: [
                    TextSpan(
                      text: prefixId,
                    ),
                    TextSpan(
                      text: " $suffixId",
                      style: TextStyle(
                        fontWeight: FontWeight.w500
                      )
                    )
                  ]
                ),
              ),
              SizedBox(
                width: UICriteria.horizontalPadding4(context),
              ),
              Row(
                children: List.generate(
                    freshnessList.length, (int index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          right: UICriteria.horizontalPadding4(context)
                        ),
                        child: FreshnessMark(
                          freshness: "A",
                          size: UICriteria.width(context) * 0.0533,
                        ),
                      );
                }),
              )
            ],
          ),
          SizedBox(
            height: UICriteria.width(context) * 0.0053,
          ),
          Text(
            address,
            style: TextStyle(
              color: grey90,
              fontWeight: FontWeight.w500,
              fontSize: 15.sp,
            ),
          )
        ],
      ),
    );
  }
}
