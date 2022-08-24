import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';
import 'package:kurly_hackerton/util/design/ui_criteria.dart';

class DeliveryDetailCategory extends StatelessWidget {
  final String title;
  const DeliveryDetailCategory({
    Key? key,
    required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: UICriteria.width(context) * 0.12,
      padding: EdgeInsets.only(
          left: UICriteria.width(context) * 0.053
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
            color: grey100,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}
