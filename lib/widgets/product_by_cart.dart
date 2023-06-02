import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app_store/controllers/product_Provider.dart';
import 'package:shoes_app_store/screens/homepage.dart';
import 'package:shoes_app_store/utils/dimensions.dart';
import 'package:shoes_app_store/widgets/LatestShoes.dart';
import 'package:shoes_app_store/widgets/custom_spacer.dart';
import '../appstyle.dart';
import 'category_btn.dart';
class ProdactBycat extends StatefulWidget {
  const ProdactBycat({Key? key, required this.tapIndex}) : super(key: key);
  final int tapIndex;

  @override
  State<ProdactBycat> createState() => _ProdactBycatState();
}
List<String>  brand=[
      "assets/images/adidas.png",
      "assets/images/gucci.png",
      "assets/images/jordan.png",
      "assets/images/nike.png",
];
class _ProdactBycatState extends State<ProdactBycat>
    with TickerProviderStateMixin {
  late final TabController controller = TabController(length: 3, vsync: this);
  @override
  void initState() {
    super.initState();
    controller.animateTo(widget.tapIndex, curve: Curves.easeIn);
  }
  @override
  Widget build(BuildContext context) {
    final productNotifire=Provider.of<ProductNotifire>(context);
    productNotifire.getMale();
    productNotifire.getFemale();
    productNotifire.getKids();
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffe2e2e2),
      body: SizedBox(
        height: height,
        child: Stack(
          children: [
            Container(
              padding:  EdgeInsets.fromLTRB(Dimensions.width10, Dimensions.screenHeight/31.24, 0, 0),
              height: Dimensions.screenHeight/2.40,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/top_image.png"),
                    fit: BoxFit.fill),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.fromLTRB( Dimensions.screenWidth/20.16, Dimensions.screenHeight/35.08, Dimensions.screenWidth/20.16, Dimensions.screenWidth/43.38),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context,MaterialPageRoute(builder:(ctx)=> const HomePage()));
                          },
                          child: const Icon(
                            AntDesign.close,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            filter();
                          },
                          child: const Icon(
                            FontAwesome.sliders,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  TabBar(
                      padding: EdgeInsets.zero,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.transparent,
                      controller: controller,
                      isScrollable: true,
                      labelColor: Colors.white,
                      labelStyle: appstyle(Dimensions.height30, Colors.white, FontWeight.bold),
                      unselectedLabelColor: Colors.grey.withOpacity(0.3),
                      tabs: const [
                        Tab(
                          text: "Men Shoes",
                        ),
                        Tab(
                          text: "Woman Shoes",
                        ),
                        Tab(
                          text: "Kids Shoes",
                        ),
                      ]),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Dimensions.screenHeight/5.6, left: Dimensions.width15, right: Dimensions.width15),
              child: ClipRRect(
                borderRadius:  BorderRadius.all(Radius.circular(19)),
                child: TabBarView(controller: controller, children: [
                  LatestShoes(male:productNotifire.male, height: height),
                  LatestShoes(male: productNotifire.female, height: height),
                  LatestShoes(male:productNotifire.kids, height: height),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> filter() {
    double _value = 100;
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.white54,
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          height: Dimensions.screenHeight/1.3,
          decoration:  BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.screenHeight/51.24), topRight: Radius.circular(Dimensions.screenHeight/31.24)),
          ),
          child: Column(
              children: [
                 SizedBox(
                  height: Dimensions.height5,
                ),
                Container(
                  height: Dimensions.height5,
                  width: Dimensions.width45*2 ,
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(Dimensions.height30)),
                    color: Colors.black38,
                  ),
                ),
                SizedBox(
                  height:Dimensions.screenHeight/1.3-Dimensions.height5-Dimensions.height5,
                  child: Column(
                    children: [
                      const CustomSpacer(),
                      Text(
                        "Filter",
                        style: appstyle(Dimensions.height45, Colors.black, FontWeight.bold),
                      ),
                      const CustomSpacer(),
                      Text(
                        "Gender",
                        style: appstyle(Dimensions.height30, Colors.black, FontWeight.bold),
                      ),
                       SizedBox(
                        height: Dimensions.height5,
                      ),
                       FittedBox(
                        child: Row(
                          children: [
                            CategoryBtn(
                              width: Dimensions.width45*2,
                              buttonClr: Colors.black,
                              lable: "Men",
                            ),
                            CategoryBtn(
                              width: Dimensions.height20,
                              buttonClr: Colors.grey,
                              lable: "Women",
                            ),
                            CategoryBtn(
                              width: Dimensions.screenHeight/6,
                              buttonClr: Colors.grey,
                              lable: "Kids",
                            ),
                          ],
                        ),
                      ),
                      const CustomSpacer(),
                      FittedBox(
                        child: Text(
                          "Category",
                          style: appstyle(Dimensions.font20, Colors.black, FontWeight.w600),
                        ),
                      ),
                      const CustomSpacer(),
                      FittedBox(
                        child:  Row(
                          children: [
                            CategoryBtn(
                              width: Dimensions.width45*2,
                              buttonClr: Colors.black,
                              lable: "Shoes",
                            ),
                            CategoryBtn(
                              width: Dimensions.height20,
                              buttonClr: Colors.grey,
                              lable: "Apparrels",
                            ),
                            CategoryBtn(
                              width: Dimensions.screenHeight/6,
                              buttonClr: Colors.grey,
                              lable: "Accessories",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height5,
                      ),
                      Text(
                        "Price",
                        style: appstyle(20, Colors.black, FontWeight.bold),
                      ),
                      const CustomSpacer(),
                      Slider(
                        value: _value,
                        onChanged: (double val) {},
                        activeColor: Colors.black,
                        inactiveColor: Colors.grey,
                        thumbColor: Colors.black,
                        max: 500,
                        divisions: 50,
                        secondaryTrackValue: 200,
                        label: _value.toString(),
                      ),
                      const CustomSpacer(),
                      Text(
                        "Brands",
                        style: appstyle(Dimensions.font20, Colors.black, FontWeight.bold),
                      ),
                      const CustomSpacer(),
                      FittedBox(
                        child: Container(
                          padding:  EdgeInsets.all(Dimensions.height10),
                          height: Dimensions.screenHeight/6.67,
                          width: Dimensions.screenWidth,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:brand.length,
                              itemBuilder: (context, index) => Padding(
                                    padding:  EdgeInsets.all(Dimensions.height10),
                                    child: Container(

                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius:  BorderRadius.all(Radius.circular(Dimensions.radius15)),
                                      ),
                                      child: Image.asset(brand[index],height: Dimensions.screenHeight/10.62,width: Dimensions.screenWidth/4.76,color: Colors.black),
                                    ),
                                  )),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),

        ),
      ),
    );
  }
}
