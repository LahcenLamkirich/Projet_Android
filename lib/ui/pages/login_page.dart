import 'package:e_afferai/main.dart';
import 'package:e_afferai/ui/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Model/Product.dart';


class LoginPage extends StatefulWidget {
  // La declaration de constructeur is here :
  LoginPage({required this.prod}) ;

  List<Product> prod ;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                    "assets/logo.png",
                    height: 280,
                    width: 300
                ),
              ],
            ),
            const Text("Welcome to the Part Shop 👋 ",
              style: TextStyle(
                fontFamily: "Brand Bold",
                color: Colors.black,
                fontSize: 18,
                // fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 40,),
            Container(
              alignment:Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                onPressed: () {},
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 35, ),
                color: Color(0xfff96d21),
                textColor: Colors.white,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, new MaterialPageRoute(
                        builder: (context) =>
                            HomePage(productsAdded:widget.prod)));
                  },
                  child: Text("Please Click Here as a User ",
                      style: TextStyle(fontSize: 16)),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment:Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                onPressed: () {},
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 35, ),
                color: Color(0xfff96d21),
                textColor: Colors.white,
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamedAndRemoveUntil(context, "registerSeller", (route) => false);
                  },
                  child: Text("Please Click Here as a Seller ",
                      style: TextStyle(fontSize: 16)),
                ),
              ),
            ),
            SizedBox(height: 50,),
            Text('Developed By Lahcen Lamkirich', style: TextStyle(
              fontSize: 17,
            ),),
            SizedBox(height: 12,),
            GestureDetector(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
              },
              child: const Text("2022 © All Rights Deserved ",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  color:Color(0xFF5C5D67),
                  // 668586 EDADC7 5C5D67
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
