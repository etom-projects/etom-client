import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kurly_hackerton/delivery/services/helper/delivery_helper.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';
import 'package:kurly_hackerton/util/design/ui_criteria.dart';
import 'package:kurly_hackerton/utils/widgets/loading_widget.dart';

class CarSelectionSheet extends StatefulWidget {
  final int? selectedCarId;

  const CarSelectionSheet({
    Key? key,
    required this.selectedCarId,
  }) : super(key: key);

  @override
  State<CarSelectionSheet> createState() => _CarSelectionSheetState();
}

class _CarSelectionSheetState extends State<CarSelectionSheet> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 375/305,
        child: FutureBuilder(
          future: DeliveryHelper.viewMyCars(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              return Padding(
                padding: EdgeInsets.only(
                    left: UICriteria.width(context) * 0.053,
                    right: UICriteria.width(context) * 0.053,
                    top: UICriteria.horizontalPadding16(context)
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "사용할 차량 선택을 선택해주세요",
                          style: TextStyle(
                              color: grey100,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        Text(
                          "+추가",
                          style: TextStyle(
                              color: grey70,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: UICriteria.horizontalPadding16(context),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: List.generate(snapshot.data.length, (index) {
                            return _carElement(snapshot.data[index]);
                          }),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
            return LoadingWidget();
          },
        )
    );
  }

  Widget _carElement(dynamic data) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: UICriteria.horizontalPadding16(context)
      ),
      child: GestureDetector(
        onTap: () {
          print(data);
          Navigator.pop(context, [data]);
        },
        child: AspectRatio(
          aspectRatio: 335/52,
          child: Container(
            padding: EdgeInsets.only(
              left: UICriteria.width(context) * 0.053,
              right: UICriteria.width(context) * 0.0373
            ),
            decoration: BoxDecoration(
              color: Color(0xffF9F9F9),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: kurlyPurple
              )
            ),
            child: Row(
              children: [
                Text(
                  data["carModel"],
                  style: TextStyle(
                    color: grey100,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp
                  ),
                ),
                SizedBox(
                  width: UICriteria.width(context) * 0.0373,
                ),
                Text(
                    data["licensePlate"],
                    style: TextStyle(
                      color: grey100,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400
                    ),
                ),
                Visibility(
                  visible: widget.selectedCarId == data["userCarId"],
                  child: Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.check_circle,
                        color: kurlyPurple,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
