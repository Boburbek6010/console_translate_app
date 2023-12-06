import 'package:console_translate_app/menus/admin_menu.dart';
import 'package:console_translate_app/models/user_auth.dart';
import 'package:console_translate_app/services/extension_service.dart';
import 'package:console_translate_app/services/io_services.dart';
import 'package:console_translate_app/services/navigation_service.dart';
import 'package:console_translate_app/services/network_service.dart';

import 'main_menu.dart';

class UsersInformationListMenu extends Menu{
  static const id = "/home_menu";

  Future<void> selectMenu(String press) async {
    switch(press){
      case"1":{
       await deleteUserFromList();
      }
      case"2":{
        await Navigator.push(AdminMenu());
      }
      default: build();
    }
  }

  @override
  Future<void> build()async{
    await userListShow();
    IOService.write("1.${"chooseFT".tr}");
    IOService.write("2.${"deleteUser".tr}");
    IOService.write("3.${"goBack".tr}");
    String press =IOService.read();
    await selectMenu(press);
  }
  static Future<void> userListShow()async{
    String data =  await NetworkService.getData(NetworkService.baseUrlUserAuth, NetworkService.apiUserAuth);
    List<UserAuth> list = userListFromData(data);
    for (int i = 0; i<list.length; i++) {
      print("${i+1}.username: ${list[i].username}, phone number: ${list[i].phoneNum} id: ${list[i].id}\n");
    }
  }
  Future<void> deleteUserFromList()async{
    print("enterUser".tr);
    String? idChecker = IOService.read();
    int? idChekerInt = int.tryParse(idChecker);
    int counter = 0;
    String data =  await NetworkService.getData(NetworkService.baseUrlUserAuth, NetworkService.apiUserAuth);
    List<UserAuth> list = userListFromData(data);
    if(idChekerInt == null || idChekerInt > list.length){
      print("enterOnlyNum".tr);
      deleteUserFromList();
    }else{
      for (int i=0;  i<list.length; i++) {
        if(list[idChekerInt-1] == list[i]){
          counter++;
        }
      }
    }

    if(counter!=0){
      await NetworkService.deleteData(NetworkService.baseUrlUserAuth, NetworkService.apiUserAuth, list[idChekerInt!-1].id);
      print("successDeleteUser".tr);
      await Navigator.push(AdminMenu());
    }
  }

}