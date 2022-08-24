import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kurly_hackerton/delivery/services/helper/delivery_helper.dart';
import 'package:kurly_hackerton/delivery/widgets/delivery_detail/delivery_detail_header.dart';
import 'package:kurly_hackerton/delivery/widgets/delivery_detail/delivery_product.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';
import 'package:kurly_hackerton/util/design/ui_criteria.dart';
import 'package:kurly_hackerton/util/widgets/public_app_bar.dart';
import 'package:kurly_hackerton/utils/widgets/loading_widget.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CarryingProductDetailPage extends StatefulWidget {
  static const String route = "/carrying/product/detail";

  const CarryingProductDetailPage({Key? key}) : super(key: key);

  @override
  _CarryingProductDetailPageState createState() => _CarryingProductDetailPageState();
}

class _CarryingProductDetailPageState extends State<CarryingProductDetailPage> {
  Completer<NaverMapController> _controller = Completer();

  MapType _mapType = MapType.Basic;
  LocationTrackingMode _trackingMode = LocationTrackingMode.NoFollow;
  List<Marker> _markers = <Marker>[];
  dynamic _deliveryData;
  late Future _future;
  int _selectedIndex = 0;
  List<LatLng> _coordinates = [
  ];
  int _toggleIndex = 0;
  @override
  void initState() {
    super.initState();
    _determinePosition();
    _future = _loadProductRouteData(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: publicAppBar(
          context,
          titleWidget: ToggleSwitch(
            minWidth: UICriteria.width(context) * 0.2493,
            minHeight: UICriteria.width(context) * 0.08,
            cornerRadius: 50.0,
            activeBgColors: [[Color(0xff401250)],[Color(0xff401250)]],
            activeFgColor: trueWhite.withOpacity(0.6),
            inactiveBgColor: trueWhite,
            inactiveFgColor: Color(0xff310042),
            initialLabelIndex: _toggleIndex,
            totalSwitches: 2,
            labels: ["지도보기", "목록보기"],
            fontSize: 17.sp,
            radiusStyle: true,
            onToggle: (index) {
              print(index);
              _toggleIndex = index!;
              setState(() {

              });
            },
          ),
          autoLeading: true
      ),
      body: _toggleIndex == 0
      ? Column(
        children: [
          AspectRatio(
            aspectRatio: 375/284,
            child: FutureBuilder(
              future: _future,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  _deliveryData = snapshot.data["deliveriesMap"];
                 if (_selectedIndex == 1) {
                   print("시발");
                   _markers.clear();
                   for (int i = 0; i < _deliveryData.length; i++) {
                     _markers.add(
                         Marker(
                             width: 20,
                             height: 30,
                             markerId: i.toString(),
                             position: LatLng(double.parse(_deliveryData[i]["latitude"]), double.parse(_deliveryData[i]["longitude"])),
                             captionText: _deliveryData[i]["rank"],
                             iconTintColor: _deliveryData[i]["rank"] == "A" ? Color(0xff03B05D) : _deliveryData[i]["rank"] == "B" ? kurlyPurple : Color(0xff636363)
                         )
                     );
                   }
                 }
                 else {
                   _markers.clear();
                   _coordinates.clear();
                   for (int i = 0; i < _deliveryData.length; i++) {
                     _coordinates.add(
                       LatLng(double.parse(_deliveryData[i]["latitude"]), double.parse(_deliveryData[i]["longitude"]))
                     );
                     _markers.add(
                         Marker(
                             width: 20,
                             height: 30,
                             markerId: i.toString(),
                             position: LatLng(double.parse(_deliveryData[i]["latitude"]), double.parse(_deliveryData[i]["longitude"])),
                             captionText: _deliveryData[i]["priority"].toString(),
                             iconTintColor: kurlyPurple
                         )
                     );
                   }

                   print(snapshot.data);
                 }
                  return NaverMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(double.parse(_deliveryData[0]["latitude"]), double.parse(_deliveryData[0]["longitude"])),
                      zoom: 14,
                    ),
                    onMapCreated: onMapCreated,
                    mapType: _mapType,
                    initLocationTrackingMode: _trackingMode,
                    locationButtonEnable: true,
                    indoorEnable: true,
                    onCameraChange: _onCameraChange,
                    onCameraIdle: _onCameraIdle,
                    onMapTap: _onMapTap,
                    onMapLongTap: _onMapLongTap,
                    onMapDoubleTap: _onMapDoubleTap,
                    onMapTwoFingerTap: _onMapTwoFingerTap,
                    onSymbolTap: _onSymbolTap,
                    maxZoom: 17,
                    minZoom: 1,
                    useSurface: kReleaseMode,
                    logoClickEnabled: true,
                    markers: _markers,
                    pathOverlays: _selectedIndex == 0
                    ? {
                      PathOverlay(
                        PathOverlayId('path'),
                        _coordinates,
                        width: 3,
                        color: kurlyPurple,
                        outlineColor: Colors.white,
                      ),
                    } : null,
                  );
                }

                return LoadingWidget();
              },
            ),
          ),
          Expanded(
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 375/50,
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedIndex = 0;
                              _future = _loadProductRouteData(1);
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: grey20
                              ),
                              color: _selectedIndex == 0 ? kurlyPurple.withOpacity(0.1) : trueWhite
                            ),
                            alignment: Alignment.center,
                            child: Text(
                                "전체 루트 보기",
                                style: TextStyle(
                                  color: kurlyPurple,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600
                                ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedIndex = 1;
                              _future = _loadProductLocationData();
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: grey20
                                ),
                                color: _selectedIndex == 1 ? kurlyPurple.withOpacity(0.1) : trueWhite
                            ),
                            child: Text(
                              "전체 배송지 보기",
                              style: TextStyle(
                                  color: kurlyPurple,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                DeliveryDetailHeader(),
                Column(
                  children: List.generate(3, (index) {
                    return DeliveryProduct();
                  }),
                )
              ],
            ),
          )
        ],
      )
      : Stack(
        children: [
          SingleChildScrollView(
            child: Column(
                children: [
                  DeliveryDetailHeader(),
                  Column(
                    children: List.generate(3, (index) {
                      return DeliveryProduct();
                    }),
                  ),
                  DeliveryDetailHeader(),
                  Column(
                    children: List.generate(3, (index) {
                      return DeliveryProduct();
                    }),
                  ),
                  DeliveryDetailHeader(),
                  Column(
                    children: List.generate(3, (index) {
                      return DeliveryProduct();
                    }),
                  )
                ],
            ),
          ),
        ],
      ),
    );
  }

  _onMapTap(LatLng position) async {
    await (await _controller.future).moveCamera(CameraUpdate.toCameraPosition(CameraPosition(target: position)), animationDuration: 1500);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content:
      Text('[onTap] lat: ${position.latitude}, lon: ${position.longitude}'),
      duration: Duration(milliseconds: 500),
      backgroundColor: Colors.black,
    ));
  }

  _onMapLongTap(LatLng position) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
          '[onLongTap] lat: ${position.latitude}, lon: ${position.longitude}'),
      duration: Duration(milliseconds: 500),
      backgroundColor: Colors.black,
    ));
  }

  _onMapDoubleTap(LatLng position) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
          '[onDoubleTap] lat: ${position.latitude}, lon: ${position.longitude}'),
      duration: Duration(milliseconds: 500),
      backgroundColor: Colors.black,
    ));
  }

  _onMapTwoFingerTap(LatLng position) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
          '[onTwoFingerTap] lat: ${position.latitude}, lon: ${position.longitude}'),
      duration: Duration(milliseconds: 500),
      backgroundColor: Colors.black,
    ));
  }

  _onSymbolTap(LatLng? position, String? caption) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
          '[onSymbolTap] caption: $caption, lat: ${position?.latitude}, lon: ${position?.longitude}'),
      duration: Duration(milliseconds: 500),
      backgroundColor: Colors.black,
    ));
  }

  /// 지도 생성 완료시
  void onMapCreated(NaverMapController controller) async {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
    controller.moveCamera(
        CameraUpdate.fitBounds(
          LatLngBounds.fromLatLngList(_coordinates),
          padding: 48,
        ),
        animationDuration: 0);
  }


  void _onCameraChange(
      LatLng? latLng, CameraChangeReason reason, bool? isAnimated) {
    print('카메라 움직임 >>> 위치 : ${latLng?.latitude}, ${latLng?.longitude}'
        '\n원인: $reason'
        '\n에니메이션 여부: $isAnimated');
  }

  void _onCameraIdle() {
    print('카메라 움직임 멈춤');
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future _loadProductLocationData() async {
    return await DeliveryHelper.viewCarryingProductMap();
  }

  Future _loadProductRouteData(int groupId) async {
    return await DeliveryHelper.viewCarryingProductRoute(groupId);
  }


}
