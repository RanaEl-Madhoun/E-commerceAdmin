import 'package:fire3_application_1/Data/Router.dart';
import 'package:fire3_application_1/User/userview.dart';
import 'package:fire3_application_1/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ClickedProduct extends StatelessWidget{
  Product product;
  ClickedProduct(this.product);

  
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
     //backgroundColor: Colors.blueGrey,
  backgroundColor: Color.fromARGB(255, 251, 238, 221),
     body: Padding(
      padding: EdgeInsets.only(top: 50,left: 30,right: 20,bottom: 20),
       child: Column(
        children: [
          Row( 
            children: [
              IconButton(onPressed: (){
                AppRouter.NavigateToWidget(UserView());
                
              }, icon:Icon (Icons.arrow_back_ios,color: Color.fromARGB(255, 223, 222, 222),)),
              Spacer(),
              
              
     
          ],
          ),
          Center(
            child: Container
            
            ( width: 450,
            height: 250,
              decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(20),
         color: Color.fromARGB(255, 219, 225, 230),
         image: DecorationImage(
                image: NetworkImage(product.image),
          fit: BoxFit.cover
              ),
              
                 ),
            // Image.network(product.image,width: 500,height: 350,)
            )
          ),
          SizedBox(height: 20,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
               
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      
                   
                      SizedBox(height: 10,),
                      Column(

                        children: [
                          Center(child: Text(product.name,style: GoogleFonts.robotoMono(fontSize: 24,fontWeight: FontWeight.w400))),
                          SizedBox(height: 20,),
                          Row(
                            children: [

                              Text("Price : ",style: TextStyle(fontSize: 16),),
                              SizedBox(width: 20,),
                              Text('\$'+(product.price).toString())
        



                            ],
                          ),
                          SizedBox(height: 30,),
                          Row(
                            children: [
                              Text(
                                "Description : ",style: TextStyle(fontSize: 16),
                              
                                
                              ),
                              SizedBox(width: 20,),
                              Expanded(child:Text(product.description),)
                            ],
                          ),
               
  
                        ],
                      
                      )
             
                      

                    ],
                  ),
                ),
                //color: Colors.white,
                width: 400,
                height: 200,
                decoration: BoxDecoration(
                  color:  Color.fromARGB(255, 224, 223, 223).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20)
                ),
               
              ),
            )
            )
        ],
       ),
     ),
     
    );
  }

}
void main(List<String> args) {
 
}