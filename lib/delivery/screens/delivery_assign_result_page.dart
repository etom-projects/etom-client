import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kurly_hackerton/delivery/screens/carrying_product_info_page.dart';
import 'package:kurly_hackerton/delivery/screens/register_car_info_page.dart';
import 'package:kurly_hackerton/delivery/services/helper/delivery_helper.dart';
import 'package:kurly_hackerton/delivery/widgets/count_by_fresh.dart';
import 'package:kurly_hackerton/delivery/widgets/delivery_assign/car_selection_sheet.dart';
import 'package:kurly_hackerton/delivery/widgets/grey_bar.dart';
import 'package:kurly_hackerton/delivery/widgets/time_widget.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';
import 'package:kurly_hackerton/util/design/ui_criteria.dart';
import 'package:kurly_hackerton/util/widgets/complete_button.dart';
import 'package:kurly_hackerton/util/widgets/public_app_bar.dart';
import 'package:kurly_hackerton/utils/token.dart';

class DeliveryAssignResultPage extends StatefulWidget {
  static const String route = "/assign/result";

  const DeliveryAssignResultPage({Key? key}) : super(key: key);

  @override
  _DeliveryAssignResultPageState createState() => _DeliveryAssignResultPageState();
}

class _DeliveryAssignResultPageState extends State<DeliveryAssignResultPage> {
  dynamic _selectedCar;
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
      body: SafeArea(
        minimum: EdgeInsets.only(
          bottom: UICriteria.horizontalPadding16(context)
        ),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: UICriteria.width(context) * 0.0506,
                                top: UICriteria.horizontalPadding24(context)
                              ),
                              child: Text(
                                "오전 4시 30분까지\n배송물을 가져가세요 ",
                                style: TextStyle(
                                    color: grey100,
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w700,
                                    height: 31/24,
                                    letterSpacing: -0.5
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: UICriteria.width(context) * 0.053,
                                left: UICriteria.width(context) * 0.0586,
                                bottom: UICriteria.horizontalPadding24(context)
                              ),
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: UICriteria.width(context) * 0.4053,
                                  height: UICriteria.width(context) * 0.128,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          color: kurlyPurple,
                                          width: 1
                                      )
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.camera_alt_rounded, color: kurlyPurple,),
                                      SizedBox(
                                        width: UICriteria.horizontalPadding4(context),
                                      ),
                                      Text(
                                        "물류 QR촬영",
                                        style: TextStyle(
                                          color: kurlyPurple,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        GreyBar(),
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
                        GreyBar(),
                        Padding(
                          padding: EdgeInsets.only(
                            top: UICriteria.width(context) * 0.053,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: _tapRegisterCar,
                                  child: Container(
                                    width: UICriteria.width(context) * 0.84,
                                    height: UICriteria.width(context) * 0.1386,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: _selectedCar == null ? kurlyPurple : grey20,
                                        width: 1
                                      ),
                                      color: _selectedCar == null ? null : Color(0xfff9f9f9),
                                      borderRadius: BorderRadius.circular(4)
                                    ),
                                    alignment: Alignment.center,
                                    child: _selectedCar == null
                                    ? Text(
                                      "차량 등록",
                                      style: TextStyle(
                                        color: kurlyPurple,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16.sp
                                      ),
                                    )
                                    : Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.check_circle,
                                          color: Color(0xff0CC65F),
                                        ),
                                        SizedBox(
                                          width: UICriteria.width(context) * 0.016,
                                        ),
                                        Text(
                                          "차량 등록완료  ${_selectedCar["licensePlate"]}",
                                          style: TextStyle(
                                            color: grey100,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w700
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: UICriteria.width(context) * 0.08,
                                  top: UICriteria.width(context) * 0.0186
                                ),
                                child: Text(
                                  "배송을 시작하려면 차량을 등록해야합니다",
                                  style: TextStyle(
                                    color: grey70,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: UICriteria.width(context) * 0.053,
                      ),
                      child: CompleteButton(
                          title: "배송시작",
                          onPressed: _startDelivery,
                          enabled: _selectedCar != null,
                          )
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  _setDeliveryIds() {
    Map<String, dynamic> map = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    _deliveryIds = map["deliveryIds"];
  }

  _tapRegisterCar() {
    print(userToken);
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
      ),
      builder: (BuildContext context) {
        return CarSelectionSheet(selectedCarId: _selectedCar == null ? null : _selectedCar["userCarId"]);
      },
    ).then((value) {
      print(value);
      _selectedCar = value[0];
      setState(() {

      });
    });
  }

  _startDelivery() async {
    int statusCode1 = await DeliveryHelper.selectCar(_selectedCar["userCarId"], jsonEncode(_deliveryIds));
    print(statusCode1);
    if (statusCode1 == 200) {
      int statusCode2 = await DeliveryHelper.startDelivery(
          carModel: _selectedCar["carModel"],
          carLicensePlate: _selectedCar["licensePlate"],
          carLicensePlateColor: _selectedCar["licensePlateColor"]);

      if (statusCode2 == 200) {
        Navigator.pushNamed(context, CarryingProductInfoPage.route);
      }
    }
  }
}
