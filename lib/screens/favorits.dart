import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app_store/appstyle.dart';
import 'package:shoes_app_store/controllers/favorit_provider.dart';
import 'package:shoes_app_store/screens/mainScreen.dart';
import 'package:shoes_app_store/utils/dimensions.dart';
import '../models/constants.dart';
import '../widgets/reusbleText.dart';
class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);
  @override
  State<Favorites> createState() => _FavoritesState();
}
class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    final favoritsNotifire=Provider.of<FavoritesNotifire>(context);
    favoritsNotifire.getAllData();

    return Scaffold(
      body: SizedBox(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(Dimensions.width10, Dimensions.height20, 0, 0),
              height: Dimensions.screenHeight/3.12,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/top_image.png",
                    ),
                    fit: BoxFit.fill),
              ),
              child: Padding(
                padding: EdgeInsets.only(top:Dimensions.height20,left: Dimensions.width15),
                child: Text(
                  "My Favorites.",
                  style: appstyle(40, Colors.white, FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(Dimensions.screenHeight/97.62),
              child: ListView.builder(
                  padding: EdgeInsets.only(top: Dimensions.screenHeight/7.81),
                  itemCount:favoritsNotifire.fav.length,
                  itemBuilder: (context, index) {
                    final shoe =favoritsNotifire.fav[index];
                    return Padding(
                      padding: EdgeInsets.all(Dimensions.height10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(Dimensions.screenHeight/65.08),
                        child: Container(
                          height: Dimensions.screenHeight/7.81,
                          width: Dimensions.screenWidth,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade500,
                                spreadRadius: 5,
                                blurRadius: 0.3,
                                offset: const Offset(0,1)
                              ),
                            ]
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(padding:  EdgeInsets.all(Dimensions.height10),
                                    child: CachedNetworkImage(imageUrl: shoe['imageUrl'],width: Dimensions.screenWidth/4.76,height:Dimensions.screenHeight/9.76,fit: BoxFit.cover,),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: Dimensions.height10,left: Dimensions.width20,),
                                    child: FittedBox(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ReusableText(text:shoe['name'],style: appstyle(Dimensions.height15, Colors.black, FontWeight.bold),),
                                          SizedBox(
                                            height: Dimensions.height5,
                                          ),
                                          ReusableText(text:shoe['category'],style: appstyle(Dimensions.height15, Colors.grey, FontWeight.w600),),
                                          SizedBox(
                                            height: Dimensions.height5,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              ReusableText(text:"\$${shoe['price']}",style: appstyle(Dimensions.height20, Colors.black, FontWeight.bold),),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Padding(padding: EdgeInsets.all(Dimensions.height10),
                                child: GestureDetector(
                                  onTap: (){
                                    favoritsNotifire.deleteFav(shoe['key']);
                                    ids.removeWhere((element) {
                                      return element==shoe['id'];
                                    });
                                    Navigator.push(context, MaterialPageRoute(builder: (ctx)=>MainScreen()));
                                  },
                                  child: const Icon(Ionicons.md_heart_dislike),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
