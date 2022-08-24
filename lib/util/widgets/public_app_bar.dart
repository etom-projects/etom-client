import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';
import 'package:kurly_hackerton/util/design/ui_criteria.dart';

PreferredSizeWidget publicAppBar(
    BuildContext context,
{
  String? title,
  bool autoLeading = false,
  Widget? leading,
  Widget? titleWidget,
}) {
  return AppBar(
    toolbarHeight: UICriteria.width(context) * 0.2346 - UICriteria.statusBarHeight(context),
    backgroundColor: kurlyPurple,
    elevation: 0,
    centerTitle: true,
    automaticallyImplyLeading: autoLeading,
    title: titleWidget ?? Text(
      title!,
      style: TextStyle(
        color: trueWhite,
        fontWeight: FontWeight.w700,
        fontSize: 20.sp
      ),
    ),
    leadingWidth: UICriteria.horizontalPadding24(context) * 2,
    leading: autoLeading
        ? GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Icon(
        Icons.arrow_back_ios,
        size: 20.sp,
      ),
    ) : null,
  );
}