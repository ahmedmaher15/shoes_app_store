import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app_store/appstyle.dart';
import 'package:shoes_app_store/controllers/cart_provider.dart';
import 'package:shoes_app_store/utils/dimensions.dart';
import 'package:shoes_app_store/widgets/check_out.dart';
import 'package:shoes_app_store/widgets/reusbleText.dart';
import 'mainScreen.dart';
class CartPage extends StatefulWidget {
 const  CartPage({Key? key}) : super(key: key);
  @override
  State<CartPage> createState() => _CartPageState();
}
class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartProvider=Provider.of<CartProvider>(context);
    cartProvider.getcart();
    return Scaffold(
      backgroundColor: const Color(0xffe2e2e2),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: (){
                    },
                    child: const Icon(AntDesign.close,color: Colors.black,),
                  ),
                  Text("My Cart",style: appstyle(36, Colors.black, FontWeight.bold),),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 551,
                    child: ListView.builder(
                        itemCount: cartProvider.cart.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context,index) {
                          final data=cartProvider.cart[index];
                          return Padding(
                          padding: EdgeInsets.all(8),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          child: Slidable(
                            key: const ValueKey(0),
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                    flex: 1,
                                    onPressed: (val){},
                                  backgroundColor:  const Color(0xFF000000),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: "Delete",

                                )
                              ],
                            )
                            ,child: Container(
                            height: 110,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              boxShadow:[
                                BoxShadow(
                                  color: Colors.grey.shade500,
                                  spreadRadius: 5,
                                  blurRadius: 0.3,
                                  offset: const Offset(0,1)
                                )
                              ]
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [Padding(padding: EdgeInsets.only(top: 15,bottom: 15,left: 5,right: 5),
                                        child: Container(
                                          width: 70,height: 70,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(image: NetworkImage(data['imageUrl'],),fit: BoxFit.fill,)
                                            ),
                                           ),
                                      ),
                                        Positioned(
                                            bottom: -4,
                                            left: -2,
                                            child: GestureDetector(
                                              onTap: (){
                                                cartProvider.deletCart(data['Key']);
                                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>MainScreen()));
                                              },
                                              child: Container(
                                                width: 40,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius: BorderRadius.only(topRight: Radius.circular(12))
                                                ),
                                                child: Icon(AntDesign.delete,color: Colors.white,size: 20,),
                                              ),
                                            )),
                                      ]
                                    ),

                                    Padding(padding: EdgeInsets.only(top: Dimensions.height5,left: Dimensions.width20),
                                     child: FittedBox(
                                       child: Column(
                                         mainAxisAlignment: MainAxisAlignment.start,
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           ReusableText(text:data['name'],style: appstyle(Dimensions.screenHeight/45.94, Colors.black, FontWeight.bold),),
                                           SizedBox(
                                             height: Dimensions.height5,
                                           ),
                                           Text(data['category'],style: appstyle(Dimensions.screenHeight/55.62, Colors.grey, FontWeight.w600),),
                                           Row(

                                             children: [
                                               ReusableText(text:'price',style:appstyle(Dimensions.screenHeight/45.94, Colors.black, FontWeight.w600) ,),
                                               SizedBox(width:Dimensions.width5,),
                                               ReusableText(text:"\$${data['price']}",style:appstyle(Dimensions.height15, Colors.black, FontWeight.w600) ,),
                                               SizedBox(width: Dimensions.width10,),
                                               ReusableText(text:'Size',style:appstyle(Dimensions.screenHeight/45.94, Colors.black, FontWeight.w600) ,),
                                               SizedBox(width:Dimensions.width5,),
                                              ReusableText(text:data['size'].toString(),style:appstyle(Dimensions.screenHeight/70.62, Colors.black, FontWeight.w600) ,),
                                             ],
                                           )
                                         ],
                                       ),
                                     ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.all(Dimensions.height10),
                                      child: Container(
                                        decoration:  BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(Dimensions.radius15))),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            InkWell(
                                                onTap: () {
                                                  // cartProvider.increment();
                                                },
                                                child:  Icon(
                                                  AntDesign.minussquare,
                                                  size: Dimensions.height20,
                                                  color: Colors.grey,
                                                )),
                                            Text(
                                              data['qtr'].toString(),
                                              style: appstyle(
                                                Dimensions.height15,
                                                Colors.black,
                                                FontWeight.w600,
                                              ),
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  // cartProvider.decrement();
                                                },
                                                child:  Icon(
                                                  AntDesign.plussquare,
                                                  size: 20,
                                                  color: Colors.black,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),

                                    // ),
                                  ],
                                )

                              ],
                            ),
                          ),
                          ),
                        ),
                        );
                        }),
                  )
                ],
              ),
               Positioned(bottom: Dimensions.screenHeight/50, left: Dimensions.screenHeight/23.62,right: Dimensions.screenHeight/23.62,
                child: CheckOutButton( lable:  "Proceed to Checkout",),)
            ],
          ),
        ),
      ),
    );
  }
}
