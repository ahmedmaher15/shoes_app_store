import 'package:flutter/material.dart';
import 'package:shoes_app_store/appstyle.dart';
import 'package:shoes_app_store/utils/dimensions.dart';

class CategoryBtn extends StatelessWidget {
  const CategoryBtn({Key? key, this.onpress, required this.buttonClr, required this.lable, required this.width}) : super(key: key);
  final void Function()? onpress;
  final Color buttonClr;
  final String lable;
  final double width;
  @override
  Widget build(BuildContext context) {

    return MaterialButton(
      onPressed: () {},
      child: Container(
        height: Dimensions.height45*2,
        width: Dimensions.screenWidth,
        decoration: BoxDecoration(
          border: Border.all(
            width:Dimensions.screenWidth/100,
            color: buttonClr,style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(Radius.circular(Dimensions.height20)),
        ),
        child: Center(child: Text(lable,style: appstyle(Dimensions.screenHeight/15, buttonClr, FontWeight.w600),)),
      ),
    );
  }
}
