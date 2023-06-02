import 'package:flutter/cupertino.dart';

class MyProvider with ChangeNotifier{
  int _pageEndix=0;
  int get pageIndex=>_pageEndix;
  set pageIndex(int newEndix){
    _pageEndix=newEndix;
    notifyListeners();
  }
}