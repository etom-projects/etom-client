import 'package:flutter/material.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';
import 'package:kurly_hackerton/util/design/ui_criteria.dart';

class DeliveryMethodButton extends StatelessWidget {
  final int id;
  final void Function() onTap;
  final bool isSelected;

  const DeliveryMethodButton({
    Key? key,
    required this.id,
    required this.onTap,
    required this.isSelected
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: UICriteria.width(context) * 0.128,
          decoration: BoxDecoration(
            color: isSelected ? kurlyPurple : trueWhite,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(id == 0 ? 4 : 0),
              topRight: Radius.circular(id == 1 ? 4 : 0),
              bottomLeft: Radius.circular(id == 0 ? 4 : 0),
              bottomRight: Radius.circular(id == 1 ? 4 : 0),
            ),
            border: Border.all(
              color: isSelected ? kurlyPurple : grey30,
              width: 1
            )
          ),
          alignment: Alignment.center,
          child: Text(
            id == 0 ? "새벽배송" : "일반배송",
            style: TextStyle(
              color: isSelected ? trueWhite : grey40
            ),
          ),
        ),
      ),
    );
  }
}
