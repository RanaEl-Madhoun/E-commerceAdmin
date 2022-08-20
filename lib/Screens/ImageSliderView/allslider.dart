import 'package:fire3_application_1/Screens/ImageSliderView/newSlider.dart';
import 'package:fire3_application_1/Screens/ImageSliderView/sliderWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Data/Router.dart';
import '../../Provider/firestoreProvider.dart';

class SliderScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  floatingActionButton: home(),
      body: Consumer<FireStoreProvider>(
        builder: (context,provider,x) {
      
          return 
              provider.imagesliderslist==null?
              Center(child: CircularProgressIndicator(),):
          ListView.builder(
            itemCount:  provider.imagesliderslist.length,
            itemBuilder:(context,index){
              return SliderWidget(provider.imagesliderslist[index]);
             
            },
          );
        }
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          AppRouter.NavigateToWidget(AddimageSlider());
        },
        label: const Text('Add new slider'),
        backgroundColor: Color.fromARGB(255, 227, 159, 182),
      ),
    
    );
  }
}