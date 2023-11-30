
import 'dart:convert';

List<UserAuth> userListFromData(String data) => List<UserAuth>.from(jsonDecode(data).map((e) => UserAuth.fromJson(e)));

class UserAuth{
  late String password;
  late String username;
  late int phone_num;
  late String id;


  UserAuth( this.id, {required this.password, required this.phone_num, required this.username});

  UserAuth.fromJson(Map<String, dynamic>json){
    password = json["password"];
    username = json["username"];
    phone_num = json["phone_num"];
    id = json["id"];
  }


  Map<String, dynamic> toJson() {
    return {
      "password": password,
      "username": username,
      "phone_num": phone_num,
      "id": id
    };
  }


}

