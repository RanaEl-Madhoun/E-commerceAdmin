
import 'package:fire3_application_1/Data/Router.dart';
import 'package:fire3_application_1/Provider/firestoreProvider.dart';
import 'package:fire3_application_1/Screens/Product/NewProduct.dart';
import 'package:fire3_application_1/Screens/Product/productwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Category/Categorywidget.dart';

class ProductScreen extends StatelessWidget{
  String catId;
  ProductScreen(this.catId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  appBar: AppBar(title: Text('category'),),
      body: Consumer<FireStoreProvider>(
        builder: (context,provider,x) {
      
          return 
              provider.products.isEmpty?
              
              Center(child: CircularProgressIndicator(),):
          GridView.builder(
            itemCount:  provider.products.length,
            itemBuilder:(context,index){
              return InkWell(
                onTap: (){

              },
                child: ProductWidget(provider.products[index],catId)
                );
            },  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 2
               ),
          );
        },

      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          AppRouter.NavigateToWidget(NewProduct(catId));
        },
        label: const Text('Add new Prpduct'),
       // icon: const Icon(Icons.thumb_up),
        backgroundColor: Color.fromARGB(255, 227, 159, 182),
      ),
    );
  }
}