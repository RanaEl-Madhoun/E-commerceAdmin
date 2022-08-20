import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class splashimage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
return Scaffold(
   backgroundColor: Color.fromARGB(255, 239, 198, 183),
  body: Column(
    children: [
      SizedBox(height: 150,),
      Text("From our hands to yours",style: GoogleFonts.dancingScript(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w500),),
      SizedBox(height: 10,),
      Text("Support little bussineses",style: GoogleFonts.raleway(color: Colors.white,fontSize: 14)),
      Container(
       
       // width: 200,
       // width: MediaQuery.of(context).size.width,
        height: 600,
        child:  Image(image: AssetImage('assets/images/splash4pn-removebg-preview.png'),),
      ),
     
    ],
  )

);
  }

}
void main(List<String> args) {
  runApp(MaterialApp(home: splashimage(),));
}