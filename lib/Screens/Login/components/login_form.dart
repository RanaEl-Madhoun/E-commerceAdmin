import 'package:fire3_application_1/Data/Router.dart';
import 'package:fire3_application_1/Data/firestore_Helper.dart';
import 'package:fire3_application_1/Provider/AuthProvider.dart';
import 'package:fire3_application_1/Screens/Login/components/customTextField.dart';
import 'package:fire3_application_1/Ui/sign.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Signup/signup_screen.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context,provider,x) {  
        return  Form(
          key: provider.login,
        child: Column(
          children: [
            customField(
            validator: provider.Emailvalditon
            ,hint: "Your email",
            type:TextInputType.emailAddress,
            icon:Icons.person,
            controller: provider.emailcontroller,
            textInputAction: TextInputAction.next, 
            obscureText: false,
            
            
            ),
          //   TextFormField(
          //  //   validator:provider.Emailvalditon ,
          //     keyboardType: TextInputType.emailAddress,
          //     textInputAction: TextInputAction.next,
          //     cursorColor: kPrimaryColor,
          //    // onSaved: (email) {},
          //     decoration: InputDecoration(
          //       hintText: "Your email",
          //       prefixIcon: Padding(
          //         padding: const EdgeInsets.all(defaultPadding),
          //         child: Icon(Icons.person),
          //       ),
          //     ),
          //   ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child:customField(validator: provider.Passwordvalditon,
              icon:Icons.lock ,
              controller: provider.passwordcontroller,
              hint: "Your password",
              obscureText:true,
            
              textInputAction: TextInputAction.done,
              )
            //   child: TextFormField(
            //     textInputAction: TextInputAction.done,
            //     obscureText: true,
            //     cursorColor: kPrimaryColor,
            //     decoration: InputDecoration(
            //       hintText: "Your password",
            //       prefixIcon: Padding(
            //         padding: const EdgeInsets.all(defaultPadding),
            //         child: Icon(Icons.lock),
            //       ),
            //     ),
            //   ),
             ),
            const SizedBox(height: defaultPadding),
            Hero(
              tag: "login_btn",
              child: ElevatedButton(
                onPressed: () {
                provider.signin();
            
                    // AppRouter.PopRouter();
                    
                 
                  
                  
                  
                },
                child: Text(
                  "Login".toUpperCase(),
                ),
              ),
            ),
            const SizedBox(height: defaultPadding),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 8,),
            TextButton(onPressed: (){
              provider.forgetPassword();

            }, child: Text("Forget password ?",style: const TextStyle(color: kPrimaryColor),))
          ],
        ),
      );
      },
     
    );
  }
}
