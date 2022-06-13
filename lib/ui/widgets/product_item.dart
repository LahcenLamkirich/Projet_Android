import 'dart:io';

import 'package:e_afferai/main.dart';
import 'package:e_afferai/ui/Model/Product.dart';
import 'package:e_afferai/ui/pages/wish_list.dart';
import 'package:flutter/material.dart';
import '../../models/part_model.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
class ProductCard extends StatelessWidget {
  ProductCard({Key? key, required this.product}) : super(key: key);

  static List<Product> favProducts = [] ;

  final Product product ;
  late List<Part> parts = [];

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        width: 400,
        height: 350,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 5,spreadRadius: 2)],
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    print("The Like button has been clicked !!");
                    favProducts.add(product);
                    Alert(
                        context: context,
                        type: AlertType.success,
                        title: "Product Added To wish list !",
                        buttons: [
                          DialogButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                "DONE !",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              )
                          )
                        ]
                    ).show();
                    // MyHomePage();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => wishList(favoriteList: favProducts,)));
                  },
                  child: const Icon(Icons.favorite),
                ),

                // GestureDetector(
                //     onTap: (){
                //       print("The delete Button has been clicked !");
                //     },
                //     child: Icon(Icons.delete_forever_rounded),
                // ),
                ],
            ),

            Container(
              height: 170,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: product.imageUrl == null
                      ? AssetImage("assets/roue.jpg") as ImageProvider
                      : FileImage(File(product.imageUrl!.path)) as ImageProvider,
                  )),
            ),
            Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    product.title.toString(),
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        product.price.toString(),
                        style:
                            TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                      ),
                      const Text(
                        " DH",
                        style: TextStyle(
                            color: Color(0xFFf96d21),
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),

                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        product.quantity.toString(),
                        style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                      ),
                      const Text(
                        " Pieces",
                        style: TextStyle(
                            color: Color(0xFFf96d21),
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
              ],
            )
          ),
          ],
        ));
  }
}
