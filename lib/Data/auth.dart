import 'package:fire3_application_1/Data/Router.dart';
import 'package:fire3_application_1/Screens/Category/AddNewCategory.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '../Screens/Firstscreen.dart';
import '../Screens/Login/login_screen.dart';
import '../Screens/Category/catscreen.dart';
import '../User/userview.dart';

class AuthHelper{
  AuthHelper._();
 static AuthHelper authHelper =AuthHelper._();
 FirebaseAuth firebaseAuth= FirebaseAuth.instance;
 Future<UserCredential?> signup(String email,String password) async {
    try {
  final credential = await firebaseAuth.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
   return credential;
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
  }
 Future<UserCredential?> signin(String email,String password) async {
    try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password
  );
  
  return credential;
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}

  }
  
  signout()async{
    await firebaseAuth.signOut();
    AppRouter.NavigateWithReplacemtnToWidget(LoginScreen());
  }
  forgetPassword(String email)async{
    await firebaseAuth.sendPasswordResetEmail(email: email);

  }
  verifyEmail(){
     User?user=firebaseAuth.currentUser;
     user?.sendEmailVerification();

  }
  checkUser()async{
    
    User?user=firebaseAuth.currentUser;
    if (user == null) {
      AppRouter.NavigateToWidget(LoginScreen());
      //NavigateTo(router: WelcomeScreen());
    } else {
      if (user.email == 're487840@gmail.com') {
        AppRouter.NavigateWithReplacemtnToWidget(FirstScrssn());
      } else {
        AppRouter.NavigateWithReplacemtnToWidget( UserView());
      }
    }
  
//  User?user=firebaseAuth.currentUser;
//  if(user==null){
//  AppRouter.NavigateWithReplacemtnToWidget(LoginScreen());
  
//  }
// else{
//    AppRouter.NavigateWithReplacemtnToWidget(FirstScrssn());
// }
  }
}
