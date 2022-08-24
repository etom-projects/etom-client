import 'package:flutter/material.dart';
import 'package:kurly_hackerton/delivery/screens/carrying_product_detail_page.dart';
import 'package:kurly_hackerton/delivery/services/helper/delivery_helper.dart';
import 'package:kurly_hackerton/delivery/widgets/carrying_product_info/carrying_count_by_freshness.dart';
import 'package:kurly_hackerton/delivery/widgets/carrying_product_info/carrying_product_element.dart';
import 'package:kurly_hackerton/delivery/widgets/carrying_product_info/carrying_product_info_title.dart';
import 'package:kurly_hackerton/delivery/widgets/carrying_product_info/local_info.dart';
import 'package:kurly_hackerton/delivery/widgets/carrying_product_info/total_carrying_info.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';
import 'package:kurly_hackerton/util/design/ui_criteria.dart';
import 'package:kurly_hackerton/util/widgets/complete_button.dart';
import 'package:kurly_hackerton/util/widgets/public_app_bar.dart';
import 'package:kurly_hackerton/utils/widgets/loading_widget.dart';

class CarryingProductInfoPage extends StatefulWidget {
  static const String route = "/carrying/product/info";

  const CarryingProductInfoPage({Key? key}) : super(key: key);

  @override
  _CarryingProductInfoPageState createState() => _CarryingProductInfoPageState();
}

class _CarryingProductInfoPageState extends State<CarryingProductInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: publicAppBar(
          context,
          title: "적재",
          autoLeading: true
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: UICriteria.width(context) * 0.24
            ),
            child: SingleChildScrollView(
              child: SafeArea(
                child: FutureBuilder(
                  future: DeliveryHelper.viewCarryingProduct(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      print(snapshot.data);
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: UICriteria.width(context) * 0.053,
                              top: UICriteria.width(context) * 0.072,
                            ),
                            child: Column(
                              children: [
                                CarryingProductInfoTitle(),
                                TotalCarryingInfo(
                                  totalCount: snapshot.data["totalDeliveryCount"],
                                  house: 21,
                                ),
                                CarryingCountByFreshness(aCount: 1, bCount: 2, cCount: 3)
                              ],
                            ),
                          ),
                          LocalInfo(localName: "강남", totalCount: 5, completeCount: 2, returnCount: 3),
                          Column(
                            children: List.generate(5, (index) {
                              return CarryingProductElement(
                                address: "서울강남구 컬리동 샛별아파트 02동 321호",
                                prefixId: "1020",
                                suffixId: "H030-333",
                                freshnessList: ["A", "B", "C"],
                              );
                            }),
                          ),
                          LocalInfo(localName: "강남", totalCount: 5, completeCount: 2, returnCount: 3),
                          Column(
                            children: List.generate(5, (index) {
                              return CarryingProductElement(
                                address: "서울강남구 컬리동 샛별아파트 02동 321호",
                                prefixId: "1020",
                                suffixId: "H030-333",
                                freshnessList: ["A", "B", "C"],
                              );
                            }),
                          ),
                        ],
                      );
                    }

                    return LoadingWidget();
                  },
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: trueWhite,
              child: Padding(
                padding: EdgeInsets.only(
                    left: UICriteria.horizontalPadding4(context),
                    right: UICriteria.horizontalPadding4(context),
                    bottom: UICriteria.bottomPadding(context)
                ),
                child: CompleteButton(
                  title: "적재완료",
                  onPressed: _tapProduct,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _tapProduct() {
    Navigator.pushNamed(context, CarryingProductDetailPage.route);
  }
}
