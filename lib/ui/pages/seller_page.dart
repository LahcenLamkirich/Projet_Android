import 'dart:io';

import 'package:e_afferai/ui/Model/Sellerr.dart';
import 'package:e_afferai/ui/pages/add_product.dart';
import 'package:e_afferai/ui/pages/wish_list.dart';
import 'package:flutter/material.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'home_page.dart';


class SellerPage extends StatefulWidget {
  SellerPage({required this.sellerr});

  Sellerr sellerr ;

  @override
  State<SellerPage> createState() => _SellerPageState(sellerr);
}

class _SellerPageState extends State<SellerPage> {

  _SellerPageState(this.sellerr);
  Sellerr sellerr ;

  static int pageIndex = 0;
  List<Widget> pages=[];


  @override
  void initState() {
    pages = [
      addProduct(seller: sellerr),
      Container(
        child: Text("This is the about page of the seller"),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        bottomNavigationBar: CircleNavBar(
          activeIcons: const [
            Icon(Icons.add_box_rounded, color: Color(0xfff96d21)),
            Icon(Icons.person, color: Color(0xfff96d21)),
          ],
          inactiveIcons: const [
            Text(
              "Home",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              "About",
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
