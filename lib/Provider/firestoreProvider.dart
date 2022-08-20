import 'dart:developer';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:fire3_application_1/Data/auth.dart';
import 'package:fire3_application_1/Provider/AuthProvider.dart';
import 'package:fire3_application_1/models/Product.dart';
import 'package:fire3_application_1/models/imageSlider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Data/Storgehelper.dart';
import '../Data/firestore_Helper.dart';

import 'dart:io';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import '../models/Category.dart';

class FireStoreProvider extends ChangeNotifier{
  FireStoreProvider(){
    getAllCategory();
    getAllsliders();
  }
  
   GlobalKey<FormState>newCategorykey=GlobalKey<FormState>();
    GlobalKey<FormState>newproductkey=GlobalKey();
    GlobalKey<FormState>updateCategorykey=GlobalKey();
    GlobalKey<FormState>updateProductkey=GlobalKey();
   
  TextEditingController categoryNameController = TextEditingController();
  TextEditingController imageSlidercontroller = TextEditingController();
  CarouselController buttonCarouselController = CarouselController();

  TextEditingController ProductNameController = TextEditingController();
  TextEditingController Searchcont = TextEditingController();
   TextEditingController ProductdescController = TextEditingController();
  TextEditingController ProductPriceController = TextEditingController();
  TextEditingController ProductquantityController = TextEditingController();
  File? selectedImage;
  List<Category> categories=[];
  
   List<Product> products=[];
  List<ImageSlider>imagesliderslist=[];
  selectImage()async{
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    selectedImage = File(xfile!.path);
    notifyListeners();
  }
   String? nullcheck(String?v){
    if(v==null||v.isEmpty){
      return "This field required";
    }}
  

  addNewCategory()async{
    if(selectedImage!=null||newCategorykey.currentState!.validate()){
      String imageUrl = await Storgehelper.storgehelper.UplodeImage(selectedImage!);
      Category category = Category(name:categoryNameController.text,imageUrl: imageUrl);


    Category newCategory=await FirestoreHelper.
    firestoreHelper.addCategoryToFireStore(category);
    
    categories.add(newCategory);
  //  selectedImage=null;
   categoryNameController.clear(); 
    // notifyListeners();
    getAllCategory();
    }
    
  }
  getAllCategory()async{
    categories = await FirestoreHelper.firestoreHelper.getCategoryFromFireStore();
    notifyListeners();
  }
 updateCategory(Category category)async{
    String? imageUrl;
    if(selectedImage!=null){
       imageUrl = await Storgehelper.storgehelper.UplodeImage(selectedImage!);
    }
    Category newCategory = Category(name: 
    categoryNameController.text, imageUrl: imageUrl??category.imageUrl);
    newCategory.catId=category.catId;
   await FirestoreHelper.firestoreHelper.updateCategory(newCategory);
   selectedImage=null;
   categoryNameController.clear();
   getAllCategory();
  }
  deleteCategory(Category category)async{
await FirestoreHelper.firestoreHelper.deleteCategory(category);
categories.removeWhere((element) => element.catId==category.catId);
notifyListeners();
  }
  /////////////////////////////////////////////////////////
  //Product
  getAllProductsa(String catId)async{

     products = await FirestoreHelper.firestoreHelper.getAllProducts(catId);
    notifyListeners();

  }
  addNewProduct(String catId)async{
    if(selectedImage!=null||newproductkey.currentState!.validate()){
      String imageUrl = await Storgehelper.storgehelper.UplodeImage(selectedImage!);
      Product product = Product(
        name:ProductNameController.text,
       description: ProductdescController.text,
       price:num.parse (ProductPriceController.text),
       quantity: int.parse(ProductquantityController.text),

       image: imageUrl
       );


    Product aNewProduct=
    await FirestoreHelper.firestoreHelper .addNewProduct(product, catId);
    selectedImage=null;
   ProductNameController.clear(); 
   ProductPriceController.clear;
   ProductdescController.clear();
   ProductquantityController.clear();
    products.add(aNewProduct);
    
    // notifyListeners();
    getAllProductsa(catId);
    }

  }
updateProduct(Product product,String catId)async{
    String? imageUrl;
    if(selectedImage!=null){
      imageUrl = await Storgehelper.storgehelper.UplodeImage(selectedImage!);
    }
    Product newproduct = Product(
        name: ProductNameController.text,
        description: ProductdescController.text,
        price: num.parse(ProductPriceController.text),
        quantity: int.parse(ProductquantityController.text),
        image: imageUrl??product.image
        );
    newproduct.id =product.id;
    await FirestoreHelper.firestoreHelper.updateProduct(newproduct,catId);
    //selectedImage=null;
    //ProductNameController.clear();
    notifyListeners();
     getAllProductsa(catId);
  }

  deleteProduct(Product product,String catId)async{
    await FirestoreHelper.firestoreHelper.deleteProduct(product, catId);
    getAllProductsa(catId);
  }
  /////////////////////
  ///Slider
  getAllsliders()async{
  imagesliderslist=await  FirestoreHelper.firestoreHelper.getAllSliders();
  notifyListeners();
    
  }
  addNewSlider()async{
    if(selectedImage!=null){
       String imageUrl = await Storgehelper.storgehelper.UplodeImage(selectedImage!);
          ImageSlider imageSliders=ImageSlider(imagesliderUrl: imageUrl, title: imageSlidercontroller.text);
      FirestoreHelper.firestoreHelper.addNweSlider(imageSliders);
      imagesliderslist.add(imageSliders);
      notifyListeners();
      getAllsliders();
      
    }
    
  }
  deleteSlider(ImageSlider imageSlider){

    FirestoreHelper.firestoreHelper.deleteSlider(imageSlider);
    imagesliderslist.removeWhere((element) => element.sliderid==imageSlider.imagesliderUrl);
  notifyListeners();
  getAllsliders();
  }
}