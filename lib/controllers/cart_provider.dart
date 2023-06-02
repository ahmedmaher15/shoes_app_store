import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class CartProvider with ChangeNotifier{
  final _cartBox=Hive.box('cart_box');
  List<dynamic> _cart=[];
  List<dynamic> get cart=>_cart;
  set cart(List<dynamic> newCart) {
    _cart=newCart;
    notifyListeners();
  }
  getcart(){
    final cartData = _cartBox.keys.map((key) {
      final item = _cartBox.get(key);
      return {
        "Key": key,
        'id': item['id'],
        'category': item['category'],
        'name': item['name'],
        'imageUrl': item['imageUrl'],
        'price': item['price'],
        'qtr': item['qtr'],
        "size": item['size'],
      };
    }).toList();
    _cart=cartData.reversed.toList();
  }
  int _counter=0;
  int get counter=>_counter;
  void increment(){
    _counter++;
  }
  void decrement(){
    _counter--;
  }
  Future<void> deletCart( key)async{
    await _cartBox.delete(key);
  }
  Future<void> createCart(Map<String,dynamic> newCart)async{
    await _cartBox.add(newCart);
  }

}