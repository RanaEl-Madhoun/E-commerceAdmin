import 'package:fire3_application_1/Data/auth.dart';
import 'package:fire3_application_1/Provider/firestoreProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';


import 'Data/Router.dart';
import 'Provider/AuthProvider.dart';
import 'Screens/ImageSliderView/Showsliders.dart';
import 'Screens/Welcome/welcome_screen.dart';
import 'Splash.dart';
import 'constants.dart';
import 'firebase_options.dart';

void main()async {

   WidgetsFlutterBinding.ensureInitialized();
    
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
 runApp(MultiProvider(providers: 
 [
  ChangeNotifierProvider<AuthProvider>(create: (BuildContext context) { 
        return AuthProvider();
       },),
       ChangeNotifierProvider<FireStoreProvider>(create: (BuildContext context) { 
        return FireStoreProvider();
       },),
       ],
       child: MyApp(),) );
 }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
    
        navigatorKey: AppRouter.navKey,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Auth',
        theme: ThemeData(
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: Colors.white,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: kPrimaryColor,
                shape: const StadiumBorder(),
                maximumSize: const Size(double.infinity, 56),
                minimumSize: const Size(double.infinity, 56),
              ),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              fillColor: kPrimaryLightColor,
              iconColor: kPrimaryColor,
              prefixIconColor: kPrimaryColor,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: defaultPadding),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide.none,
              ),
            )),
        home:  splash(),
        builder:   EasyLoading.init(),
      );
   
  }
}
