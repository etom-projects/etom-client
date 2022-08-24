import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kurly_hackerton/delivery/widgets/register_car/delivery_method_button.dart';
import 'package:kurly_hackerton/delivery/widgets/register_car/register_car_textfield.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';
import 'package:kurly_hackerton/util/design/ui_criteria.dart';
import 'package:kurly_hackerton/util/widgets/complete_button.dart';
import 'package:kurly_hackerton/util/widgets/public_app_bar.dart';

class RegisterCarInfoPage extends StatefulWidget {
  static const String route = "/register/car/info";
  
  const RegisterCarInfoPage({Key? key}) : super(key: key);

  @override
  _RegisterCarInfoPageState createState() => _RegisterCarInfoPageState();
}

class _RegisterCarInfoPageState extends State<RegisterCarInfoPage> {
  int _selectedIndex = 0;
  final TextEditingController _carNumberController = TextEditingController();
  final TextEditingController _carColorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: publicAppBar(
          context,
          title: "차량 정보등록",
          autoLeading: true
      ),
      body: SafeArea(
        minimum: EdgeInsets.only(
          bottom: UICriteria.horizontalPadding16(context)
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: UICriteria.width(context) * 0.053,
            right: UICriteria.width(context) * 0.053,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: UICriteria.width(context) * 0.16
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DeliveryMethodButton(
                      isSelected: _selectedIndex == 0,
                      onTap: () => _selectDeliveryMethod(0),
                      id: 0,
                    ),
                    DeliveryMethodButton(
                      isSelected: _selectedIndex == 1,
                      onTap: () => _selectDeliveryMethod(1),
                      id: 1,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: UICriteria.width(context) * 0.1013,
              ),
              RegisterCarTextField(
                  controller: _carNumberController,
                  hint: "차량번호 (예시 :11가 4321)",
              ),
              SizedBox(
                height: UICriteria.horizontalPadding16(context),
              ),
              RegisterCarTextField(
                controller: _carColorController,
                hint: "차량 번호판 색상",
              ),
              SizedBox(
                height: UICriteria.horizontalPadding8(context),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: UICriteria.width(context) * 0.8533,
                  child: Text(
                    "사용할 차량이 화물차인경우 영업용 번호판이 부착되어야 배송가능하며 흰색 번호판인 경우 배송을 신청할 수 없습니다 ",
                    style: TextStyle(
                      color: grey70,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      height: 18/12
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CompleteButton(
                        title: "완료",
                        onPressed: () {})
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _selectDeliveryMethod(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
