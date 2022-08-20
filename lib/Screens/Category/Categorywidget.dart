import 'package:fire3_application_1/Data/Router.dart';
import 'package:fire3_application_1/Provider/firestoreProvider.dart';
import 'package:fire3_application_1/Screens/Category/updateCat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../models/Category.dart';

class CategoeyWidget extends StatelessWidget{
  Category category;
  CategoeyWidget(this.category);
  @override
  Widget build(BuildContext context) {
    return 
      Container(child:
        Column(
            children: [
             
              SizedBox(height: 10,),
              
             Row(children: [
              SizedBox(width: 30,),
              // Container(
              //   decoration: BoxDecoration(  color: Color.fromARGB(255, 222, 208, 217),
              //     borderRadius: BorderRadius.circular(25)),
              //   padding: EdgeInsets.only(top:3,bottom:3,left: 6,right: 6),
              
              //   // child: Text(category.name,style:GoogleFonts.dynalight(fontSize: 27)
              //   // //TextStyle(fontWeight:FontWeight.w600,fontSize: 16 ),
              //   // ),
              // ),
              Spacer(),
              IconButton(onPressed: (){
                Provider.of<FireStoreProvider>(context,listen: false)
                .categoryNameController.text=category.name;
                AppRouter.NavigateToWidget(updateCategory(category)
              );}, icon: Icon(Icons.edit,color: Colors.grey,)),
                 IconButton(onPressed: (){
                Provider.of<FireStoreProvider>(context,listen: false).deleteCategory(category);
               }, icon:Icon(Icons.delete,color: Colors.grey,))
    
             ],) ,SizedBox(height: 3,),
    //          Container(height: 200,
    //      //  width:MediaQuery.of(context).size.width ,
    //       width: 300,
    //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
    //        // child: Image.network(category.imageUrl,fit: BoxFit.fill,),
    // ),
   
      //  Container(  
      // width: 360,      
      //  decoration: BoxDecoration(    
      //            borderRadius: BorderRadius.circular(20),    
      //                   ),         
      //                     child: ClipRRect(       
      //                           borderRadius: BorderRadius.circular(20),       
      //                               child: Image.network(category.imageUrl,    
      //                                        fit: BoxFit.cover, 
      //                                                  width: 300,
      //                                                     height: 200,        
      //                                                        ),         ),       ),
   Container(
         child: Center( child:Container(
                decoration: BoxDecoration(  color: Color.fromARGB(255, 222, 208, 217),
                  borderRadius: BorderRadius.circular(25)),
                padding: EdgeInsets.only(top:1,bottom:1,left: 30,right: 30),
              
                child: Text(category.name,style:GoogleFonts.dynalight(fontSize: 27)
                //TextStyle(fontWeight:FontWeight.w600,fontSize: 16 ),
                ),
              ),),
         height: 190.0,
         width: 360,
        // width: MediaQuery.of(context).size.width - 100.0,
         decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(20),
         color: Color.fromARGB(255, 219, 225, 230),
         image: DecorationImage(
                image: NetworkImage(category.imageUrl),
          fit: BoxFit.cover
              ),
              
                 ),
              ),
            ],
          ),
        
      
    );
  }

}