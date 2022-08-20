import 'package:fire3_application_1/Data/Router.dart';
import 'package:fire3_application_1/Provider/firestoreProvider.dart';
import 'package:fire3_application_1/Screens/Product/NewProduct.dart';
import 'package:fire3_application_1/Screens/Product/all_product.dart';
import 'package:fire3_application_1/Screens/Category/AddNewCategory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Product/NewProduct.dart';
import 'Categorywidget.dart';

class CategoryScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  floatingActionButton: home(),
      body: Consumer<FireStoreProvider>(
        builder: (context,provider,x) {
      
          return 
              provider.categories==null?
              Center(child: CircularProgressIndicator(),):
          ListView.builder(
            itemCount:  provider.categories.length,
            itemBuilder:(context,index){
              return InkWell(
              onTap: (){
                provider.getAllProductsa(provider.categories[index].catId!);
                AppRouter.NavigateToWidget(
                  ProductScreen(provider.categories[index].catId!));

              },
                child: CategoeyWidget(provider.categories[index])
                );
            },
          );
        }
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          AppRouter.NavigateToWidget(home());
        },
        label: const Text('Add new category'),
       // icon: const Icon(Icons.thumb_up),
        backgroundColor: Color.fromARGB(255, 227, 159, 182),
      ),
    
    );
  }
}