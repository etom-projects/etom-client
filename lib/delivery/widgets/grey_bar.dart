import 'package:flutter/material.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';
import 'package:kurly_hackerton/util/design/ui_criteria.dart';

class GreyBar extends StatelessWidget {
  const GreyBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: grey10,
      height: UICriteria.horizontalPadding12(context),
    );
  }
}
