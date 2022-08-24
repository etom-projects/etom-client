import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kurly_hackerton/delivery/screens/delivery_assign_result_page.dart';
import 'package:kurly_hackerton/delivery/services/helper/delivery_helper.dart';
import 'package:kurly_hackerton/delivery/widgets/count_by_fresh.dart';
import 'package:kurly_hackerton/delivery/widgets/grey_bar.dart';
import 'package:kurly_hackerton/delivery/widgets/time_widget.dart';
import 'package:kurly_hackerton/sign_up/widgets/freshness_mark.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';
import 'package:kurly_hackerton/util/design/ui_criteria.dart';
import 'package:kurly_hackerton/util/widgets/complete_button.dart';
import 'package:kurly_hackerton/util/widgets/public_app_bar.dart';

class DeliveryAssignPage extends StatefulWidget {
  static const String route = "/delivery_detail/assign";

  const DeliveryAssignPage({Key? key}) : super(key: key);

  @override
  _DeliveryAssignPageState createState() => _DeliveryAssignPageState();
}

class _DeliveryAssignPageState extends State<DeliveryAssignPage> {
  late List<dynamic> _deliveryIds;

  @override
  Widget build(BuildContext context) {
    _setDeliveryIds();

    return Scaffold(
      appBar: publicAppBar(
          context,
          title: "송파동",
          autoLeading: true
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: SafeArea(
              minimum: EdgeInsets.only(
                bottom: UICriteria.horizontalPadding16(context)
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: UICriteria.width(context) * 0.053,
                        right: UICriteria.width(context) * 0.053,
                        top: UICriteria.width(context) * 0.096,
                        bottom: UICriteria.width(context) * 0.04
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "강남구",
                          style: TextStyle(
                              color: grey50,
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp
                          ),
                        ),
                        SizedBox(
                          height: UICriteria.horizontalPadding8(context),
                        ),
                        Text(
                          "08.15(수) 오전 05시-07시",
                          style: TextStyle(
                              color: grey90,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        SizedBox(
                          height: UICriteria.width(context) * 0.024,
                        ),
                        Row(
                          children: [
                            Text(
                              "일반배송 80건",
                              style: TextStyle(
                                color: grey60,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                              ),
                            ),
                            Text(
                              " 반품 2건",
                              style: TextStyle(
                                color: deleteRed,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: UICriteria.width(context) * 0.0373,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                const CountByFresh(freshness: "A", count: 1),
                                SizedBox(
                                  width: UICriteria.width(context) * 0.0373,
                                ),
                                const CountByFresh(freshness: "B", count: 2),

                                SizedBox(
                                  width: UICriteria.width(context) * 0.0373,
                                ),
                                const CountByFresh(freshness: "C", count: 3),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: UICriteria.width(context) * 0.0746,
                        ),
                        TimeWidget(title: "예상 걸리는시간", time: "2시간 30분"),
                        SizedBox(
                          height: UICriteria.width(context) * 0.0186,
                        ),
                        TimeWidget(title: "예상 배송 종료시간", time: "오전 2시 30분"),
                      ],
                    ),
                  ),
                  const GreyBar(),
                  Padding(
                    padding: EdgeInsets.only(
                      top: UICriteria.width(context) * 0.053,
                      left: UICriteria.width(context) * 0.053,
                      right: UICriteria.width(context) * 0.053,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            FreshnessMark(
                              freshness: "A",
                              size: UICriteria.width(context) * 0.053,
                            ),
                            SizedBox(
                              width: UICriteria.horizontalPadding4(context),
                            ),
                            Text(
                              "64건",
                              style: TextStyle(
                                  color: grey100,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20.sp
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: UICriteria.width(context) * 0.04,
                        ),
                        Text(
                          "A등급 상품 배송물이 많은 건은\n신중히 선택해주세요",
                          style: TextStyle(
                              color: grey100,
                              fontSize: 19.sp,
                              fontWeight: FontWeight.w500,
                              height: 27/19
                          ),
                        ),
                        SizedBox(
                          height: UICriteria.width(context) * 0.0506,
                        ),
                        Text(
                          "아이스크림, 육류, 해산물, 유제품",
                          style: TextStyle(
                            color: grey70,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: UICriteria.width(context) * 0.0186,
                        ),
                        Text(
                          "해당 배송은 신선도가 가장 중요한 상품이에요.\n오전 5시-7시사이에 배송이 완료되어야 합니다.\n추가 배송시간이 적정시간에 도착하지 않을 경우, 내 신뢰점수가 낮아지니 신중히 선택해주세요 ",
                          style: TextStyle(
                              color: grey80,
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                              height: 24/15
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: UICriteria.width(context) * 0.053,
                            ),
                            child: CompleteButton(title: "할당받기", onPressed: _assign)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _assign() async {
    int statusCode = await DeliveryHelper.assignDeliveryIds(jsonEncode(_deliveryIds));

    if (statusCode == 200) {
      Navigator.pushNamed(context, DeliveryAssignResultPage.route, arguments: {
        "deliveryIds" : _deliveryIds
      });
    }
  }

  _setDeliveryIds() {
    Map<String, dynamic> map = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    _deliveryIds = map["deliveryIds"];
  }
}
