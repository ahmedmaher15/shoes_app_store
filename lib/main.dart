import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app_store/controllers/MyProvider.dart';
import 'package:shoes_app_store/controllers/cart_provider.dart';
import 'package:shoes_app_store/controllers/favorit_provider.dart';
import 'package:shoes_app_store/controllers/product_Provider.dart';
import 'package:shoes_app_store/screens/mainScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await  Hive.initFlutter();
  await Hive.openBox("cart_box");
  await Hive.openBox("fav_box");
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (contex)=>MyProvider()),
        ChangeNotifierProvider(create: (contex)=>ProductNotifire()),
        ChangeNotifierProvider(create: (contex)=>FavoritesNotifire()),
        ChangeNotifierProvider(create: (contex)=>CartProvider()),

      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainScreen(),
    );
  }
}
