class ImageSlider {
 late String imagesliderUrl;
late  String title;
String?sliderid;
  ImageSlider({
    this.sliderid,
    required this.imagesliderUrl,
    required this.title
  });

ImageSlider.fromMap(Map<String,dynamic>map){
  sliderid=map['sliderid'];
  imagesliderUrl=map['imagesliderUrl'];
  title=map['title'];


}
toMap(){
  return{
    'imagesliderUrl':imagesliderUrl,
    'title':title
  };
}

}