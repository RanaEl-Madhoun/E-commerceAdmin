import 'package:fire3_application_1/Data/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class sign extends StatelessWidget{
  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Sign in"),),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(onPressed: (){
            AuthHelper.authHelper.signup("Rana@gmail.com", "password");

            }, child: Text("Sign in"))
            ,
          )
        ],
      ),
    );
  }

}