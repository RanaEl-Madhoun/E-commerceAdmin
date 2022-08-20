import 'package:fire3_application_1/Data/Router.dart';
import 'package:fire3_application_1/Provider/firestoreProvider.dart';
import 'package:fire3_application_1/User/Clickedproduct.dart';
import 'package:fire3_application_1/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class buildCard extends StatelessWidget {
  Product product;
  
  buildCard(this.product);
  @override
  Widget build(BuildContext context) {
    return Consumer<FireStoreProvider>(
      builder: (context, value, child) => Padding(
          padding:
              EdgeInsets.only(top: 10.0, bottom: 20.0, left: 9.0, right: 5.0),
          child: InkWell(
              onTap: () {
                AppRouter.NavigateWithReplacemtnToWidget(ClickedProduct(product));
              },
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 3.0,
                            blurRadius: 5.0)
                      ],
                      color: Colors.white),
                  child: Column(children: [
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                    ),
                    Column(
                        //tag: const AssetImage('assets/photos/k6.png'),
                        children: [
                          Container(
                              height: 100.0,
                              width: 150,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(product.image),
                                      fit: BoxFit.cover))),
                          const SizedBox(height: 20.0),
                        
                         
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  color: Color(0xFFEBEBEB), height: 1.0)),
                                   Padding(
                              padding: EdgeInsets.only(left: 5.0, right: 5.0),
                              
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                     
                                     Text(product.name,
                              style: const TextStyle(
                                  color: Color(0xFF575E67),
                                  fontFamily: 'Varela',
                                  fontSize: 14.0)),
                                    
                                    
                                  ])),
                                   Padding(
                              padding: EdgeInsets.only(left: 5.0, right: 5.0),
                            
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                       Text('\$'+product.price.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Varela',
                                  fontSize: 16.0)),
                                    
                                    
                                  ])),
                         
                        ])
                  ])))),
    );
  }
}