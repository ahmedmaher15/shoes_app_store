import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shoes_app_store/appstyle.dart';
import 'package:shoes_app_store/controllers/product_Provider.dart';
import 'package:shoes_app_store/widgets/reusbleText.dart';
import '../utils/dimensions.dart';
import '../widgets/homewidget.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController controller = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    final productNotifire=Provider.of<ProductNotifire>(context);
    productNotifire.getMale();
    productNotifire.getFemale();
    productNotifire.getKids();
    return Scaffold(
      backgroundColor: const Color(0xffe2e2e2),
      body: SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Stack(
            children: [
              Container(
                padding:  EdgeInsets.fromLTRB(Dimensions.width15, Dimensions.height45, 0, 0),
                height: Dimensions.screenHeight/2.4,
                width: Dimensions.screenWidth,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/top_image.png"),
                      fit: BoxFit.fill),
                ),
                child: Container(
                  width: Dimensions.screenHeight/2.08,
                  padding:  EdgeInsets.only(left: 2, bottom: Dimensions.screenHeight/15.62),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                        text:" Shoes Store",
                        style: appstylewithHt(
                            30, Colors.white, 1.2, FontWeight.bold),
                      ),
                      TabBar(
                          padding: EdgeInsets.zero,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: Colors.transparent,
                          controller: controller,
                          isScrollable: true,
                          labelColor: Colors.white,
                          labelStyle: appstyle(24, Colors.white, FontWeight.bold),
                          unselectedLabelColor: Colors.grey.withOpacity(0.3),
                          tabs:const[
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
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: Dimensions.screenHeight/5.03,
                ),
                child: Container(
                  padding: EdgeInsets.only(left: Dimensions.screenHeight/65.08),
                  child: TabBarView(controller: controller, children: [
                    HomeWidget( male:productNotifire.male,  Index: 0,),
                    HomeWidget( male: productNotifire.female,  Index: 1,),
                    HomeWidget( male: productNotifire.kids,  Index: 2,),
                  ]),
                ),
              )
            ],
          ),

      ),
    );
  }
}
