import 'dart:io';

import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:e_afferai/blocs/parts_bloc.dart';
import 'package:e_afferai/ui/Model/Product.dart';
import 'package:e_afferai/ui/Model/Sellerr.dart';
import 'package:e_afferai/ui/pages/home_page.dart';
import 'package:e_afferai/ui/pages/login_page.dart';
import 'package:e_afferai/ui/pages/registerSeller.dart';
import 'package:e_afferai/ui/pages/seller_page.dart';
import 'package:e_afferai/ui/pages/wish_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Brand Bold",
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(),
      initialRoute: "loginPage",
      routes: {
        'loginPage': (context) => LoginPage(prod: []),
        'homePage': (context) => MyHomePage(),
        'sellerPage': (context) => SellerPage(sellerr: Sellerr("", "","")),
        'registerSeller': (context) => RegisterSeller(),
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  PartsBloc _newsBloc = new PartsBloc();
  int pageIndex = 0;

  // here i have to pass the same list i pass from the product_items Widget :
  // List<Product> test = [new Product(File("/assets/roue.jpg"), "roue", 10.4,5)] ;

  // @override
  // void initState() {
  //   super.initState();
  //   List<Product> test = widget.favProdisHere ;
  //   print("The length of the list is : " + widget.favProdisHere.length.toString());
  // }
  List<Widget> pages = [

    HomePage(
      productsAdded:[
      Product(File("/assets/led.jpg"), "LED", 100.4,5,"description of the product", new Sellerr("Lahcen Lamkirich", "Marrakech", "0777208954")),
    ]),
    // here i have to pass the same list i pass from the product_items Widget :
    wishList(favoriteList:[
      new Product(File("assets/led.jpg"), "LED",100.89,5, "description of the product", new Sellerr("Lahcen Lamkirich", "Marrakech", "0777208954")),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
        bottomNavigationBar: CircleNavBar(
          activeIcons: const [
            Icon(Icons.person, color: Color(0xfff96d21)),
            Icon(Icons.home, color: Color(0xfff96d21)),
          ],
          inactiveIcons: const [
            Text(
              "Home",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              "WishList",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
          color: Colors.white,
          height: 60,
          circleWidth: 60,
          initIndex: pageIndex,
          onChanged: (v) {
            setState(() {
              pageIndex = v;
            });
          },
          // tabCurve: ,
          cornerRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          shadowColor: Colors.black26,
          elevation: 10,
        ),
        body: pages[pageIndex]
        );
  }
}
