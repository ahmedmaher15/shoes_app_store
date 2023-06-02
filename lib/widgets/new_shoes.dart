import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoes_app_store/utils/dimensions.dart';
class NewShoes extends StatelessWidget {
  const NewShoes({
    super.key,
    required this.imageUrl
  });

 final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints)=> Container(
        decoration:  BoxDecoration(
            color: Colors.white,
            boxShadow:  [
              BoxShadow(
                color: Colors.white ,
                spreadRadius: 1,
                blurRadius: 0.8,
                offset: Offset(0,1),
              )
            ],
            borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius15))
        ),
        height: Dimensions.screenHeight/7.81,
        width: Dimensions.screenHeight/7.5,
        child: CachedNetworkImage(fit: BoxFit.cover,imageUrl: imageUrl,),
      ),
    );
  }
}