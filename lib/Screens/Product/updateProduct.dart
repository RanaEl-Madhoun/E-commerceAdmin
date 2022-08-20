import 'dart:io';

import 'package:fire3_application_1/Data/Router.dart';
import 'package:fire3_application_1/Data/Storgehelper.dart';
import 'package:fire3_application_1/Provider/AuthProvider.dart';
import 'package:fire3_application_1/Provider/firestoreProvider.dart';
import 'package:fire3_application_1/Screens/Login/components/customTextField.dart';
import 'package:fire3_application_1/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../Category/Categorywidget.dart';
import '../Category/catscreen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class UpdateProduct extends StatelessWidget{
  Product product;
  String catId;
  UpdateProduct(this.product,this.catId);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
 return Scaffold(
  
      body: Consumer<FireStoreProvider>(
        builder: (context,provider,x) {
          return Form(
            key:provider.updateProductkey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  Row(children: [
                    IconButton(onPressed: (){
                      AppRouter.PopRouter();
                    }, 
                    icon: Icon(Icons.arrow_back_ios_new)
                    ),
                    Spacer(),
                    IconButton(onPressed: (){
                     provider.selectedImage=null;
                      provider.ProductNameController.clear();
                      provider.ProductdescController.clear();
                      provider.ProductPriceController.clear();
                      provider.ProductquantityController.clear();
                     
                    }, icon: Icon(Icons.restart_alt))
                    ],
                    ),
              
                 InkWell(
                    onTap: (){
                      provider.selectImage();
                      
                    },
                      child: provider.selectedImage==null?
                      CircleAvatar(radius: 60,
                      backgroundImage:NetworkImage(product.image),
                     // backgroundColor: Color.fromARGB(255, 169, 228, 226)
                     )
                      :
                  CircleAvatar(
                    backgroundImage: FileImage(provider.selectedImage!),
                  ),),
                  SizedBox(height: 20,),
                //   customField(validator: Provider.of<AuthProvider>(context).nullcheck,
                // icon:Icons.category ,
                // controller: provider.categoryNameController,
                // hint: "Category name",
                // obscureText:false,
                // textInputAction: TextInputAction.next,
                // ),
               // TextField(controller: provider.categoryNameController,),
                SizedBox(height: 30,),
                  customField(validator: Provider.of<AuthProvider>(context).nullcheck,
                icon:Icons.production_quantity_limits ,
                controller: provider.ProductNameController,
                hint: "Product name",
                obscureText:false,
                textInputAction: TextInputAction.next,
                ),
                   SizedBox(height: 30,),
                  customField(validator: Provider.of<AuthProvider>(context).nullcheck,
                icon:Icons.production_quantity_limits ,
                controller: provider.ProductdescController,
                hint: "Product description",
                obscureText:false,
                textInputAction: TextInputAction.next,
                ),
                   SizedBox(height: 30,),
                  customField(validator: Provider.of<AuthProvider>(context).nullcheck,
                icon:Icons.production_quantity_limits ,
                controller: provider.ProductPriceController,
                hint: "Product price",
                obscureText:false,
                textInputAction: TextInputAction.next,
                type: TextInputType.number,
                ),
                   SizedBox(height: 30,),
                  customField(validator: Provider.of<AuthProvider>(context).nullcheck,
                icon:Icons.production_quantity_limits ,
                controller: provider.ProductquantityController,
                hint: "Product quantity",
                obscureText:false,
                textInputAction: TextInputAction.next,
                type: TextInputType.number,
                ),
          
                  SizedBox(height: 30,),
                  ElevatedButton(
                    onPressed: (){
                          provider.updateProduct(product,catId);
                          //AppRouter.NavigateToWidget(ProductScreen(catId));
                        }, child:Text('Update Product'),
                        ),
                //     onPressed: (){
                //    // provider.updateProduct(product,catId);
                //     //EasyLoading.showProgress(0.5, status: 'Loading...');
          
                //  //   EasyLoading.showSuccess('Added successfully!');
                  
                //    // provider.selectedImage=null;
                    
          
          
          
                //   }, child:Text('Update product') ,
                 
                
                IconButton(onPressed: (){
                  AppRouter.NavigateWithReplacemtnToWidget(CategoryScreen());
                }, icon: Icon(Icons.arrow_forward_ios))
                ],
              ),
            ),
          );
        }
      )
    );}
    }