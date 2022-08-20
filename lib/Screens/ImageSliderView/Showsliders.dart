import 'package:fire3_application_1/Data/Router.dart';
import 'package:fire3_application_1/Screens/ImageSliderView/allslider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class showsliders extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(child:Text("Sliders") ,onPressed: (){
              AppRouter.NavigateToWidget(SliderScreen());
            },)
            
          )
        ],
      ),
    );
    // TODO: implement build
  }


}