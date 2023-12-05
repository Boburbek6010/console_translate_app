
import 'package:console_translate_app/menus/admin_menu.dart';
import 'package:console_translate_app/menus/main_menu.dart';
import 'package:console_translate_app/services/extension_service.dart';
import 'package:console_translate_app/services/io_services.dart';
import '../services/navigation_service.dart';
import 'delete_new_words.dart';
import 'delete_searched_menu.dart';


class DeleteIncorrectWords extends Menu {
  static const id = "/delete_incorrect_words_menu";

  Future<void> selectMenuOfDeleteIncorrectWords(String choice) async{
    switch(choice){
      case "1":
        {
          await Navigator.push(DeleteSearchedWords());
          break;
        }
      case "2":
        {
          await Navigator.push(DeleteNewWords());
          break;
        }
      case "3":
        {
          await Navigator.push(AdminMenu());
          break;
        }
      default:
        IOService.write("tryAgain".tr);
        build();
    }
  }
  @override
  Future<void> build() async{
    IOService.write("chooseFT".tr);
    IOService.write("1. ${"fromSearchedWords".tr}");
    IOService.write("2. ${"fromAddedWords".tr}");
    IOService.write("3. ${"goBack".tr}");
    String choice  = IOService.read();
    await selectMenuOfDeleteIncorrectWords(choice);

  }

}