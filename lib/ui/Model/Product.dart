import 'dart:io';
import './Sellerr.dart';

class Product {

   File? imageUrl ;
   String title ;
   double price ;
   int quantity ;
   // ? this variable can be null => without no values :
   String? description ;
   Sellerr? seller ;

   Product(this.imageUrl, this.title, this.price, this.quantity,this.description, this.seller);
}

