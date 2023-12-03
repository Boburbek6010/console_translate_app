
import 'dart:convert';

List<AdminAuth> adminListFromData(String data) => List<AdminAuth>.from(jsonDecode(data).map((e) => AdminAuth.fromJson(e)));

class AdminAuth{
  late String password;
  late String username;
  late String id;


  AdminAuth( this.id, {required this.password,  required this.username});

  AdminAuth.fromJson(Map<String, dynamic>json){
    password = json["password"];
    username = json["username"];
    id = json["id"];
  }


  Map<String, dynamic> toJson() {
    return {
      "password": password,
      "username": username,
      "id": id
    };
  }


}

