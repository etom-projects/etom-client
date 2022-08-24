import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kurly_hackerton/delivery/widgets/delivery_detail/delivery_detail_button.dart';
import 'package:kurly_hackerton/delivery/widgets/delivery_detail/delivery_detail_category.dart';
import 'package:kurly_hackerton/delivery/widgets/delivery_detail/delivery_detail_header.dart';
import 'package:kurly_hackerton/delivery/widgets/delivery_detail/delivery_product.dart';
import 'package:kurly_hackerton/sign_up/widgets/freshness_mark.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';
import 'package:kurly_hackerton/util/design/ui_criteria.dart';
import 'package:kurly_hackerton/util/widgets/complete_button.dart';
import 'package:kurly_hackerton/util/widgets/public_app_bar.dart';

class DeliveryDetailPage extends StatefulWidget {
  static const String route = "/delivery_detail/detail";
  const DeliveryDetailPage({Key? key}) : super(key: key);

  @override
  _DeliveryDetailPageState createState() => _DeliveryDetailPageState();
}

class _DeliveryDetailPageState extends State<DeliveryDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: publicAppBar(
        context,
        title: "배송상세",
        autoLeading: true
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: SafeArea(
                    minimum: EdgeInsets.only(
                        bottom: UICriteria.horizontalPadding16(context)
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: UICriteria.width(context) * 0.1813
                      ),
                      child: Column(
                        children: [
                          DeliveryDetailHeader(),
                          DeliveryDetailCategory(title: "배송상품"),
                          Column(
                            children: List.generate(3, (index) {
                              return DeliveryProduct();
                            }),
                          ),
                          Container(
                            height: UICriteria.width(context) * 0.216,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color(0xffd9d9d9),
                                )
                              )
                            ),
                            alignment: Alignment.center,
                            child: DeliveryDetailButton(
                              title: "배송완료 촬영",
                              onTap: () {},
                            ),
                          ),
                          DeliveryDetailCategory(title: "반품상품"),
                          Column(
                            children: List.generate(4, (index) {
                              return DeliveryProduct();
                            }),
                          ),
                          Container(
                            height: UICriteria.width(context) * 0.216,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                      color: Color(0xffd9d9d9),
                                    )
                                )
                            ),
                            alignment: Alignment.center,
                            child: DeliveryDetailButton(
                              title: "수거완료",
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SafeArea(
                    minimum: EdgeInsets.only(
                        bottom: UICriteria.horizontalPadding16(context)
                    ),
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: UICriteria.width(context) * 0.053
                        ),
                        child: CompleteButton(title: "배송완료", onPressed: () {})),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
