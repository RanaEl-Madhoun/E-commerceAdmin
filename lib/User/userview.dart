import 'package:fire3_application_1/Provider/firestoreProvider.dart';
import 'package:fire3_application_1/User/userSLider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Data/Router.dart';
import '../Provider/AuthProvider.dart';
import '../Screens/ImageSliderView/sliderWidget.dart';
import '../Screens/Product/all_product.dart';
import '../Screens/Product/productwidget.dart';
import 'Card.dart';
import 'categortname.dart';

class UserView extends StatelessWidget{
  // String catId='1';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   
return Scaffold(
  //appBar: AppBar(),
  
  body:SingleChildScrollView(
    child: Consumer<FireStoreProvider>(
      
      builder:((context, provider, x) {
     return   provider.imagesliderslist.isEmpty&&provider.categories.isEmpty?
  
          Center(child: CircularProgressIndicator(),):
       // provider.getAllsliders();
         SingleChildScrollView(
           child: Column(
            
               
            children: [
              SizedBox(height: 10,),
              Row(children:[
             
              ]),
              SizedBox(height: 50 ,),
              CarouselSlider.builder  (
                itemCount: provider.imagesliderslist.length
              ,  itemBuilder:(context,index,x){
            // provider.imagesliderslist.isEmpty?
            //        CircularProgressIndicator():
                
                return    UserSliderWidget(provider.imagesliderslist[index]);
                     
                    },
              options: CarouselOptions(autoPlay: true,
              height: 270,
              enlargeCenterPage: true,
              viewportFraction: .9,
              aspectRatio: 1.0,
              initialPage: 0,) ),
               //       ElevatedButton(
               //   onPressed: () => provider.buttonCarouselController.nextPage(
               //       duration: Duration(milliseconds: 300), curve: Curves.linear),
               //   child: Text('→'),
               // )
             //  SizedBox(height: 5),
               Row(
         
            children: [
              SizedBox(width: 15,),
              Text("Category",style: GoogleFonts.lato(fontSize: 30,fontWeight: FontWeight.w500)),
              SizedBox(height: 20,),
             
            ],
               ),
             
               SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                
                   child: GridView.builder(
                    padding: EdgeInsets.all(20),
                    shrinkWrap: true,
                       itemCount:  provider.categories.length,
                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,mainAxisSpacing: 5,crossAxisSpacing: 10),
           

                itemBuilder:(context,index){
                      return InkWell(
              onTap: (){
        
                provider.getAllProductsa(provider.categories[index].catId!);
                

                // AppRouter.NavigateToWidget(
                //   ProductScreen(provider.categories[index].catId!));

              },
                child: Namedcategori(provider.categories[index])
                );
                    },),
                 
               ),
               SizedBox(height: 10,),
                Row(
         
            children: [
              SizedBox(width: 15,),
              Text("Product",style: GoogleFonts.lato(fontSize: 30,fontWeight: FontWeight.w500)),
             // SizedBox(height: 20,),
             
            ],
               ),
               SizedBox(height: 10,)
              , TextField(
                  controller: provider.Searchcont,
                   decoration: InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: 'Search...'),
                onChanged: ((value) {
                  provider.Searchcont.text=value;
                }),
              
               ),
              
                          
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisSpacing: 10.0,
                                      mainAxisSpacing: 15.0,
                                      childAspectRatio: 0.8,
                                      crossAxisCount: 2),
                              // crossAxisCount: 2,
                              primary: false,
                              itemCount: provider.products.length,
                              itemBuilder: (context, index) {
                                return buildCard(
                                 provider.products[index]
                                );
                              },
                            ),
                          )

              
         
            ],
               ),
         );
  
  
      }),
      
    ),
  )
//   body:Column(
//     children: [
// CarouselSlider.builder(itemCount: itemCount, itemBuilder: itemBuilder, options: options)

//     ],
//   )
);  }

}