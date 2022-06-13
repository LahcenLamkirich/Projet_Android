import 'dart:math';

import 'package:e_afferai/ui/Model/Product.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({Key? key, required this.products, required this.productLength}) : super(key: key);

  final List<Product> products ;
  final int productLength ;

  TextEditingController titleProd = TextEditingController() ;

  List<Product> searchedProduct = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: TextField(
                          controller: titleProd,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search Product"),
                        )),
                    IconButton(
                      onPressed: () {

                      },
                      icon: Icon(Icons.search_outlined),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    spreadRadius: 4,
                    blurStyle: BlurStyle.normal,
                  )
                ],
                borderRadius: BorderRadius.circular(10)),
            child: IconButton(
              onPressed: (){},
              icon: Icon(Icons.tune),
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
