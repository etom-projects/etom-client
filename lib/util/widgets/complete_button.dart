import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';

class CompleteButton extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  final bool enabled;

  const CompleteButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.enabled = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 343/76,
      child: Container(
        color: trueWhite,
        alignment: Alignment.center,
        child: AspectRatio(
          aspectRatio: 343/52,
          child: MaterialButton(
            color: kurlyPurple,
            disabledColor: grey20,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            ),
            onPressed: enabled ? onPressed : null,
            child: Text(
              title,
              style: TextStyle(
                color: enabled ? trueWhite : grey40,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700
              ),
            ),
          ),
        ),
      ),
    );
  }
}
