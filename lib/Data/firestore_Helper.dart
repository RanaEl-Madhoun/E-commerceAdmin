import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire3_application_1/models/Product.dart';
import 'package:fire3_application_1/models/imageSlider.dart';

import '../models/Category.dart';

import '../models/user.dart';

class FirestoreHelper{
  FirestoreHelper._();
 static FirestoreHelper firestoreHelper=FirestoreHelper._();
  FirebaseFirestore firestoreinstance=FirebaseFirestore.instance;
addUserToFireStore(user appuser)async{
     firestoreinstance.collection("user").doc(appuser.id!).set(appuser.toMap());
}

  Future<user> getUserFromFireStore(String id)async{
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await firestoreinstance.collection("user").doc(id).get();
    documentSnapshot.data();
    return user.fromMap(documentSnapshot.data()!);
  }
  CollectionReference<Map<String, dynamic>>  firebaseInstancecategory = FirebaseFirestore.instance.collection('categories');
   CollectionReference<Map<String, dynamic>>  firebaseInstanslider = FirebaseFirestore.instance.collection('Slider');

 Future<Category> addCategoryToFireStore(Category category)async{
   DocumentReference<Map<String, dynamic>> documentReference=await 
   firebaseInstancecategory.add(category.toMap());
   category.catId=documentReference.id;
   return category;
  }
  //////////
  Future<List<Category>> getCategoryFromFireStore()async{
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await firebaseInstancecategory.get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =querySnapshot.docs;
    List<Category> categories = documents.map((e){
      Category category = Category.fromMap(e.data());
      category.catId=e.id;
      return category;
    }).toList();
    return categories;
  }
  

  deleteCategory(Category category)async {
   await firebaseInstancecategory.doc(category.catId).delete();
  }
  updateCategory(Category category) async{
   await FirebaseFirestore.instance.collection('categories').
   doc(category.catId).
   update(category.toMap());
  }
  ///////
   
  ///
 Future<Product> addNewProduct(Product product,String catId)async{
   DocumentReference<Map<String, dynamic>> documentReference=await FirebaseFirestore.instance
    .collection("categories")
    .doc(catId)
    .collection("products")
    .add(product.toMap());
    product.id=documentReference.id;
    return product;

  }
 Future<List<Product>> getAllProducts(String catId)async{
  QuerySnapshot<Map<String, dynamic>>querySnapshot= await FirebaseFirestore.instance
    .collection("categories")
    .doc(catId)
    .collection("products")
   .get();
  List<Product>products= querySnapshot.docs.map((e){
    
    Map<String,dynamic>data=e.data();
    data['id']=e.id;
    Product product=Product.fromMap(data);
    return product;

   }).toList();
return products;
 }

 
  deleteProduct(Product product,String catId)async{
    await  FirebaseFirestore.instance
    .collection("categories")
    .doc(catId)
    .collection("products")
    .doc(product.id).
   delete();

  }
  updateProduct(Product product,String catId)async{
    await firebaseInstancecategory.
    doc(catId).collection('products').
    doc(product.id).
    update(product.toMap());

  }
  ////////////////////////
  //imageSlider
  CollectionReference<Map<String,dynamic>> imagesliderinstance=FirebaseFirestore.instance.collection('Slider');
 Future<List<ImageSlider>> getAllSliders()async{
  QuerySnapshot<Map<String, dynamic>> querySnapshot =await imagesliderinstance.get();
 List<QueryDocumentSnapshot<Map<String, dynamic>>> DocumentSnapshot= querySnapshot.docs;
 List<ImageSlider> sliderslist=DocumentSnapshot.map((e){
  ImageSlider sliderimage=ImageSlider.fromMap(e.data());
  sliderimage.sliderid=e.id;
  return sliderimage;

 }).toList();

return sliderslist;
  }
 Future<ImageSlider>addNweSlider(ImageSlider imageSlider )async{

  DocumentReference<Map<String, dynamic>>docref= await imagesliderinstance.
  add(imageSlider.toMap());
  imageSlider.sliderid=docref.id;
  return imageSlider;

  }
 deleteSlider(ImageSlider imageSlider)async{
  imagesliderinstance.doc(imageSlider.sliderid).delete();

 }

  }
 
 
    
/*
 Future<List<Category>> getCategoryFromFireStore()async{
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await firebaseInstancecategory.get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =querySnapshot.docs;
    List<Category> categories = documents.map((e){
      Category category = Category.fromMap(e.data());
      category.catId=e.id;
      return category;
    }).toList();
    return categories;
  }
*/ 