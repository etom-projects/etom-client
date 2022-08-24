import 'package:flutter/material.dart';

class UICriteria {
  static width(BuildContext context) => MediaQuery.of(context).size.width;

  static height(BuildContext context) => MediaQuery.of(context).size.height;

  static statusBarHeight(BuildContext context) => MediaQuery.of(context).padding.top;

  static bottomPadding(BuildContext context) => MediaQuery.of(context).padding.bottom;

  static horizontalPadding16(BuildContext context) => MediaQuery.of(context).size.width * 0.043;

  static horizontalPadding4(BuildContext context) => MediaQuery.of(context).size.width * 0.0107;

  static horizontalPadding8(BuildContext context) => MediaQuery.of(context).size.width * 0.02133;

  static horizontalPadding12(BuildContext context) => MediaQuery.of(context).size.width *  0.032;

  static horizontalPadding24(BuildContext context) => MediaQuery.of(context).size.width * 0.064;

  static horizontalPadding32(BuildContext context) => MediaQuery.of(context).size.width * 0.0853;

  static appBarHeight(BuildContext context) => MediaQuery.of(context).size.width * 0.067;

}