
import 'dart:convert';

List<UserAuth> userListFromData(String data) => List<UserAuth>.from(jsonDecode(data).map((e) => UserAuth.fromJson(e)));

class UserAuth{
  late String password;
  late String username;
  late String phoneNum;
  late String id;


  UserAuth( this.id, {required this.password, required this.phoneNum, required this.username});

  UserAuth.fromJson(Map<String, dynamic>json){
    password = json["password"];
    username = json["username"];
    phoneNum = json["phone_num"];
    id = json["id"];
  }


  Map<String, dynamic> toJson() {
    return {
      "password": password,
      "username": username,
      "phone_num": phoneNum,
      "id": id
    };
  }

}

