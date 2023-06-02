import 'package:flutter/cupertino.dart';

import '../helper/helper.dart';
import '../models/sneakers_model.dart';

class ProductNotifire with ChangeNotifier{
  int _activePage=0;
  List<String> _sizes = [];
  List<dynamic> _shoeSize=[];

  int get activePage =>_activePage;
  set activePage(int newIndex){
    _activePage=newIndex;
    notifyListeners();
  }
  List<dynamic> get shoeSize =>_shoeSize;
  set shoeSize(List<dynamic> newIndex){
    _shoeSize=newIndex;
    notifyListeners();
  }

  void toggleCheck(int index){
    for(int i=0;i<_shoeSize.length;i++){
      if(i==index){
        _shoeSize[i]['isSelected']=!_shoeSize[i]['isSelected'];
      }
      notifyListeners();
    }
  }
    List<String> get sizes => _sizes;
    set sizes(List<String> newSizes) {
      _sizes = newSizes;
      notifyListeners();
    }
  late Future<List<Sneakers>> male;
  late Future<List<Sneakers>> female;
  late Future<List<Sneakers>> kids;
  late Future<Sneakers> sneakers;
  void getMale(){
    male=Helper().getMeleSneakers();
  }
  void getFemale(){
    female=Helper().getFemaleSneakers();
  }
  void getKids(){
    kids=Helper().getKidsSneakers();
  }

  void getChoose(String category,String id) {
    if (category == "Men's Running") {
      sneakers = Helper().getMaleSneakersById(id);
    } else if (category == "Women's Running") {
      sneakers = Helper().getFemaleSneakersById(id);
    } else {
      sneakers = Helper().getkidsSneakersById(id);
    }
  }
  }
