import 'dart:convert';

import 'package:http/http.dart';

class NetworkService{
  static final String baseUrlAdminAuth = "6568659c9927836bd974ba9d.mockapi.io";
  static final String apiAdminAuth = "/admin_auth";
  static final String baseUrlUserAuth = "6568659c9927836bd974ba9d.mockapi.io";
  static final String apiUserAuth = "/user_auth";

  static Map<String, String> headers = {'Content-Type': 'application/json'};

  static Future<String> getData(String baseUrl, String api) async {
    Uri url = Uri.https(baseUrl, api);
    Response response = await get(url);
    return response.body;
  }

  static Future<String> postData(Map<String, dynamic> body, String baseUrl, String api) async {
    Uri url = Uri.https(baseUrl,api);
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


