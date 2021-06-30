import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier{

  int _selectedMenuIndex = 0;

  int get selectedMenuIndex => this._selectedMenuIndex;

  set selectedMenuIndex(int i){
    this._selectedMenuIndex = i;
    notifyListeners();
  }

}