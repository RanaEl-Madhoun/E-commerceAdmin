class user{
  String?id;
  String? name;
  String? email;
  String? phone;
  String? password;
  user({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone
  });
  user.fromMap(Map<String,dynamic>map){
   
    email:map['email']??'';
   name: map['name']??'';
   //password:map['password']??'';
   id:map['id']??'';
   phone:map['phone']??'';

  }
Map<String,dynamic>toMap(){
  return{
    'email':email,
    'name':name,
    'id':id,
    'phone':phone
  };
}

}