import 'package:e_afferai/ui/Model/Product.dart';
import 'package:e_afferai/ui/Model/Sellerr.dart';
import 'package:e_afferai/ui/pages/SellerCard.dart';
import 'package:e_afferai/ui/pages/add_product.dart';
import 'package:e_afferai/ui/pages/login_page.dart';
import 'package:e_afferai/ui/pages/wish_list.dart';
import 'package:e_afferai/ui/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import '../widgets/product_item.dart';
import 'dart:io';


class HomePage extends StatelessWidget {

  HomePage({required this.productsAdded});

  // this is the list that contain the the list i send in the add_product widget :
  List<Product> productsAdded;
  // List<Product> wishList ;

  List<String> imagesUrl = [
      "assets/led.jpg",
      "assets/retroviseur.jpg",
      "assets/roue.jpg"
  ];

  List<double> prices = [
      240.75,
      480.69,
      970.23
  ];

  List<String> titles = [
    "LED",
    "RETROVISEUR",
    "ROUE"
  ];

  // here we create a list of products :
  List<Product> products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            children: [
              GestureDetector(
                child: Icon(Icons.favorite, size: 30,),
                onTap: (){
                  // here i have to pass the wish list :
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => wishList(favoriteList: productsAdded)));
                  //LoginPage(prod: productsAdded)
                },
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.1),
              GestureDetector(
                child: const Text("Home Page"),
                onTap:(){
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => LoginPage(prod: productsAdded)));
                }),
            ],
          ),
          actions: [
            IconButton(
                onPressed: (){
                  showSearch(context: context, delegate: customeShowDelegate(products));
                },
                icon: Icon(Icons.search))
          ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(left: 15, right: 15),
        child: ListView(
          children: [
            SizedBox(height: 10,),
            // ********************************************** Search Widget ***************************************** //
            // SearchWidget(products: products, productLength: products.length,),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 15,top: 10),
                    padding:
                        const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange,width: 2),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: Row(
                      children: const [
                        Icon(Icons.access_time),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Engine",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 15,),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 15,top: 10),
                    padding:
                    const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xfff96d21),width: 2),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: Row(
                      children: const [
                        Icon(Icons.access_time),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Accessorie",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),

          Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.all(5),
                    itemCount:this.productsAdded.length,
                    itemBuilder: (context, index) {
                        print("The index : " + index.toString());
                        Product product = Product(
                              productsAdded[index].imageUrl,
                              productsAdded[index].title,
                              productsAdded[index].price,
                              productsAdded[index].quantity,
                              productsAdded[index].description,
                              productsAdded[index].seller
                        );
                        products.add(product);
                        // Normally we should not show this product but a product who came up in a list :
                      return GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: (){
                          showCustomDialog(context, product.imageUrl!, product.title, product.price, product.description!, product.seller!);
                        },
                        child: ProductCard(product: product),
                      );
                    }),
              ),
          ],
        ),
      ),

    );
  }
}

class customeShowDelegate extends SearchDelegate {

  customeShowDelegate(this.products);
  final List<Product> products ;

  List<Product>? productsSearch ;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
        IconButton(
          onPressed: (){
            query = "";
          },
          icon: Icon(Icons.clear),
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
      return IconButton(
          onPressed: (){
            close(context, null) ;
          } ,
          icon: Icon(Icons.arrow_back)
          );
  }

  @override
  Widget buildResults(BuildContext context) {
      List<Product> matchProduct = [] ;
      productsSearch = products ;
      for(var product in productsSearch!) {
          if(product.title.toLowerCase().contains(query.toLowerCase())){
            matchProduct.add(product);
          }
      }
        return  Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.all(5),
              itemCount:1,
              itemBuilder: (context, index) {
                var result = matchProduct[index] ;
                print("The index : " + index.toString());
                Product product = new Product(result.imageUrl,result.title, result.price,result.quantity, result.description, result.seller );
                print(product.title) ;
                products.add(product);
                // Normally we should not show this product but a product who came up in a list :
                return GestureDetector(
                  onTap: (){
                    showCustomDialog(context, product.imageUrl!, product.title, product.price, product.description!, product.seller!);
                  },
                  child: ProductCard(product: product),
                );
              }),
        );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Product> matchProduct = [] ;
    productsSearch = products ;
    for(var product in productsSearch!) {
      if(product.title.toLowerCase().contains(query.toLowerCase())){
        matchProduct.add(product) ;
      }
    }
    return  Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(5),
          // here is the length of the list :
          itemCount:matchProduct.length,
          itemBuilder: (context, index) {
            var result = matchProduct[index] ;
            print("The index : " + index.toString());
            Product product = new Product(result.imageUrl,result.title, result.price,result.quantity, result.description, result.seller);
            print(product.title) ;
            products.add(product);
            // Normally we should not show this product but a product who came up in a list :
            return GestureDetector(
              onTap: (){
                showCustomDialog(context, product.imageUrl!, product.title, product.price, product.description!, product.seller!);
              },
              child: ProductCard(product: product),
            );
          }),
    );
  }
}


/************************************* Custom Dialog ****************************************************/
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
                              // showSellerDialog(context, seleer.username, seleer.city, seleer.phoneNumber);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SellerCard(username: seleer.username,city: seleer.city, phoneNumber: seleer.phoneNumber,)));
                            },
                            child: const Text(
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
showSellerDialog(BuildContext context, String username, String city, String phoneNumber) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30)
      ),
      child:Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              SizedBox(height: 12,),
              Text(
                "The Infos of the seller ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12,),
              Text(
                "Username ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            Text(
              "City ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Phone Number ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
            }, child: Text("Close !"))
          ],
        ),
      ) ,
    );

}