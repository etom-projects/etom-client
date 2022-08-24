import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kurly_hackerton/sign_up/widgets/freshness_mark.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';
import 'package:kurly_hackerton/util/design/ui_criteria.dart';

class DeliveryElement extends StatelessWidget {
  final String address;
  final String time;
  final int totalCount;
  final int freshnessACount;
  final int freshnessBCount;
  final int freshnessCCount;
  final int freshnessAPrice;
  final int freshnessBPrice;
  final int freshnessCPrice;
  final void Function() onTap;
  const DeliveryElement({
    Key? key,
    required this.address,
    required this.time,
    required this.totalCount,
    required this.freshnessACount,
    required this.freshnessBCount,
    required this.freshnessCCount,
    required this.freshnessAPrice,
    required this.freshnessBPrice,
    required this.freshnessCPrice,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(
          left: UICriteria.width(context) * 0.056,
          right:  UICriteria.width(context) * 0.0746,
        ),
        child: Container(
          padding: EdgeInsets.only(
            left: UICriteria.width(context) * 0.053,
            right: UICriteria.horizontalPadding16(context),
            top: UICriteria.horizontalPadding12(context),
            bottom: UICriteria.horizontalPadding16(context)
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border: Border.all(
                  color: const Color(0xffD9D9D9),
                  width: 1
              )
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address,
                    style: TextStyle(
                      color: grey70,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(
                    height: UICriteria.width(context) * 0.016,
                  ),
                  Text(
                    time,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18.sp,
                      color: grey90,
                    ),
                  ),
                  SizedBox(
                    height: UICriteria.horizontalPadding12(context),
                  ),
                  _infoByFreshness(context, freshness: "A", count: freshnessACount, price: freshnessAPrice),
                  SizedBox(
                    height: UICriteria.horizontalPadding8(context),
                  ),
                  _infoByFreshness(context, freshness: "B", count: freshnessBCount, price: freshnessBPrice),
                  SizedBox(
                    height: UICriteria.horizontalPadding8(context),
                  ),
                  _infoByFreshness(context, freshness: "C", count: freshnessCCount, price: freshnessCPrice),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: UICriteria.width(context) *0.0133
                  ),
                  child: Text(
                    "$totalCount건",
                    style: TextStyle(
                      color: grey100,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoByFreshness(
      BuildContext context,
  {
    required String freshness,
    required int count,
    required int price
  }) {
    return Row(
      children: [
        FreshnessMark(
          freshness: freshness,
        ),
        SizedBox(
          width: UICriteria.horizontalPadding4(context),
        ),
        RichText(
          text: TextSpan(
              style:TextStyle(
                  color: grey80,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Pretendard"
              ),
              children: [
                TextSpan(
                  text: "$count건",
                ),
                TextSpan(
                    text: "  건당 $price원",
                    style: const TextStyle(
                        color: grey60,
                        fontWeight: FontWeight.w500
                    )
                )
              ]
          ),
        )
      ],
    );
  }
}
