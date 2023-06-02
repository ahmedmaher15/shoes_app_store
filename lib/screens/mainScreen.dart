import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app_store/controllers/MyProvider.dart';
import 'package:shoes_app_store/screens/favorits.dart';
import 'package:shoes_app_store/screens/homepage.dart';
import '../widgets/bottomNav.dart';
import 'cart.dart';
class MainScreen extends StatefulWidget {
   const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pageList=const[
    HomePage(),
    Favorites(),
    CartPage(),

  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(builder: (ctx,myType,child)=>Scaffold(
      backgroundColor: const Color(0xffe2e2e2),
      body: pageList[myType.pageIndex],
      bottomNavigationBar:const BottoNavBar() ,

    ));
  }
}
