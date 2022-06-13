import 'dart:io';

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import '../Model/Product.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../Model/Sellerr.dart';

class wishList extends StatefulWidget {
  wishList({Key? key, required this.favoriteList}) : super(key: key);

  List<Product> favoriteList = [] ;

  @override
  State<wishList> createState() => _wishListState();
}

class _wishListState extends State<wishList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.25),
            const Text("WishList Page"),
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: widget.favoriteList.length,
          itemBuilder:(BuildContext context, int index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GFListTile(
                      margin: EdgeInsets.all(8),
                      onTap: () {
                         showCustomDialog(context, widget.favoriteList[index].imageUrl!,
                          widget.favoriteList[index].title,
                          widget.favoriteList[index].price,
                          widget.favoriteList[index].description!,
                          widget.favoriteList[index].seller!
                        );
                      },
                      color: Colors.white,
                      avatar: Image.file(widget.favoriteList[index].imageUrl!, width: 100, height: 150,),
                      titleText: widget.favoriteList[index].title,
                      subTitleText:widget.favoriteList[index].price.toString(),
                      description: Text(widget.favoriteList[index].description!),
                      icon: GestureDetector(
                          child: Icon(Icons.delete_forever_rounded),
                          onTap: () {
                            setState(() {
                              widget.favoriteList.remove(widget.favoriteList[index]);
                              Alert(
                                context: context,
                                type: AlertType.error,
                                title: "Product Deleted Succesfully !",
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
                            });
                          },
                      )
                  ),
                ],
           );
          }),
    );
  }
}


// here we start the custome dialog *************************************************************/*
// here we start the custome dialog *************************************************************/*
showCustomDialog(BuildContext context, File imageUrl, String title, double price, String description, Sellerr seleer) {
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 300.0,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Image(
                            image: FileImage(File(imageUrl.path)) as ImageProvider,
                            width:200,
                            // fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 10.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              iconSize: 30.0,
                              onPressed: () => Navigator.pop(context),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.search,
                                  size: 30.0,
                                ),
                                IconButton(
                                  icon: Icon(Icons.shopping_bag_outlined),
                                  iconSize: 30.0,
                                  onPressed: (){},
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey[100],
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    description,
                    style: TextStyle(
                        fontSize: 15 ,
                        color: Colors.grey[500]
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    price.toString() + " DH ",
                    style: TextStyle(
                        fontSize: 18 ,
                        color: Colors.grey[600]
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(
                    height: 40,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 60.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.black,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 2),
                                blurRadius: 20.0,
                              )
                            ]),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              // here i will do a pop up:
                              print("The seller of this product is : " + seleer.username +
                                  " -> city : " + seleer.city + " and his phone is : " + seleer.phoneNumber.toString());
                            },
                            child: Text(
                              'Buy Now',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 60.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.black,
                            boxShadow:const [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 2),
                                blurRadius: 20.0,
                              )
                            ]),
                        child: const Center(
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 25.0,
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }
  );
}
