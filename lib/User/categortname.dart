import 'package:fire3_application_1/Data/Router.dart';
import 'package:fire3_application_1/models/Category.dart';
import 'package:flutter/material.dart';

import '../Screens/Product/all_product.dart';

class Namedcategori extends StatelessWidget{
  Category category;
  Namedcategori( this.category);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return OutlinedButton(onPressed: () {
    // //  AppRouter.NavigateWithReplacemtnToWidget(  ProductScreen(category.catId!));
    // },child: Text(category.name));
 return Container(
 // width: 100,
         child: Center(child: Padding(
           padding: const EdgeInsets.only(left:4,bottom:2.0,top: 2,),
           child: Text(category.name,style: TextStyle(fontWeight: FontWeight.w500),),
         )),
          // width:150 ,
          // height: 50,
          decoration: BoxDecoration( color: Colors.white,
          border:Border.all(color: Color.fromARGB(255, 185, 161, 189),width: 2) ,
            borderRadius: BorderRadius.circular(35)),
       
       );
     
  }

}

void main(List<String> args) {
 // runApp(MaterialApp(home: Namedcategori(),));
}