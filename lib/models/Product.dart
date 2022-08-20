class Product{
 late String id;
 late  String name;
  late String description;
  late String image;
 late  int quantity;
 late  num price;
   Product({
    required this.name,
    required this.description,
    required this.price,
    required this.quantity, 
    required this.image

   });
   Product.fromMap(Map<String,dynamic>map){
    id=map['id'];
    name=map['name'];
    description=map['description'];
    price=map['price'];
    quantity=map['quantity'];
    image=map['image'];

   }
  toMap(){
    return{
      'name':name,
      'description':description,
      'price':price,
      'quantity':quantity,
      'image':image

    };
   }
}