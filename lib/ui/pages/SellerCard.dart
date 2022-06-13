import 'package:flutter/material.dart';

class SellerCard extends StatelessWidget {
  SellerCard({Key? key, required this.username,
    required this.city,
    required this.phoneNumber
  }) : super(key: key);

  String username ;
  String city ;
  String phoneNumber ;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
      ),
      child:Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 12,),
            const Text(
              "The Infos of the seller ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12,),
            Text(
              username,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12,),
            Text(
              city,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12,),
            Text(
              phoneNumber,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12,),
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
            },
                child: Text("Close !")
            )
          ],
        ),
      ) ,
    );
  }
}
