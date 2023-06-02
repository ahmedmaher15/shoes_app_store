import 'package:flutter/services.dart'as  the_bundle;
import 'package:shoes_app_store/models/sneakers_model.dart';
class Helper{
//single male
Future<List<Sneakers>> getMeleSneakers() async{
final data=await the_bundle.rootBundle.loadString("assets/json/men_shoes.json");
final maleList=SneackersFromJson(data);
return maleList;
}
//single female
Future<List<Sneakers>> getFemaleSneakers() async{
  final data=await the_bundle.rootBundle.loadString("assets/json/women_shoes.json");
  final femaleList=SneackersFromJson(data);
  return femaleList;
}
//kids
Future<List<Sneakers>> getKidsSneakers() async{
  final data=await the_bundle.rootBundle.loadString("assets/json/kids_shoes.json");
  final kidsList=SneackersFromJson(data);
  return kidsList;
}
//single male
Future<Sneakers> getMaleSneakersById(String id) async{
  final data=await the_bundle.rootBundle.loadString("assets/json/men_shoes.json");
  final maleList=SneackersFromJson(data);
  final sneaker=maleList.firstWhere((sneaker)=>sneaker.id==id);
  return sneaker;
}
//single female
Future<Sneakers> getFemaleSneakersById(String id) async{
  final data=await the_bundle.rootBundle.loadString("assets/json/women_shoes.json");
  final maleList=SneackersFromJson(data);
  final sneaker=maleList.firstWhere((sneaker)=>sneaker.id==id);
  return sneaker;
}
//single kids
Future<Sneakers> getkidsSneakersById(String id) async{
  final data=await the_bundle.rootBundle.loadString("assets/json/kids_shoes.json");
  final maleList=SneackersFromJson(data);
  final sneaker=maleList.firstWhere((sneaker)=>sneaker.id==id);
  return sneaker;
}

}