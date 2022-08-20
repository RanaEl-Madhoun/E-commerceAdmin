import 'package:fire3_application_1/Data/Router.dart';
import 'package:fire3_application_1/Data/firestore_Helper.dart';
import 'package:fire3_application_1/Provider/AuthProvider.dart';
import 'package:fire3_application_1/Provider/firestoreProvider.dart';
import 'package:fire3_application_1/Screens/Category/catscreen.dart';
import 'package:fire3_application_1/Screens/ImageSliderView/allslider.dart';
import 'package:fire3_application_1/User/userview.dart';
import 'package:fire3_application_1/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FirstScrssn extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
             

        children: [
              // Row(children:[
              //   IconButton(onPressed: (){
              //    Provider.of<AuthProvider>(context,listen: false).signOut();
              //   }, icon: Icon(Icons.logout,color:Colors.grey,))
              // ]),

          SizedBox(height: 70,),
           InkWell(
             child: Container(

                  child: Center(child: Text("Category",style: GoogleFonts.actor(fontSize: 25,color: Color.fromARGB(255, 117, 18, 54),fontWeight: FontWeight.bold),)),
                    height: 190.0,
                    width: 360,
                   // width: MediaQuery.of(context).size.width - 100.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [Color.fromARGB(255, 195, 230, 234), Color.fromARGB(255, 244, 194, 225)]
            ),
                    borderRadius: BorderRadius.circular(20),
                        //     image: DecorationImage(
                //   image: AssetImage("assets/images/craft1cut.jpg"),
                //      fit: BoxFit.cover
                // ),
                
                   ),
                ),
                onTap: (){
                   AppRouter.NavigateToWidget(CategoryScreen());
                },
           ),
        
          SizedBox(height: 30,),
           InkWell(
             child: Container(
              child: Center(child: Text(
                "Slider",
                style: GoogleFonts.actor(fontSize: 30,color: Color.fromARGB(255, 117, 18, 54),
                fontWeight: FontWeight.bold),)),
                  
                    height: 190.0,
                    width: 360,
                   // width: MediaQuery.of(context).size.width - 100.0,
                    decoration: BoxDecoration(
                         gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [Color.fromARGB(255, 195, 230, 234),
               Color.fromARGB(255, 244, 194, 225),Color.fromARGB(255, 237, 156, 202),
              ]
            ),
              
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 219, 225, 230),
                //     image: DecorationImage(
                //   image: AssetImage("assets/images/shopehpn.png"),
                //      fit: BoxFit.cover
                // ),
                
                   ),
                ),
                onTap: (){
                   AppRouter.NavigateToWidget(SliderScreen());
                },
           ),
          //  ElevatedButton(onPressed: (){
          //   AppRouter.NavigateToWidget(SliderScreen());
          //  }, child: Text("slider")),
             SizedBox(height: 40,),
              InkWell(
             child: Container(
              child: Center(child: Text("View as user",style: GoogleFonts.actor(fontSize: 25,color: Color.fromARGB(255, 117, 18, 54),fontWeight: FontWeight.bold),)),
                  
                    height: 190.0,
                    width: 360,
                   // width: MediaQuery.of(context).size.width - 100.0,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [Color.fromARGB(255, 195, 230, 234),Color.fromARGB(255, 223, 243, 238),
               Color.fromARGB(255, 244, 194, 225)
              ,Color.fromARGB(255, 241, 188, 209),]
            ),
              
                  
                //     image: DecorationImage(
                //   image: AssetImage("assets/images/shopehpn.png"),
                //      fit: BoxFit.cover
                // ),
                
                   ),
                ),
                onTap: (){
                   AppRouter.NavigateToWidget(UserView());
                },
           ),
          
        ],
      ),
    ),
  );
  }

}