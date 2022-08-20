import 'package:fire3_application_1/Screens/Category/catscreen.dart';
import 'package:fire3_application_1/models/Category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import '../../Data/Router.dart';
import '../../Provider/firestoreProvider.dart';

class updateCategory extends StatelessWidget{
  Category category;
  updateCategory(this.category);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
 return Scaffold(
 
      body: Consumer<FireStoreProvider>(
        builder: (context,provider,x) {
          return Form(
            key:provider.updateCategorykey,
            child: Padding(
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
                   //  provider.selectedImage=null;
                      provider.categoryNameController.clear();
                      
                     
                    }, icon: Icon(Icons.restart_alt))
                    ],
                    ),
                 provider.selectedImage==null?
                    InkWell(
                        onTap: (){
                          provider.selectImage();
                        },
                        child: CircleAvatar(radius: 80,backgroundColor: Colors.teal,backgroundImage: NetworkImage(category.imageUrl),)
                        ):
                    CircleAvatar(
                        backgroundImage: FileImage(provider.selectedImage!),
                        radius: 80
                    ),
                    SizedBox(height: 20,),
                
                 
                  
                  SizedBox(height: 20,),
                TextField(controller: provider.categoryNameController,),
                  SizedBox(height: 30,),
                  ElevatedButton(onPressed: (){
                    // provider.updateCategory(Category(name:
                    //  provider.categoryNameController.text,
                    //   imageUrl: provider.selectedImage?.path??category.imageUrl));
                 //   EasyLoading.showSuccess('Added successfully!');
                 Provider.of<FireStoreProvider>(context,listen: false).updateCategory(category);
                        //  AppRouter.NavigateToWidget(MainPage());
                  
                   // provider.selectedImage=null;
                    
          
          
          
                  }, child:Text('update Category') ,
                 
                ),
               
                ],
              ),
            ),
          );
        }
      )
    );}
    }