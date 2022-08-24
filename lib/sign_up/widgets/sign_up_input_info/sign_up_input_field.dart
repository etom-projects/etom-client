import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kurly_hackerton/util/design/ui_criteria.dart';

class SignUpInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final void Function(String value)? onChanged;
  final bool obscureText;

  const SignUpInputField({
    Key? key,
    required this.controller,
    required this.hint,
    this.onChanged,
    this.obscureText = false
  }) : super(key: key);

  @override
  _SignUpInputFieldState createState() => _SignUpInputFieldState();
}

class _SignUpInputFieldState extends State<SignUpInputField> {

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 343/44,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xffbcbcbc)
          ),
          color: const Color(0xffF9F9F9),
          borderRadius: BorderRadius.circular(2)
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: UICriteria.horizontalPadding12(context)
        ),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          onChanged: widget.onChanged,
          controller: widget.controller,
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            isDense: true,
            hintText: widget.hint,
            hintStyle: TextStyle(
              color: const Color(0xffbcbcbc),
              fontSize: 15.sp,
              fontWeight: FontWeight.w500
            ),
            border: InputBorder.none
          ),
        ),
      ),
    );
  }
}
