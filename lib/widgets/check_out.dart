import 'package:flutter/material.dart';
import 'package:shoes_app_store/utils/dimensions.dart';


import '../appstyle.dart';

class CheckOutButton extends StatelessWidget {
  const CheckOutButton({
    super.key, this.onTap, required this.lable,
  });
  final void Function()? onTap;

  final String lable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Padding(
        padding: EdgeInsets.all(Dimensions.screenHeight/97.625),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(Dimensions.screenHeight/65.08))
          ),
          height:Dimensions.screenHeight/ 15.62,
          width: Dimensions.screenWidth/0.9,
          child: Center(
            child: Text(lable,style: appstyle(Dimensions.height20, Colors.white, FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
