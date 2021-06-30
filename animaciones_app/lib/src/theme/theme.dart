import 'package:flutter/material.dart';


class ThemeChanger with ChangeNotifier{

  bool _darkTheme = false;
  bool _cutomTheme = false;

  ThemeData _currentTheme = ThemeData.light();

  bool get darkTheme => this._darkTheme;
  bool get cutomTheme => this._cutomTheme;
  ThemeData get currentTheme => this._currentTheme;

  ThemeChanger(int theme){
    switch(theme){

      case 1: // light
        _darkTheme = false;
        _cutomTheme = false;
        _currentTheme = ThemeData.light();
      break;

      case 2: // dark
        _darkTheme = true;
        _cutomTheme = false;
        _currentTheme = ThemeData.dark();
      break;

      case 3: // dark
        _darkTheme = false;
        _cutomTheme = true;
      break;

      default:
        _darkTheme = false;
        _cutomTheme = false;
        _currentTheme = ThemeData.light();

    }
  }

  set darkTheme(bool value){
    _cutomTheme = false;
    _darkTheme = value;

    if(value){
      _currentTheme = ThemeData.dark();
    } else {
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }

  set cutomTheme(bool value){
    _cutomTheme = value;
    _darkTheme = false;

    if(value){
      _currentTheme = ThemeData.light().copyWith(
        accentColor: Colors.pinkAccent,
        primaryColorLight: Colors.redAccent,
        scaffoldBackgroundColor: Colors.white,
        
      );
    } else {
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }

}