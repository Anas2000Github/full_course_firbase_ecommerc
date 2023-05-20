
import 'package:ceramic_shop/services/dark_theme.dart';
import 'package:flutter/cupertino.dart';

class DarkThemeProvider with ChangeNotifier{

  DarkThemPrefs darkThemPref =DarkThemPrefs();

  bool _darkTheme = false;
  bool get getDarkTheme=>_darkTheme;

  set setDarkTheme(bool value){
    _darkTheme=value;
    darkThemPref.setDarkTheme(value);
    notifyListeners();
  }



}