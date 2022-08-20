import 'package:fire3_application_1/Data/auth.dart';
import 'package:fire3_application_1/Provider/AuthProvider.dart';
import 'package:fire3_application_1/Screens/Welcome/components/welcome_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/splsh.dart';

class splash extends StatelessWidget{
  navfunction(BuildContext context)async{
    await Future.delayed(Duration(seconds: 3));
    Provider.of<AuthProvider>(context,listen: false).checkuser();
  }
  @override
  Widget build(BuildContext context) {
    navfunction(context);
    // TODO: implement build
return Scaffold(
  body: 
  
   
      
       splashimage()
   
  
);
  }

}