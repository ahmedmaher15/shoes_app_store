import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app_store/controllers/MyProvider.dart';
import 'package:shoes_app_store/utils/dimensions.dart';
import 'botton_nav.dart';
class BottoNavBar extends StatelessWidget {
  const BottoNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(builder: (ctx,myType,child)=>SafeArea(
      child: Padding(
        padding:  EdgeInsets.only( top: Dimensions.height10,bottom: Dimensions.height10,left: Dimensions.height30 ,right: Dimensions.height30),
        child: Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius15))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomNavWidget(icon:myType.pageIndex==0? Ionicons.home:Ionicons.home_outline
                ,onTap: (){myType.pageIndex=0;}
                ,),
              BottomNavWidget(icon:myType.pageIndex==1? Ionicons.heart:Ionicons.heart_circle_outline,onTap: (){
                myType.pageIndex=1;
              },),
              BottomNavWidget(icon:myType.pageIndex==2? Ionicons.cart:Ionicons.cart_outline,onTap: (){
                myType.pageIndex=2;
              },),
            ],
          ),
        ),
      ),
    ));
  }
}
