import 'package:flutter/material.dart';
import 'package:kurly_hackerton/delivery/screens/my_delivery_page.dart';
import 'package:kurly_hackerton/sign_up/screens/sign_up_page1.dart';
import 'package:kurly_hackerton/sign_up/screens/sign_up_page2.dart';
import 'package:kurly_hackerton/sign_up/services/sign_up_helper.dart';
import 'package:kurly_hackerton/sign_up/widgets/sign_up_tab.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';
import 'package:kurly_hackerton/util/design/ui_criteria.dart';
import 'package:kurly_hackerton/util/widgets/complete_button.dart';

class SignUpRoutePage extends StatefulWidget {
  static const String route = "/sign-up";

  const SignUpRoutePage({Key? key}) : super(key: key);

  @override
  State<SignUpRoutePage> createState() => _SignUpRoutePageState();
}

class _SignUpRoutePageState extends State<SignUpRoutePage> {
  int _tabIndex = 0;
  PageController _controller = PageController();
  int? _selectedJobType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: trueWhite,
        elevation: 0,
      ),
      backgroundColor: trueWhite,
      body: SafeArea(
        minimum: EdgeInsets.only(
          bottom: UICriteria.horizontalPadding16(context)
        ),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            print(constraints.maxHeight);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: UICriteria.width(context) * 0.0533,
                    right: UICriteria.width(context) * 0.0533,
                    top: UICriteria.horizontalPadding24(context),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SignUpTab(
                            isSelected: _tabIndex == 0,
                            sequence: 1,
                          ),
                          SizedBox(
                            width: UICriteria.horizontalPadding12(context),
                          ),
                          SignUpTab(
                            isSelected: _tabIndex == 1,
                            sequence: 2,
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.close,
                          size: UICriteria.horizontalPadding24(context),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      SizedBox(
                        height: constraints.maxHeight,
                        child: PageView.builder(
                            itemCount: 2,
                            controller: _controller,
                            physics: _tabIndex == 1 ? null : const NeverScrollableScrollPhysics(),
                            onPageChanged: (int index) {
                              if (index == 0) {
                                _tabIndex = 0;
                                setState(() {});
                              }
                            },
                            itemBuilder: (BuildContext context, int index) {
                              if (index == 0) {
                                return SignUpPage1(
                                  selectJobType: _selectJobType,
                                  selectedId: _selectedJobType,
                                );
                              }
                              return SignUpPage2();
                            }
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: UICriteria.width(context) * 0.053
                        ),
                        child: CompleteButton(
                          title: _tabIndex == 0 ? "다음" : "선택완료",
                          onPressed: _tabIndex == 0
                            ? () => _requestSelectJobType(_selectedJobType!)
                            : _navigateNext,
                          enabled: _tabIndex == 0 ? _selectedJobType != null : true,
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ),
      )
    );
  }

  _selectJobType(int id) {
    _selectedJobType = id;
    setState(() {});
  }

  _requestSelectJobType(int jobType) async {
    int statusCode = await SignUpHelper.selectJobType(jobType);
    print(statusCode);
    if (statusCode == 200) {
      _changeTab(1);
    }
  }

  _changeTab(int index) {
    _controller.animateTo(_controller.position.maxScrollExtent, duration: const Duration(milliseconds: 200), curve: Curves.linear);
    _tabIndex = index;
    setState(() {});
  }

  _navigateNext() => Navigator.pushNamed(context, MyDeliveryPage.route);
}
