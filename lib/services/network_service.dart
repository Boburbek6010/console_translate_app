import 'dart:convert';

import 'package:http/http.dart';

class UserAuthNetService {
  static final String baseUrlUserAuth = "6568659c9927836bd974ba9d.mockapi.io";
  static final String apiUserAuth = "/user_auth";
  static Map<String, String> headers = {'Content-Type': 'application/json'};

  static Future<String> getUserAuthData(String api) async {
    Uri url = Uri.https(baseUrlUserAuth, api);
    Response response = await get(url);
    return response.body;
  }

  static Future<String> postUserAuthData(Map<String, dynamic> body) async {
    Uri url = Uri.https(UserAuthNetService.baseUrlUserAuth,
        UserAuthNetService.apiUserAuth);
    Response response = await post(url, body: jsonEncode(body),
        headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return "Successfully posted: ${response.body}";
    }
    else {
      return "Something went wrong at ${response.statusCode}";
    }
  }
}
