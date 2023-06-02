import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app_store/appstyle.dart';
import 'package:shoes_app_store/controllers/cart_provider.dart';
import 'package:shoes_app_store/controllers/product_Provider.dart';
import 'package:shoes_app_store/utils/dimensions.dart';
import 'package:shoes_app_store/widgets/reusbleText.dart';
import '../controllers/favorit_provider.dart';
import '../widgets/check_out.dart';
import '../models/sneakers_model.dart';
import 'favorits.dart';

class ProductDitels extends StatefulWidget {
  const ProductDitels({Key? key, required this.id, required this.category})
      : super(key: key);
  final String id;
  final String category;

  @override
  State<ProductDitels> createState() => _ProductDitelsState();
}

class _ProductDitelsState extends State<ProductDitels> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final prodactNotifire = Provider.of<ProductNotifire>(context);

    final favNotifier = Provider.of<FavoritesNotifire>(context, listen: true);
    prodactNotifire.getChoose(widget.category, widget.id);
    favNotifier.getFavorites();
    return Scaffold(
      body: FutureBuilder<Sneakers>(
          future: prodactNotifire.sneakers,
          builder: (context, snapshot) {

              final sneaker = snapshot.data;
              return Consumer<ProductNotifire>(
                builder: (context, productNotifier, child) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else {return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      leadingWidth: 0,
                      title: Padding(
                        padding: EdgeInsets.only(bottom: Dimensions.height10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                productNotifier.shoeSize.clear();
                              },
                              child: const Icon(
                                AntDesign.close,
                                color: Colors.black,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                Ionicons.ellipsis_horizontal,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      pinned: true,
                      snap: false,
                      floating: true,
                      backgroundColor: Colors.transparent,
                      expandedHeight: Dimensions.screenHeight,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Stack(
                          children: [
                            SizedBox(
                              height: Dimensions.screenHeight / 2.6,
                              width: MediaQuery.of(context).size.width,
                              child: PageView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: sneaker!.imageUrl.length,
                                  controller: pageController,
                                  onPageChanged: (page) {
                                    productNotifier.activePage = page;
                                  },
                                  itemBuilder: (context, indx) {
                                    return Stack(
                                      children: [
                                        Container(
                                          height: Dimensions.screenHeight / 2.6,
                                          width: double.maxFinite,
                                          color: Colors.grey.shade300,
                                          child: CachedNetworkImage(
                                            imageUrl: sneaker.imageUrl[indx],
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Positioned(
                                          right: 20,
                                          top: 67,
                                          child: Consumer<FavoritesNotifire>(
                                            builder:
                                                (ctx, favoritNorifire, child) =>
                                                    GestureDetector(
                                              onTap: () {
                                                if (favoritNorifire.ide
                                                    .contains(widget.id)) {
                                                  Navigator.push(
                                                      ctx,
                                                      MaterialPageRoute(
                                                          builder: (ctx) =>
                                                              const Favorites()));
                                                } else {
                                                  favoritNorifire.createFav({
                                                    "id": sneaker.id,
                                                    "name": sneaker.name,
                                                    "category":
                                                        sneaker.category,
                                                    "price": sneaker.price,
                                                    "imageUrl":
                                                        sneaker.imageUrl[0],
                                                  });
                                                  setState(() {});
                                                }
                                              },
                                              child: favoritNorifire.ide
                                                      .contains(sneaker.id)
                                                  ? const Icon(AntDesign.heart)
                                                  : const Icon(
                                                      AntDesign.hearto),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 0,
                                            right: 0,
                                            left: 0,
                                            height: Dimensions.screenHeight/15.62,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: List<Widget>.generate(
                                                sneaker.imageUrl.length,
                                                (index) => Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 4),
                                                  child: CircleAvatar(
                                                    radius: 5,
                                                    backgroundColor:
                                                        productNotifier
                                                                    .activePage !=
                                                                index
                                                            ? Colors.grey
                                                            : Colors.black,
                                                  ),
                                                ),
                                              ),
                                            )),
                                      ],
                                    );
                                  }),
                            ),
                            Positioned(
                                bottom: Dimensions.height30,
                                child: ClipRRect(
                                  borderRadius:  BorderRadius.only(
                                    topLeft: Radius.circular(Dimensions.radius30),
                                    topRight: Radius.circular(Dimensions.radius30),
                                  ),
                                  child: Container(
                                    height: Dimensions.screenHeight/1.56,
                                    width: Dimensions.screenWidth,
                                    color: Colors.white,
                                    child: Padding(
                                      padding:  EdgeInsets.all(Dimensions.radius15),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              sneaker.name,
                                              style: appstyle(40, Colors.black,
                                                  FontWeight.bold),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  sneaker.category,
                                                  style: appstyle(
                                                      20,
                                                      Colors.grey,
                                                      FontWeight.w500),
                                                ),
                                                 SizedBox(
                                                  width: Dimensions.width20,
                                                ),
                                                RatingBar.builder(
                                                  initialRating: 4,
                                                  onRatingUpdate: (rating) {},
                                                  minRating: 1,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  itemSize: 22,
                                                  itemPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 1),
                                                  itemBuilder: (contex, _) =>
                                                      Icon(
                                                    Icons.star,
                                                    size: 18,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: Dimensions.height20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ReusableText(
                                                  text: "\$${sneaker.price}",
                                                  style: appstyle(
                                                      26,
                                                      Colors.black,
                                                      FontWeight.w600),
                                                ),
                                                Row(
                                                  children: [
                                                    ReusableText(
                                                      text: "Colors",
                                                      style: appstyle(
                                                          18,
                                                          Colors.black,
                                                          FontWeight.w500),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    CircleAvatar(
                                                      radius: 7,
                                                      backgroundColor:
                                                          Colors.black,
                                                    ),
                                                    CircleAvatar(
                                                      radius: 7,
                                                      backgroundColor:
                                                          Colors.red,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: Dimensions.height20,
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    ReusableText(
                                                      text: "Select Size",
                                                      style: appstyle(
                                                          20,
                                                          Colors.black,
                                                          FontWeight.w600),
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    ReusableText(
                                                      text: "View Size guide",
                                                      style: appstyle(
                                                          20,
                                                          Colors.black,
                                                          FontWeight.w600),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: Dimensions.height20,
                                                ),
                                                SizedBox(
                                                  height: Dimensions.height30+Dimensions.height10,
                                                  child: ListView.builder(
                                                    itemCount: productNotifier
                                                        .shoeSize.length,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    padding: EdgeInsets.zero,
                                                    itemBuilder: (ctx, index) {
                                                      final size =
                                                          productNotifier
                                                              .shoeSize[index];
                                                      return Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 8),
                                                        child: ChoiceChip(
                                                          selected: size[
                                                              'isSelected'],
                                                          shape:
                                                              RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          Dimensions.screenHeight/13.01),
                                                                  side:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .black,
                                                                    width: 1,
                                                                    style: BorderStyle
                                                                        .solid,
                                                                  )),
                                                          disabledColor:
                                                              Colors.white,
                                                          selectedColor:
                                                              Colors.black38,
                                                          onSelected:
                                                              (newState) {
                                                            if (productNotifier
                                                                .sizes
                                                                .contains(size[
                                                                    'size'])) {
                                                              productNotifier
                                                                  .sizes
                                                                  .remove(size[
                                                                      'size']);
                                                            } else {
                                                              productNotifier
                                                                  .sizes
                                                                  .add(size[
                                                                      'size']);
                                                            }
                                                            productNotifier
                                                                .toggleCheck(
                                                                    index);
                                                          },
                                                          label: Text(
                                                            size['size'],
                                                            style: appstyle(
                                                                18,
                                                                size['isSelected']
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                                FontWeight
                                                                    .w500),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: Dimensions.height10,
                                            ),
                                            Divider(
                                              indent: Dimensions.width10,
                                              endIndent: Dimensions.width10,
                                              color: Colors.black,
                                            ),
                                            SizedBox(
                                              height: Dimensions.height10,
                                            ),
                                            SizedBox(
                                              width:
                                                  Dimensions.screenWidth / 0.8,
                                              child: Text(
                                                sneaker.title,
                                                style: appstyle(
                                                    20,
                                                    Colors.black,
                                                    FontWeight.w700),
                                              ),
                                            ),
                                             SizedBox(
                                              height: Dimensions.height10,
                                            ),
                                            Text(
                                              sneaker.description,
                                              textAlign: TextAlign.justify,
                                              maxLines: 4,
                                              style: appstyle(14, Colors.black,
                                                  FontWeight.normal),
                                            ),
                                            SizedBox(
                                              height: Dimensions.height10,
                                            ),
                                            Align(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                padding: EdgeInsets.all(8),
                                                child: CheckOutButton(
                                                  onTap: () async {
                                                    Provider.of<CartProvider>(
                                                            context,
                                                            listen: false)
                                                        .createCart({
                                                      'id': sneaker.id,
                                                      'name': sneaker.name,
                                                      'category':
                                                          sneaker.category,
                                                      "size":
                                                          productNotifier.sizes,
                                                      'imageUrl':
                                                          sneaker.imageUrl[0],
                                                      'price': sneaker.price,
                                                      "qtr": 1,
                                                    });
                                                    Navigator.pop(context);
                                                  },
                                                  lable: "Add to Cart",
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
                );}
                },
              );

          }),
    );
  }
}
