import 'dart:convert';

import 'package:console_translate_app/services/extension_service.dart';
import 'package:http/http.dart';

class NetworkService{
  static final String baseUrlAdminAuth = "6568659c9927836bd974ba9d.mockapi.io";
  static final String apiAdminAuth = "/admin_auth";
  static final String baseUrlUserAuth = "6568659c9927836bd974ba9d.mockapi.io";
  static final String apiUserAuth = "/user_auth";

  static final String baseUrlWord = "655deec19f1e1093c59a2f51.mockapi.io";
  static final String apiWord = "/List_of_searched_words";
  static final String apiNewWord = "/new_word";

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
      return "successfull".tr;
    }
    else {
      return "Server bilan bog'liq muammoalar mavjud!";
    }
  }


  static Future<String> deleteData(String baseUrl, String api, String id) async {
    Uri url = Uri.https(baseUrl,"$api/$id");
    Response response = await delete(url, headers: headers);
    if(response.statusCode == 200 || response.statusCode == 201) return response.body;
    else return "Smth got wrong!! -- ${response.statusCode}";
  }
}


