import 'package:string_validator/string_validator.dart';

class valditions{
  valditions._();
  nullcheck(String?v){
    if(v==null||v.isEmpty){
      return "This field required";
    }

   }
   Emailvalditon(String value){
    if(!isEmail(value)){
      return "Invalid Email syntax";
    }

   }Passwordvalditon(String value){
    if(value.length<6){
      return "Your password must be larger than that";
    }
   }

}