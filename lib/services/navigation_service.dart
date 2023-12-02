 import '../menus/main_menu.dart';

class Navigator{
static Menu? initialMenu;

///static menus list
static Future push(Menu menu)async{
  initialMenu = menu;
  await initialMenu?.build();
 }
 }




