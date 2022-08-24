import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kurly_hackerton/delivery/screens/delivery_assign_page.dart';
import 'package:kurly_hackerton/delivery/services/helper/delivery_helper.dart';
import 'package:kurly_hackerton/delivery/widgets/delivery_element.dart';
import 'package:kurly_hackerton/delivery/widgets/midnight_crew_info_text.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';
import 'package:kurly_hackerton/util/design/ui_criteria.dart';
import 'package:kurly_hackerton/util/widgets/public_app_bar.dart';
import 'package:kurly_hackerton/utils/get_week_day.dart';
import 'package:kurly_hackerton/utils/widgets/loading_widget.dart';

class MyDeliveryPage extends StatefulWidget {
  static const String route = "/my/delivery_detail";

  const MyDeliveryPage({Key? key}) : super(key: key);

  @override
  _MyDeliveryPageState createState() => _MyDeliveryPageState();
}

class _MyDeliveryPageState extends State<MyDeliveryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: publicAppBar(
          context,
          title: "컬리워크",
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: EdgeInsets.only(
            bottom: UICriteria.horizontalPadding16(context)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: UICriteria.width(context) * 0.0693,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: UICriteria.width(context) * 0.0506
                ),
                child: Text(
                  "내 배송지역",
                  style: TextStyle(
                    color: grey100,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: UICriteria.width(context) * 0.0506
                ),
                child: Text(
                  "강남구, 송파구",
                  style: TextStyle(
                    color: trueBlack,
                    fontSize: 29.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(
                height: UICriteria.width(context) * 0.0053,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: UICriteria.horizontalPadding24(context)
                ),
                child: Text(
                  "배달지역 변경 >",
                  style: TextStyle(
                    color: grey70,
                    fontWeight: FontWeight.w400,
                    fontSize: 13.sp,
                    decoration: TextDecoration.underline,
                    height: 28/13
                  ),
                ),
              ),
              const MidnightCrewInfoText(),
              SizedBox(
                height: UICriteria.horizontalPadding12(context),
              ),
              FutureBuilder(
                future: DeliveryHelper.viewDeliveryTimes(0),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot.data);
                    dynamic data;
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        data = snapshot.data[index];
                        return DeliveryElement(
                            address: "송파동01 강남02",
                            time: _getTimeText(index),
                            totalCount: data["totalDeliveryCount"],
                            freshnessACount: data["deliveryRanks"][0]["deliveryCount"],
                            freshnessBCount: data["deliveryRanks"][1]["deliveryCount"],
                            freshnessCCount: data["deliveryRanks"][2]["deliveryCount"],
                            freshnessAPrice: int.parse(data["deliveryRanks"][0]["pay"]),
                            freshnessBPrice: int.parse(data["deliveryRanks"][1]["pay"]),
                            freshnessCPrice: int.parse(data["deliveryRanks"][2]["pay"]),
                            onTap: () => _navigateDetail(data["deliveryIds"]));
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: UICriteria.horizontalPadding12(context),
                        );
                      },
                    );
                  }
                  return LoadingWidget();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  _navigateDetail(List<dynamic> deliveryIds) {
    Navigator.pushNamed(context, DeliveryAssignPage.route, arguments: {
      "deliveryIds" : deliveryIds
    });

  }

  _getTimeText(int id) {
    DateTime current = DateTime.now();
    if (current.hour >= 7) {
      current = current.add(const Duration(days: 1));
    }
    String time = id == 0 ? " 오전 12시-02시" : id == 1 ? " 오전 02시-05시" : " 오전 05시-07시";
    return "${current.month.toString().padLeft(2, "0")}.${current.day.toString().padLeft(2, "0")}(${getWeekDay(current)})$time";
  }
}
