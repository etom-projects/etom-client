import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kurly_hackerton/delivery/screens/carrying_product_detail_page.dart';
import 'package:kurly_hackerton/delivery/screens/carrying_product_info_page.dart';
import 'package:kurly_hackerton/delivery/screens/delivery_assign_page.dart';
import 'package:kurly_hackerton/delivery/screens/delivery_assign_result_page.dart';
import 'package:kurly_hackerton/delivery/screens/delivery_detail_page.dart';
import 'package:kurly_hackerton/delivery/screens/my_delivery_page.dart';
import 'package:kurly_hackerton/delivery/screens/register_car_info_page.dart';
import 'package:kurly_hackerton/sign_up/screens/sign_up_input_info_page.dart';
import 'package:kurly_hackerton/sign_up/screens/sign_up_route_page.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (BuildContext context, Widget? _) {
          return MaterialApp(
            theme: ThemeData(
              fontFamily: "Pretendard",
              backgroundColor: trueWhite
            ),
            initialRoute: SignUpInputInfoPage.route,
            routes: {
              SignUpInputInfoPage.route: (context) => const SignUpInputInfoPage(),
              SignUpRoutePage.route: (context) => const SignUpRoutePage(),
              MyDeliveryPage.route: (context) => const MyDeliveryPage(),
              DeliveryAssignPage.route: (context) => const DeliveryAssignPage(),
              DeliveryAssignResultPage.route: (context) => const DeliveryAssignResultPage(),
              RegisterCarInfoPage.route: (context) => const RegisterCarInfoPage(),
              CarryingProductInfoPage.route: (context) => const CarryingProductInfoPage(),
              CarryingProductDetailPage.route: (context) => const CarryingProductDetailPage(),
              DeliveryDetailPage.route: (context) => const DeliveryDetailPage()
            },
          );
        },
      )
  );
}
