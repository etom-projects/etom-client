import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';

class RegisterCarTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;

  const RegisterCarTextField({
    Key? key,
    required this.controller,
    required this.hint
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 335/60,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: grey20
          )
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 12.78
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: grey60,
              fontSize: 17.sp,
              fontWeight: FontWeight.w600
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
