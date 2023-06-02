import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoes_app_store/appstyle.dart';
import 'package:shoes_app_store/utils/dimensions.dart';
import 'package:shoes_app_store/widgets/reusbleText.dart';
class StaggerTile extends StatefulWidget {
  const StaggerTile({Key? key, required this.imageUrl, required this.name, required this.price}) : super(key: key);
final String imageUrl;
  final String name;
  final String price;
  @override
  State<StaggerTile> createState() => _StaggerTileState();
}

class _StaggerTileState extends State<StaggerTile> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        width:Dimensions.screenWidth/3.90,

        decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all( Radius.circular(Dimensions.height15))
        ),
        child:  Padding(
          padding: EdgeInsets.all(Dimensions.height10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           // CachedNetworkImage(imageUrl:widget.imageUrl,fit: BoxFit.cover,),
              Container(
                height: 110,
                width: 200,
                decoration:BoxDecoration(
                  image: DecorationImage(image: NetworkImage(widget.imageUrl),fit: BoxFit.cover)
                ) ,
              ),
              Container(
                height:Dimensions.screenHeight/15.62,
                child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ReusableText(text:widget.name,style:appstylewithHt(Dimensions.height20, Colors.black,1,FontWeight.w700),),
                   SizedBox(height:Dimensions.screenHeight/111.67,),
                   ReusableText(text:widget.price,style:appstylewithHt(Dimensions.height20, Colors.black, 1,FontWeight.w700),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }
}
