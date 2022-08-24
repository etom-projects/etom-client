import 'package:kurly_hackerton/utils/token.dart';

Map<String, String> headerOnlyToken = {
  "Authorization" : "Bearer $userToken"
};

Map<String, String> headerTokenAndContentType = {
  "Authorization" : "Bearer $userToken",
  "Content-Type" : "application/json"
};