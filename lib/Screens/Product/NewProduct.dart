import 'dart:io';

import 'package:fire3_application_1/Data/Router.dart';
import 'package:fire3_application_1/Data/Storgehelper.dart';
import 'package:fire3_application_1/Provider/AuthProvider.dart';
import 'package:fire3_application_1/Provider/firestoreProvider.dart';
import 'package:fire3_application_1/Screens/Login/components/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../Category/Categorywidget.dart';
import '../Category/catscreen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class NewProduct extends StatefulWidget{
  String catId;
  
  
  NewProduct(this.catId);

  @override
  State<NewProduct> createState() => _NewProductState();
}

class _NewProductState extends State<NewProduct> {
    late TextEditingController _controller;

  @override
  initState(){
    _controller = TextEditingController();
super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
 return Scaffold(
  // appBar: AppBar(actions: [
  //   IconButton(onPressed: (){
     
  //   }, icon: Icon(Icons.logout))
  // ]),
      body: Consumer<FireStoreProvider>(
        builder: (context,provider,x) {
          return Form(
            key: provider.newproductkey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(25),
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
                 
                //  provider.selectedImage==null?
                 InkWell(
                    onTap: (){
                      provider.selectImage();
                      
                    },
                      child: provider.selectedImage==null?
                      CircleAvatar(radius: 70,
                      backgroundColor: Color.fromARGB(255, 240, 223, 237),)
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
                  customField( 
                    validator: provider.nullcheck,
                icon:Icons.production_quantity_limits ,
                controller: provider.ProductNameController,
                hint: "Product name",
                obscureText:false,
                textInputAction: TextInputAction.next,
                
                ),
                   SizedBox(height: 30,),
                  customField(
                     validator: provider.nullcheck,
                icon:Icons.production_quantity_limits ,
                controller: provider.ProductdescController,
                hint: "Product description",
                obscureText:false,
                textInputAction: TextInputAction.next,
                ),
                   SizedBox(height: 30,),
                  customField(
 validator: provider.nullcheck,                icon:Icons.production_quantity_limits ,
                controller: provider.ProductPriceController,
                hint: "Product price",
                obscureText:false,
                textInputAction: TextInputAction.next,
                type: TextInputType.number,
                ),
                   SizedBox(height: 30,),
                  customField(
                    validator: provider.nullcheck,
                icon:Icons.production_quantity_limits ,
                controller: provider.ProductquantityController,
                hint: "Product quantity",
                obscureText:false,
                textInputAction: TextInputAction.next,
                type: TextInputType.number,
                ),
          
                  SizedBox(height: 35,),
                  ElevatedButton(
                    style: ButtonStyle(
                       backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 175, 76, 124)),
                       textStyle:MaterialStateProperty.all<TextStyle?>(TextStyle(fontSize: 16))
                      ),
                
                    onPressed: (){
          
                    provider.addNewProduct(widget.catId);
                    EasyLoading.showSuccess('Added successfully!');
                  
                   // provider.selectedImage=null;
                    
          
          
          
                  }, child:Text('New product') ,
                 
                ),
                // IconButton(onPressed: (){
                //   AppRouter.NavigateWithReplacemtnToWidget(CategoryScreen());
                // }, icon: Icon(Icons.arrow_forward_ios))
                ],
              ),
            ),
          );
        }
      )
    );}
}