import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app_store/controllers/product_Provider.dart';
import 'package:shoes_app_store/screens/product_ditels.dart';
import 'package:shoes_app_store/widgets/product_by_cart.dart';
import 'package:shoes_app_store/widgets/productcard.dart';
import 'package:shoes_app_store/models/sneakers_model.dart';
import 'package:shoes_app_store/widgets/reusbleText.dart';
import '../appstyle.dart';
import '../utils/dimensions.dart';
import 'new_shoes.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({
    super.key,
    required Future<List<Sneakers>> male,
    required this.Index,
  }) : _male = male;
  final Future<List<Sneakers>> _male;
  final int Index;

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    var productNotifier = Provider.of<ProductNotifire>(context);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints)=> Column(
        children: [
        SizedBox(
              height: Dimensions.screenHeight/2.44,
              child: FutureBuilder<List<Sneakers>>(
                future: widget._male,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text("Error ${snapshot.error}");
                  } else {
                    final male = snapshot.data;
                    return ListView.builder(
                        itemCount: male!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          final shoe = snapshot.data![index];
                          return GestureDetector(
                            onTap: () {
                              productNotifier.shoeSize=shoe.sizes;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => ProductDitels(
                                          id: shoe.id, category: shoe.category)));
                            },
                            child: ProductCard(
                                price: shoe.price,
                                category: shoe.category,
                                id: shoe.id,
                                name: shoe.name,
                                image: shoe.imageUrl[0]),
                          );
                        });
                  }
                },
              ),
            ),
          Spacer(),
          Container(
            height: Dimensions.screenHeight/15.62,
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.fromLTRB(Dimensions.screenHeight/65.08, Dimensions.height10, Dimensions.screenHeight/65.08, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Latest Shoes",
                        style: appstyle(Dimensions.screenHeight/32.54, Colors.black, FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => ProdactBycat(
                                        tapIndex: widget.Index,
                                      )));
                        },
                        child: Row(
                          children: [
                            ReusableText(
                              text:"Show All",
                              style: appstyle(Dimensions.screenHeight/35.54, Colors.black, FontWeight.w500),
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                              size: Dimensions.screenHeight/22.3,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Spacer(),
          SizedBox(
            height:Dimensions.screenHeight/7.81,
            child: FutureBuilder<List<Sneakers>>(
              future: widget._male,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text("Error ${snapshot.error}");
                } else {
                  final male = snapshot.data;
                  return ListView.builder(
                      itemCount: male!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        final shoe = snapshot.data![index];
                        return Padding(
                          padding:  EdgeInsets.all(Dimensions.screenHeight/97.62),
                          child: NewShoes(
                              imageUrl: shoe.imageUrl[1]),
                        );
                      });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
