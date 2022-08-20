import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Data/Router.dart';
import '../../Provider/firestoreProvider.dart';
import '../Login/components/customTextField.dart';

class AddimageSlider extends StatelessWidget{
    
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
           // key: provider.newCategorykey,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(height: 40,),
                  Row(children: [
                    IconButton(onPressed: (){
                      AppRouter.PopRouter();
                    }, 
                    icon: Icon(Icons.arrow_back_ios_new)
                    ),
                    Spacer(),
                    IconButton(onPressed: (){
                     provider.selectedImage=null;
                      provider.imageSlidercontroller.clear();
                      
                     
                    }, icon: Icon(Icons.restart_alt))
                    ],
                    ),
                 
                //  provider.selectedImage==null?
                 InkWell(
                    onTap: (){
                      provider.selectImage();
                      
                    },
                      child: provider.selectedImage==null?
                      CircleAvatar(radius: 50,
                      backgroundColor: Color.fromARGB(255, 169, 228, 226),)
                      :
                  CircleAvatar(
                    backgroundImage: FileImage(provider.selectedImage!),
                  ),),
                  SizedBox(height: 20,),
                  customField(
                    validator: provider.nullcheck,
                     obscureText: false,
                     controller: provider.imageSlidercontroller),
             //   TextField(controller: provider.categoryNameController,),
                  SizedBox(height: 30,),
                  ElevatedButton(onPressed: (){
                    
                    try {
                      provider.addNewSlider();
      
      ScaffoldMessenger.of(context).showSnackBar(successSnakbar);
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(errorSnack);
    }
                    
          
          
          
                  }, child:Text('New Slider') ,
                 
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
  
final  successSnakbar =  SnackBar(
  content: Text('Added sccessfuly!'),
);
final  errorSnack =  SnackBar(
  content: Text('Error,try agin'),
);

    }