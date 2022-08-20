import 'package:fire3_application_1/Data/Router.dart';
import 'package:fire3_application_1/Provider/firestoreProvider.dart';
import 'package:fire3_application_1/Screens/Category/updateCat.dart';
import 'package:fire3_application_1/Screens/Product/updateProduct.dart';
import 'package:fire3_application_1/Ui/sign.dart';
import 'package:fire3_application_1/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../models/Category.dart';

class ProductWidget extends StatelessWidget{
  Product product;
  String catId;
  
  ProductWidget(this.product,this.catId);
  @override
  Widget build(BuildContext context) {
    return 
      
         
          
            Padding(
              padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
              child: Container(
                child:
                Column(
                    children: [
                      
                   Container(
                    height: 100,
          
                  width:MediaQuery.of(context).size.width ,
                    child: Image.network(product.image,
                    
                    fit: BoxFit.cover,),
          ),
                       
                      SizedBox(height: 5,),
                      Row(children: [ Text(product.name,style: GoogleFonts.openSans(),),],)
                      
                      
                    , Row(children: [
                      OutlinedButton(onPressed: (){
              Provider.of<FireStoreProvider>(context,listen: false).ProductNameController.text=product.name;
              Provider.of<FireStoreProvider>(context,listen: false).ProductquantityController.text=(product.quantity).toString();
              Provider.of<FireStoreProvider>(context,listen: false).ProductPriceController.text=(product.price).toString();
              Provider.of<FireStoreProvider>(context,listen: false).ProductdescController.text=product.description;
              AppRouter.NavigateToWidget(UpdateProduct(product,catId));
            },
            style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(18.0),
      ),
      side: BorderSide(width: 2, color: Colors.green),
   ),
                       child: Text("Edit",style: TextStyle(color: Colors.black),)
                ),
  //                     OutlinedButton(onPressed: (){
  //                        Provider.of<FireStoreProvider>(context,listen: false).
  //                      ProductNameController.text=product.name;
  //                       Provider.of<FireStoreProvider>(context,listen: false).
  //                      ProductdescController.text=product.description;
  //                       Provider.of<FireStoreProvider>(context,listen: false).
  //                      ProductPriceController.text=(product.price).toString();
  //                       Provider.of<FireStoreProvider>(context,listen: false).
  //                      ProductquantityController.text=(product.quantity).toString();
                       
  //               AppRouter.NavigateToWidget(UpdateProduct(product,catId),);

  //                     },style: OutlinedButton.styleFrom(
  //     shape: RoundedRectangleBorder(
  //        borderRadius: BorderRadius.circular(18.0),
  //     ),
  //     side: BorderSide(width: 2, color: Colors.green),
  //  ),
  //                      child: Text("Edit",style: TextStyle(color: Colors.black),)),
                      Spacer()
                   
                      
                         ,OutlinedButton(onPressed: (){
                        Provider.of<FireStoreProvider>(context,listen: false).
                        deleteProduct(product,catId);
                       }, style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(18.0),
      ),
      side: BorderSide(width: 2, color: Color.fromARGB(255, 230, 156, 177)),
   ),
                       child: Text("Delete",style: TextStyle(color: Colors.black),)
                       )
          
                     ],) 
                    ],
                  ),
                
              
         
      ),
            );
  }

}