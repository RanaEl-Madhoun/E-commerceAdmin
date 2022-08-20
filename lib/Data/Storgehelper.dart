import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class Storgehelper {
  Storgehelper._();
 static Storgehelper storgehelper=Storgehelper._();
  FirebaseStorage firebaseStorage=FirebaseStorage.instance;
  
  Future<String> UplodeImage(File file)async{
    String filename=file.path.split('/').last;
    Reference ref=firebaseStorage.ref(filename);
   TaskSnapshot taskSnapshot= await ref.putFile(file);
   String imageUrl=await ref.getDownloadURL();

    return imageUrl;

  }
  



}