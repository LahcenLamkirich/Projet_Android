import 'dart:io';
import 'package:e_afferai/main.dart';
import 'package:e_afferai/models/seller_model.dart';
import 'package:e_afferai/ui/Model/Product.dart';
import 'package:e_afferai/ui/Model/Sellerr.dart';
import 'package:e_afferai/ui/pages/home_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'login_page.dart';

class addProduct extends StatefulWidget {

  addProduct({Key? key, required this.seller}) : super(key: key);

  Sellerr seller;

  @override
  State<addProduct> createState() => _addProductState();
}

class _addProductState extends State<addProduct> {

  static String? selectedValueFuel = null;
  static String? selectedValueType = null;

  static File? _file ;

  Future pickerCamera() async {
    final myFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _file = File(myFile!.path);
    });
  }

  final _dropdownFormKey = GlobalKey<FormState>();

  List<DropdownMenuItem<String>> menuItemsFuel = [
    DropdownMenuItem(child: Text("Essence"),value: "Essence"),
    DropdownMenuItem(child: Text("Gazoil"),value: "Gazoil"),
    DropdownMenuItem(child: Text("Electrique"),value: "Electrique"),
  ];

  final _dropdownFormKeyType = GlobalKey<FormState>();

  List<DropdownMenuItem<String>> menuItemsType = [
    DropdownMenuItem(child: Text("New"),value: "New"),
    DropdownMenuItem(child: Text("Old"),value: "Old"),
  ];

  // ============================ Text Editiing Form ===========================//
  TextEditingController productNameController = TextEditingController() ;
  TextEditingController productDescController = TextEditingController() ;
  TextEditingController productPriceController = TextEditingController() ;
  TextEditingController productQuantityController = TextEditingController() ;
  // ================================ List of Products Added ==========================//
  static List<Product> listProducts = [] ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.1),
            GestureDetector(
                child: const Text("Home Page"),
                onTap:(){
                  HomePage(productsAdded:listProducts);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(prod: listProducts)));
                }),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
              Material(
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.all(10),
                   child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text("Product / add "),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: FlatButton.icon(
                              color: Color(0xfff96d21),
                              onPressed: (){

                                print("the seller is : " + widget.seller.username);
                                Sellerr newOneSeller = Sellerr(
                                    widget.seller.username,
                                    widget.seller.city,
                                    widget.seller.phoneNumber
                                );

                                Product newProduct = Product(_file, productNameController.text,
                                                              double.parse(productPriceController.text),
                                                              int.parse(productQuantityController.text),
                                                              productDescController.text,
                                                              newOneSeller);
                                listProducts.add(newProduct);
                                HomePage(productsAdded:listProducts);
                                Alert(
                                  context: context,
                                  type: AlertType.success,
                                  title: "Product Added Succesfully !",
                                  buttons: [DialogButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text(
                                      "DONE !",
                                      style: TextStyle(color: Colors.white, fontSize: 20),
                                    )
                                  )
                              ]
                                ).show();

                                productNameController.clear();
                                productDescController.clear();
                                productPriceController.clear();
                                productQuantityController.clear();
                              },

                              icon: const Icon(
                                Icons.save,
                                color: Colors.white
                              ),

                              label: Container(
                                margin: const EdgeInsets.all(6),
                                child: const Text(
                                  "Save",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white
                                  ),
                                ),
                              )
                          ),
                        )
                      ],
                    )
                ),
              ),
              SizedBox(height: 15,),
              GestureDetector(
                child: Icon(Icons.arrow_circle_left_rounded, size: 40,color: Colors.deepOrange,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(productsAdded: listProducts)));
                },
              ),

              /***********************/
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                        // child: _file == null ? Image.asset('assets/icon1.jpg', height: 180, width: 180) : Image.file(_file!, height: 180, width: 180),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 90.0,
                          backgroundImage: _file == null
                              ? AssetImage("assets/roue.jpg") as ImageProvider
                              : FileImage(File(_file!.path)) as ImageProvider,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 8, 0),
                            child: Center(child: Text('Part Picture')),
                          ),
                          Center(
                              child: IconButton(
                                  onPressed: pickerCamera,
                                  icon: const Icon(
                                      Icons.add_a_photo_outlined,
                                      size: 36,
                                      color: Color(0xff93B8EF)
                                  )
                              )
                          ),
                        ],
                      ),
                    ],
                  ),

                SizedBox(height: 20,),
                // Here we Start the Forms :
               Container(
                padding: EdgeInsets.symmetric(horizontal: 14),
                width: MediaQuery.of(context).size.width,
                child: Form(
                  child: TextFormField(
                    controller: productNameController,
                    onChanged: (val){},
                    decoration: InputDecoration(
                        hintText: "Product Name",
                        labelText: "Product Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(color: Color(0xfff96d21)),
                        )
                    ),
                  ),
                ),
              ),

              /************************************************************************/

              const SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14),
                width: MediaQuery.of(context).size.width,
                child: Form(
                  child: TextFormField(
                    controller: productDescController,
                    onChanged: (val){},
                    decoration: InputDecoration(
                        hintText: "Product Description",
                        labelText: "Product Description",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(color: Color(0xfff96d21)),
                        )
                    ),
                  ),
                ),
              ),
                  const SizedBox(
                    height: 10,
                  ),
                // The Drop Down :
                 Container(
                   color: Colors.white.withOpacity(0.1),
                   padding: EdgeInsets.symmetric(horizontal: 14),
                   width: MediaQuery.of(context).size.width,
                   child: Form(
                      key: _dropdownFormKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DropdownButtonFormField(
                              decoration: InputDecoration(
                                hintText: "Select Type of the Fuel",
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              validator: (value) => value == null ? "Select Type of Fuel" : null,
                              dropdownColor: Colors.white,
                              value: selectedValueFuel,
                              onChanged: (String? val) {
                                selectedValueFuel = val ;
                              },
                              items: menuItemsFuel
                          ),
                        ],
                      )
                   ),
                 ),
                /* End of the first DropDown */
                /* The start of the second dropDown */
                SizedBox(height: 10,),
                  Container(
                    color: Colors.white.withOpacity(0.1),
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    width: MediaQuery.of(context).size.width,
                    child: Form(
                        key: _dropdownFormKeyType,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DropdownButtonFormField(
                                decoration: InputDecoration(
                                  hintText: "Select Type of the car",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                validator: (value) => value == null ? "Select Type of the car" : null,
                                dropdownColor: Colors.white,
                                value: selectedValueType,
                                onChanged: (String? val) {
                                  selectedValueType = val ;
                                },
                                items: menuItemsType
                            ),
                          ],
                        )
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    width: MediaQuery.of(context).size.width,
                    child: Form(
                      child: TextFormField(
                        controller: productPriceController,
                        keyboardType: TextInputType.number,
                        onChanged: (val){},
                        decoration: InputDecoration(
                            hintText: "Price",
                            labelText: "Price",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(color: Color(0xfff96d21)),
                            )
                        ),
                      ),
                    ),
                  ),
              /* The Quantity is here */
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14),
                width: MediaQuery.of(context).size.width,
                child: Form(
                  child: TextFormField(
                    controller: productQuantityController,
                    keyboardType: TextInputType.number,
                    onChanged: (val){},
                    decoration: InputDecoration(
                        hintText: "Quantity",
                        labelText: "Quantity",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(color: Color(0xfff96d21)),
                        )
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
            ],
        ),
      ),
    );
  }
}


