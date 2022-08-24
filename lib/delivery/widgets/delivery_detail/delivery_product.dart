import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kurly_hackerton/sign_up/widgets/freshness_mark.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';
import 'package:kurly_hackerton/util/design/ui_criteria.dart';

class DeliveryProduct extends StatelessWidget {
  const DeliveryProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 375/54,
        child: Container(
          decoration: BoxDecoration(
            color: grey10,
            border: Border(
              bottom: BorderSide(
                color: Color(0xffD9D9D9)
              )
            )
          ),
          padding: EdgeInsets.only(
            left: UICriteria.width(context) * 0.053
          ),
          child: Row(
            children: [
              Container(
                width: UICriteria.width(context) * 0.053,
                height: UICriteria.width(context) * 0.053,
                decoration: BoxDecoration(
                    color: kurlyPurple,
                    borderRadius: BorderRadius.circular(4)
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.check_rounded,
                  color: trueWhite,
                  size: 20.sp,
                ),
              ),
              SizedBox(
                width: UICriteria.horizontalPadding12(context),
              ),
              Text(
                "1120",
                style: TextStyle(
                  color: grey100,
                  fontWeight: FontWeight.w800,
                  fontSize: 17.sp,
                ),
              ),
              Text(
                " SIOC",
                style: TextStyle(
                  color: grey100,
                  fontWeight: FontWeight.w600,
                  fontSize: 17.sp,
                ),
              ),
              SizedBox(
                width: UICriteria.width(context) * 0.0133
              ),
              FreshnessMark(
                  freshness: "A",
                  size: UICriteria.width(context) * 0.053,
                  fontSize: 13.33.sp,
              )
            ],
          ),
        )
    );
  }
}
