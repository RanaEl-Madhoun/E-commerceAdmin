import 'package:fire3_application_1/Screens/Category/updateCat.dart';
import 'package:fire3_application_1/models/imageSlider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Data/Router.dart';
import '../../Provider/firestoreProvider.dart';

class SliderWidget extends StatelessWidget{
  ImageSlider imageSlider;
 SliderWidget(this.imageSlider);
  @override
  Widget build(BuildContext context) {
    return 
      Container(child:
        Column(
            children: [
             
              SizedBox(height: 10,),
              
             Row(children: [
              SizedBox(width: 30,),
              Container(
                decoration: BoxDecoration(  color: Color.fromARGB(255, 248, 244, 246),
                  borderRadius: BorderRadius.circular(15)),
                padding: EdgeInsets.only(top:1,bottom:1,left: 20,right: 30),
              
                child: Text(imageSlider.title,style:GoogleFonts.sourceSansPro(fontSize: 19)
                //TextStyle(fontWeight:FontWeight.w600,fontSize: 16 ),
                ),
              ),
              Spacer(),
             
                 IconButton(onPressed: (){
                Provider.of<FireStoreProvider>(context,listen: false).deleteSlider(imageSlider);
               }, icon:Icon(Icons.delete,color: Colors.grey,))
    
             ],) ,SizedBox(height: 3,),
    
   Container(
       
         height: 190.0,
         width: 360,
        // width: MediaQuery.of(context).size.width - 100.0,
         decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(20),
         color: Color.fromARGB(255, 219, 225, 230),
         image: DecorationImage(
                image: NetworkImage(imageSlider.imagesliderUrl),
          fit: BoxFit.cover
              ),
              
                 ),
              ),
  // Container(
  //   decoration: BoxDecoration(
  //     image: DecorationImage(
  //              image: NetworkImage(imageSlider.imagesliderUrl),
  //         fit: BoxFit.cover
  //              ),
  //      ),
  // )
            ],
          ),
        
      
    );
  }

}