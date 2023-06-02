import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app_store/appstyle.dart';
import 'package:shoes_app_store/screens/favorits.dart';
import 'package:shoes_app_store/utils/dimensions.dart';
import 'package:shoes_app_store/widgets/reusbleText.dart';
import '../controllers/favorit_provider.dart';
class ProductCard extends StatefulWidget {
  const ProductCard(
      {Key? key,
      required this.price,
      required this.category,
      required this.id,
      required this.name,
      required this.image})
      : super(key: key);
  final String price;
  final String category;
  final String id;
  final String name;
  final String image;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
 /* Future<void> _createCart(Map<dynamic, dynamic> newCart) async {
    await _cartBox.add(newCart);
  }*/
  @override
  Widget build(BuildContext context) {
    var favortesNotifire=Provider.of<FavoritesNotifire>(context);
    favortesNotifire.getFavorites();
    bool selected = true;
    return  Padding(
        padding:  EdgeInsets.fromLTRB(Dimensions.width10, 0, Dimensions.width20, 0),
        child: ClipRRect(
          borderRadius:  BorderRadius.all(Radius.circular(Dimensions.radius15)),
          child: Container(
            height: Dimensions.screenHeight/2.4,
            width:Dimensions.screenWidth/1.57,
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.white,
                spreadRadius: 1,
                blurRadius: 0.6,
                offset: Offset(1, 1),
              )
            ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: Dimensions.screenHeight/4.99,
                      decoration: BoxDecoration(
                          image:
                              DecorationImage(image: NetworkImage(widget.image),fit: BoxFit.cover),),
                    ),
                    Positioned(
                      right: Dimensions.width10,
                      top: Dimensions.height10,
                      child: GestureDetector(
                        onTap: (){
                          if(favortesNotifire.ide.contains(widget.id)){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const Favorites()));
                          }
                          else{
                           favortesNotifire.createFav({
                              'id':widget.id,
                              'name':widget.name,
                              'category':widget.category,
                              'price':widget.price,
                              'imageUrl':widget.image,
                            });
                           setState(() {

                           });
                          }
                        },
                        child: favortesNotifire.ide.contains(widget.id)?  Icon(Ionicons.heart,size: Dimensions.screenHeight/25.9,):  Icon(Ionicons.heart_outline,size: Dimensions.screenHeight/25.9),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding:  EdgeInsets.only(
                    left: Dimensions.width10,right: Dimensions.width10
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Column(
                          children: [
                            SizedBox(
                              height:Dimensions.height10,
                            ),
                          ReusableText(
                                text:widget.name,
                                style: appstylewithHt(
                                    Dimensions.font26, Colors.black, 1.1, FontWeight.bold)
                              ),

                            SizedBox(
                              height:10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ReusableText(
                                    text:widget.category,
                                    style:
                                    appstylewithHt(Dimensions.font20, Colors.grey, 1.5, FontWeight.bold),
                                  ),
                              ],
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  height:Dimensions.height10,
                ),
                Padding(
                  padding:  EdgeInsets.only(
                    left: Dimensions.width15,
                    right: Dimensions.width15,
                  ),
                    child: FittedBox(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ReusableText(
                              text:"\$${widget.price}",
                              style: appstyle(Dimensions.font26, Colors.black, FontWeight.w600),
                            ),
                             SizedBox(
                              width: Dimensions.width5,
                            ),
                            Row(
                              children: [
                                ReusableText(
                                  text:"Colors",
                                  style: appstyle(Dimensions.height20, Colors.grey, FontWeight.w500),
                                ),
                                 SizedBox(
                                  width: Dimensions.width15,
                                ),
                                ChoiceChip(
                                  label: const Text(""),
                                  selected: selected,
                                  visualDensity: VisualDensity.compact,
                                  selectedColor: Colors.black,
                                )
                              ],
                            )
                          ],
                        ),
                    ),
                    ),

                
              ],
            ),
          ),
        ),

    );
  }
}
