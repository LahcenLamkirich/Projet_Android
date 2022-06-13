import 'package:e_afferai/ui/Model/Sellerr.dart';
import 'package:e_afferai/ui/pages/seller_page.dart';
import 'package:flutter/material.dart';

import 'Animation/FadeAnimation.dart';


class RegisterSeller extends StatelessWidget {
  RegisterSeller({Key? key}) : super(key: key);

  // =========================== Text Editing Form ======================//
  TextEditingController usernameController = TextEditingController() ;
  TextEditingController cityController = TextEditingController() ;
  TextEditingController phoneNumberController = TextEditingController();
  // ============================= Text Editing Form ======================//
  Sellerr seller = Sellerr("","","");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/background.png'),
                          fit: BoxFit.fill
                      )
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: FadeAnimation(1, Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/light-1.png')
                              )
                          ),
                        )),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(1.3, Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/light-2.png')
                              )
                          ),
                        )),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(1.5, Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/clock.png')
                              )
                          ),
                        )),
                      ),
                      Positioned(
                        child: FadeAnimation(1.6, Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Center(
                            child: Text("INFOS", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                          ),
                        )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(1.8, Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10)
                              )
                            ]
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[100]!))
                              ),
                              child: TextField(
                                controller: usernameController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Username",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: cityController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "City",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                controller: phoneNumberController,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Phone Number",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                      const SizedBox(height: 20,),
                      FadeAnimation(2, Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.orange
                        ),
                        child: Center(
                          child: SizedBox(
                            width: 350,
                            height: 200,
                            child: ElevatedButton(
                              onPressed: () {
                                print("The username is :" + usernameController.text);
                                print("The city is : " + cityController.text) ;
                                print("The phone Number is : " + phoneNumberController.text);
                                Sellerr newSeller = Sellerr(usernameController.text, cityController.text, phoneNumberController.text);

                                Navigator.push(context, MaterialPageRoute(builder: (context) => SellerPage(sellerr:newSeller)));
                              },
                              child: const Text(
                                  "Go On !",
                                  style: TextStyle(
                                      color: Colors.white, fontWeight: FontWeight.bold)
                              ),
                            ),
                          )

                        ),
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
