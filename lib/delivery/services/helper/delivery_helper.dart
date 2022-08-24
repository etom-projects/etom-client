import 'dart:convert';

import 'package:kurly_hackerton/utils/request_header.dart';
import 'package:kurly_hackerton/utils/request_url.dart';
import 'package:http/http.dart' as http;

class DeliveryHelper {
  static Future<dynamic> viewDeliveryTimes(int addressGroupId) async {
    var url = Uri.parse(viewDeliveryTimesUrl(addressGroupId));

    var response = await http.get(url, headers: headerOnlyToken);

    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    }
  }

  static Future<int> assignDeliveryIds(String deliveryIds) async {
    var url = Uri.parse(assignDeliveryIdsUrl);

    String body = """{
      "deliveryIds" : $deliveryIds
    }""";

    print(body);

    var response = await http.patch(url, headers: headerTokenAndContentType, body: body);

    return response.statusCode;
  }

  static Future<dynamic> viewMyCars() async {
    var url = Uri.parse(deliveryCarsUrl);

    var response = await http.get(url, headers: headerOnlyToken);

    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    }
  }

  static Future<int> selectCar(int userCarId, String deliveryIds) async {
    var url = Uri.parse(selectCarUrl(userCarId));

    print(url);
    String body = """{
      "carId" : $userCarId,
      "deliveryIds" : $deliveryIds
    }""";

    print(body);

    var response = await http.patch(url, headers: headerTokenAndContentType, body: body);

    return response.statusCode;
  }


  static Future<int> startDelivery({required String carModel, required String carLicensePlate, required String carLicensePlateColor}) async {
    var url = Uri.parse(deliveryCarsUrl);

    String body = """{
      "carModel" : "$carModel",
      "carLicensePlate" : "$carLicensePlate",
      "carLicensePlateColor" : "$carLicensePlateColor"
    }""";

    var response = await http.post(url, headers: headerTokenAndContentType, body: body);

    return response.statusCode;
  }


  static Future<dynamic> viewCarryingProduct() async {
    var url = Uri.parse(viewCarryingProductUrl);

    var response = await http.get(url, headers: headerOnlyToken);

    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    }
  }


  static Future<dynamic> viewCarryingProductMap() async {
    var url = Uri.parse(viewCarryingProductMapUrl);

    var response = await http.get(url, headers: headerOnlyToken);

    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    }
  }

  static Future<dynamic> viewCarryingProductRoute(int groupId) async {
    var url = Uri.parse(viewCarryingProductRouteUrl(groupId));

    var response = await http.get(url, headers: headerOnlyToken );

    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    }
  }

}