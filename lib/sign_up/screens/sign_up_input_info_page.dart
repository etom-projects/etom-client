import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kurly_hackerton/sign_up/screens/sign_up_route_page.dart';
import 'package:kurly_hackerton/sign_up/services/sign_up_helper.dart';
import 'package:kurly_hackerton/sign_up/widgets/sign_up_input_info/sign_up_input_field.dart';
import 'package:kurly_hackerton/sign_up/widgets/sign_up_input_info/sign_up_input_info_title.dart';
import 'package:kurly_hackerton/sign_up/widgets/sign_up_input_info/sign_up_term.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';
import 'package:kurly_hackerton/util/design/ui_criteria.dart';
import 'package:kurly_hackerton/util/widgets/complete_button.dart';
import 'package:kurly_hackerton/util/widgets/public_app_bar.dart';
import 'package:kurly_hackerton/utils/token.dart';

class SignUpInputInfoPage extends StatefulWidget {
  static const String route = "/";
  const SignUpInputInfoPage({Key? key}) : super(key: key);

  @override
  _SignUpInputInfoPageState createState() => _SignUpInputInfoPageState();
}

class _SignUpInputInfoPageState extends State<SignUpInputInfoPage> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordCheckController = TextEditingController();

  bool _agreeAll = false;
  bool _agreeRegisterCrew = false;
  bool _agreeCollectionLocationInfo = false;
  bool _agreePromotion = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: publicAppBar(
          context,
          title: "계정가입",
          autoLeading: true),
      resizeToAvoidBottomInset: false,
      backgroundColor: trueWhite,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        behavior: HitTestBehavior.translucent,
        child: Padding(
          padding: EdgeInsets.only(
            left: UICriteria.horizontalPadding16(context),
            right: UICriteria.horizontalPadding16(context),
            top: UICriteria.horizontalPadding32(context)
          ),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: SafeArea(
                  minimum: EdgeInsets.only(
                    bottom: UICriteria.horizontalPadding16(context)
                  ),
                  child: Column(
                    children: [
                      SignUpInputInfoTitle(
                        title: "이메일"
                      ),
                      SignUpInputField(
                          controller: _idController,
                          hint: "Text",
                          onChanged: (String value) => setState(() {}),
                      ),
                      SizedBox(
                        height: UICriteria.width(context) * 0.0666,
                      ),
                      SignUpInputInfoTitle(
                          title: "비밀번호 입력"
                      ),
                      SignUpInputField(
                          controller: _passwordController,
                          hint: "영문, 숫자,특수문자 포함 8자리 이상 입력",
                          obscureText: true,
                        onChanged: (String value) => setState(() {}),
                      ),
                      SizedBox(
                        height: UICriteria.width(context) * 0.0666,
                      ),
                      SignUpInputInfoTitle(
                          title: "비밀번호 확인"
                      ),
                      SignUpInputField(
                          controller: _passwordCheckController,
                          hint: "비밀번호를 다시 한번 입력해주세요",
                         obscureText: true,
                         onChanged: (String value) => setState(() {}),
                      ),
                      SizedBox(
                        height: UICriteria.width(context) * 0.1786,
                        child: Visibility(
                          visible: !(_passwordCheckController.text.isEmpty || _passwordCheckController.text.isEmpty) && (_passwordController.text == _passwordCheckController.text),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: UICriteria.horizontalPadding4(context)
                              ),
                              child: Text(
                                "비밀번호가 일치합니다",
                                style: TextStyle(
                                  color: Color(0xff0CC65F),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SignUpTerm(
                          onTap: () {
                            _agreeAll = !_agreeAll;
                            if (_agreeAll) {
                              _agreeRegisterCrew = true;
                              _agreeCollectionLocationInfo = true;
                              _agreePromotion = true;
                            }
                            else {
                              _agreeRegisterCrew = false;
                              _agreeCollectionLocationInfo = false;
                              _agreePromotion = false;
                            }

                            setState(() {});
                          },
                          isSelected: _agreeAll || (_agreePromotion && _agreeCollectionLocationInfo && _agreeRegisterCrew),
                          text: "전체 동의",
                          isTotal: true
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: UICriteria.width(context) * 0.0466,
                          left: UICriteria.width(context) * 0.0133,
                          right: UICriteria.width(context) * 0.0133,
                          bottom: UICriteria.width(context) * 0.0386
                        ),
                        color: grey20,
                        height: 1,
                      ),
                      SignUpTerm(
                          onTap: () => setState(() => _agreeRegisterCrew = !_agreeRegisterCrew),
                          isSelected: _agreeRegisterCrew,
                          text: "마켓컬리 크루 신청동의 [필수]"),
                      SizedBox(
                        height: UICriteria.horizontalPadding16(context),
                      ),
                      SignUpTerm(
                          onTap: () => setState(() => _agreeCollectionLocationInfo = !_agreeCollectionLocationInfo),
                          isSelected: _agreeCollectionLocationInfo,
                          text: "위치정보 수집 및 이용 동의 [필수]"),
                      SizedBox(
                        height: UICriteria.horizontalPadding16(context),
                      ),
                      SignUpTerm(
                          onTap: () => setState(() => _agreePromotion = !_agreePromotion),
                          isSelected: _agreePromotion,
                          text: "미션 및 프로모션 진행 동의 [선택] "),
                    ],
                  ),
                ),
              ),
              SafeArea(
                minimum: EdgeInsets.only(
                  bottom: UICriteria.horizontalPadding16(context)
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: UICriteria.horizontalPadding4(context)
                    ),
                    child: CompleteButton(
                        title: "동의하고 가입하기",
                        onPressed: _signUp,
                        enabled: _completeButtonEnabled(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool _completeButtonEnabled() {
    return _idController.text.isNotEmpty
        && _passwordController.text.isNotEmpty
        && _passwordCheckController.text.isNotEmpty
        && (_passwordController.text == _passwordCheckController.text)
        && (_agreeRegisterCrew && _agreeCollectionLocationInfo);
  }
  
  _signUp() async {
    int signUpStatusCode = await SignUpHelper.signUp(email: _idController.text, password: _passwordController.text, name: "김컬리", phoneNumber: "010-123-4567");
    print(signUpStatusCode);

    if (signUpStatusCode == 200) {
      dynamic token = await SignUpHelper.signIn(email: _idController.text, password: _passwordController.text);
      print(token);
      if (token != null) {
        userToken = token;
        Navigator.pushNamedAndRemoveUntil(context, SignUpRoutePage.route, (route) => false);
      }
    }
  }
}
